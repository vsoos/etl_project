from sqlalchemy import create_engine, MetaData, Table, select, insert, delete
import pandas as pd
from datetime import timedelta, datetime

# connections to the OLTP and OLAP
oltp_engine = create_engine('mysql+pymysql://user:password@localhost:3308/oltp')
olap_engine = create_engine('mysql+pymysql://user:password@localhost:3309/olap')

def create_time_dimension(engine):
    connection = engine.connect()
    connection.execute("DELETE FROM DimTime;")  # clear existing data

    start_date = datetime(2000, 1, 1)
    end_date = datetime(2030, 12, 31)

    # generate all dates
    current_date = start_date
    while current_date <= end_date:
        date_key = int(current_date.strftime('%Y%m%d'))
        day_name = current_date.strftime('%A')
        year = current_date.year
        month = current_date.month
        day = current_date.day
        quarter = (month - 1) // 3 + 1

        # insert data into DimTime table
        connection.execute(
            "INSERT INTO DimTime (date_key, date, year, quarter, month, day, weekday) VALUES "
            f"({date_key}, '{current_date.date()}', {year}, {quarter}, {month}, {day}, '{day_name}');"
        )
        
        current_date += timedelta(days=1)

    connection.close()

def transform_and_load(engine_src, engine_dst):
    meta = MetaData()
    meta.reflect(bind=engine_src)
    meta.reflect(bind=engine_dst)

    # extract and transform data
    connection_src = engine_src.connect()
    connection_dst = engine_dst.connect()

    # UserGroups first because of foreign key constraints
    user_groups = Table('UserGroups', meta, autoload_with=engine_src)
    dim_user_groups = Table('DimUserGroups', meta, autoload_with=engine_dst)
    group_data = connection_src.execute(select(user_groups)).fetchall()
    connection_dst.execute(delete(dim_user_groups))  # Clear old data
    for data in group_data:
        connection_dst.execute(insert(dim_user_groups), {
            'group_key': data.group_id,
            'name': data.name
        })

    # Users
    users = Table('Users', meta, autoload_with=engine_src)
    dim_users = Table('DimUsers', meta, autoload_with=engine_dst)
    user_data = connection_src.execute(select(users)).fetchall()
    connection_dst.execute(delete(dim_users))  # clear data
    for data in user_data:
        connection_dst.execute(insert(dim_users), {
            'user_key': data.user_id,
            'username': data.username,
            'creation_date': data.creation_date,
            'deletion_date': data.deletion_date,
            'group_key': data.group_id
        })

    # RentalItems
    rental_items = Table('RentalItems', meta, autoload_with=engine_src)
    dim_items = Table('DimItems', meta, autoload_with=engine_dst)
    item_data = connection_src.execute(select(rental_items)).fetchall()
    connection_dst.execute(delete(dim_items))  # clear data
    for data in item_data:
        connection_dst.execute(insert(dim_items), {
            'item_key': data.item_id,
            'name': data.name,
            'description': data.description,
            'creation_date': data.creation_date,
            'deletion_date': data.deletion_date,
            'status': data.status,
            'primary_location': data.primary_location,
            'category_key': data.category_id
        })

    # RentalTransactions
    rental_transactions = Table('RentalTransactions', meta, autoload_with=engine_src)
    fact_rental_transactions = Table('FactRentalTransactions', meta, autoload_with=engine_dst)
    transaction_data = connection_src.execute(select(rental_transactions)).fetchall()
    connection_dst.execute(delete(fact_rental_transactions))  # clear data
    for data in transaction_data:
        connection_dst.execute(insert(fact_rental_transactions), {
            'transaction_id': data.transaction_id,
            'rental_date_key': int(data.rental_date.strftime('%Y%m%d')),
            'due_date_key': int(data.due_date.strftime('%Y%m%d')) if data.due_date else None,
            'return_date_key': int(data.return_date.strftime('%Y%m%d')) if data.return_date else None,
            'user_key': data.borrowed_by,
            'item_key': data.item_id,
            'borrowed_by_key': data.borrowed_by
        })

    # close connections
    connection_src.close()
    connection_dst.close()

def main():
    create_time_dimension(olap_engine)  # refresh time dimension
    transform_and_load(oltp_engine, olap_engine)  # transform and load data

if __name__ == "__main__":
    main()
