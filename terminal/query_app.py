from sqlalchemy import create_engine, func, select, desc
from sqlalchemy.sql import extract
from datetime import datetime
from sqlalchemy.orm import sessionmaker, relationship
from sqlalchemy import Column, Integer, String, Date, Enum, ForeignKey
from models import FactRentalTransactions, DimTime, DimItems, DimUsers
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date, Enum, ForeignKey, Text
from sqlalchemy.orm import relationship
import calendar

# connection to the OLAP database
engine = create_engine('mysql+pymysql://user:password@localhost:3309/olap')
Session = sessionmaker(bind=engine)
session = Session()

# QUERIES
def transactions_in_month_grouped_weekly(year, month):
    results = session.query(
        extract('week', DimTime.date).label('week'),
        func.count(FactRentalTransactions.transaction_id).label('transaction_count')
    ).join(
        DimTime, FactRentalTransactions.rental_date_key == DimTime.date_key
    ).filter(
        extract('year', DimTime.date) == year,
        extract('month', DimTime.date) == month
    ).group_by(
        'week'
    ).order_by(
        'week'
    ).all()
    
    for week, count in results:
        print(f"Week: {week}, Transactions: {count}")

def transactions_in_month_grouped_daily(year, month):
    results = session.query(
        DimTime.date,
        func.count(FactRentalTransactions.transaction_id).label('transaction_count')
    ).join(
        DimTime, FactRentalTransactions.rental_date_key == DimTime.date_key
    ).filter(
        extract('year', DimTime.date) == year,
        extract('month', DimTime.date) == month
    ).group_by(
        DimTime.date
    ).order_by(
        DimTime.date
    ).all()
    
    for date, count in results:
        print(f"Date: {date}, Transactions: {count}")

def transactions_in_year_grouped_monthly(year):
    results = session.query(
        extract('month', DimTime.date).label('month'),  
        func.count(FactRentalTransactions.transaction_id).label('transaction_count')
    ).join(
        DimTime, FactRentalTransactions.rental_date_key == DimTime.date_key
    ).filter(
        extract('year', DimTime.date) == year
    ).group_by(
        extract('month', DimTime.date), DimTime.date  # DimTime.date in group by
    ).order_by(
        'month'
    ).all()
    
    for month, count in results:
        print(f"Month: {month}, Transactions: {count}")

def top_10_most_borrowed_items_all_time():
    results = session.query(
        DimItems.name,
        func.count(FactRentalTransactions.transaction_id).label('transaction_count')
    ).join(
        FactRentalTransactions, FactRentalTransactions.item_key == DimItems.item_key
    ).group_by(
        DimItems.name
    ).order_by(
        desc('transaction_count')
    ).limit(10).all()
    
    for item_name, count in results:
        print(f"Item: {item_name}, Transactions: {count}")


def top_10_most_borrowed_items_yearly_grouped_monthly(year):
    results = session.query(
        extract('month', DimTime.date).label('month'),
        DimItems.name,
        func.count(FactRentalTransactions.transaction_id).label('transaction_count')
    ).join(
        DimTime, FactRentalTransactions.rental_date_key == DimTime.date_key
    ).join(
        DimItems, FactRentalTransactions.item_key == DimItems.item_key
    ).filter(
        extract('year', DimTime.date) == year
    ).group_by(
        extract('month', DimTime.date), DimItems.name  # both columns in group by
    ).order_by(
        'month', desc('transaction_count')
    ).limit(10).all()
    
    for month, item_name, count in results:
        print(f"Month: {month}, Item: {item_name}, Transactions: {count}")


def month_with_most_items_inserted(year):
    results = session.query(
        extract('month', DimItems.creation_date).label('month'),
        func.count(DimItems.item_key).label('insert_count')
    ).filter(
        extract('year', DimItems.creation_date) == year
    ).group_by(
        'month'
    ).order_by(
        desc('insert_count')
    ).first()
    
    if results:
        print(f"Month with most items inserted in {year}: {results.month}")

def top_borrower_in_year_grouped_by_week(year):
    results = session.query(
        extract('week', DimTime.date).label('week'),
        DimUsers.username,
        func.count(FactRentalTransactions.transaction_id).label('transaction_count')
    ).join(
        DimTime, FactRentalTransactions.rental_date_key == DimTime.date_key
    ).join(
        DimUsers, FactRentalTransactions.borrowed_by_key == DimUsers.user_key
    ).filter(
        extract('year', DimTime.date) == year
    ).group_by(
        'week', DimUsers.username
    ).order_by(
        'week', desc('transaction_count')
    ).all()
    
    for week, username, count in results:
        print(f"Week: {week}, User: {username}, Transactions: {count}")

def get_month_name(month_num):
    return calendar.month_name[month_num]
  
# asking for uer input, printing out analytics
def analyze_transactions():
    print("Please enter a year and a month to analyze:")
    user_input_year = input("Year (ex. 2023): ")
    user_input_month = input("Month (January-December / 1-12): ")

    if user_input_year.strip() and user_input_month.strip():
        year = int(user_input_year)
        month = int(user_input_month)
        print("Selected month:", get_month_name(month), year)
    else:
        print("Demo mode: January 2023")
        year = 2023
        month = 1

    print("\n")
    print(f"Number of rental transactions in January {year} grouped daily:")
    transactions_in_month_grouped_daily(year, month)

    print("\n")
    print(f"Number of rental transactions in {year} grouped monthly: ")
    transactions_in_year_grouped_monthly(year)

    print("\n")
    print("Top 10 most borrowed items of all time:")
    top_10_most_borrowed_items_all_time()

    print("\n")
    print(f"Top 10 most borrowed items in {year} grouped monthly:")
    top_10_most_borrowed_items_yearly_grouped_monthly(year)

    print("\n")
    print(f"Month with most items inserted in {year}:")
    month_with_most_items_inserted(year)

    print("\n")
    print(f"Top borrower in {year} grouped by week: ")
    top_borrower_in_year_grouped_by_week(year)

# MAIN
def main():
    print("\n")
    print("Welcome to my OLAP! Here you can look at Rental Transactions Analytics of Random Data.")
    analyze_transactions()

    while True:
        another_year = input("Do you want to analyze another year? (yes/no): ").strip().lower()
        if another_year == 'yes':
            analyze_transactions()
        elif another_year == 'no':
            print("Thank you for using my Analytics tool. Goodbye!")
            break
        else:
            print("Invalid input. Please enter 'yes' or 'no'.")

if __name__ == "__main__":
    main()
  
