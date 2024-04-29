from faker import Faker
import mysql.connector
from mysql.connector import Error
import random

fake = Faker()

# connection to the database
try:
    connection = mysql.connector.connect(
        host='localhost',
        database='rentalservice', # the name of the database on my computer
        user='root',
        password='***' # I did not want to include my own password
    )
    if connection.is_connected():
        cursor = connection.cursor()

        # UserGroups
        for _ in range(5):  # 5 user groups
            group_name = fake.unique.word()
            cursor.execute("INSERT INTO UserGroups (name) VALUES (%s)", (group_name,))

        # into Users

        for _ in range(20): # 20 users
            username = fake.unique.user_name()
            password = fake.password()
            creation_date = fake.date_between(start_date='-5y', end_date='today')
            deletion_date = fake.date_between(start_date='today', end_date='+5y') if random.choice([True, False]) else None
            group_id = random.randint(1, 5) # 5 user groups
            cursor.execute("""
            INSERT INTO Users (username, password, creation_date, deletion_date, group_id)
            VALUES (%s, %s, %s, %s, %s)
            """, (username, password, creation_date, deletion_date, group_id))

        # Categories
        for _ in range(10):  # 10 categories
            category_name = fake.unique.word()
            cursor.execute("INSERT INTO Categories (name) VALUES (%s)", (category_name,))

        # RentalItems
        for _ in range(50):  # 50 rental items
            name = fake.unique.word()
            description = fake.text(max_nb_chars=200)
            creation_date = fake.date_between(start_date='-5y', end_date='today')
            inserted_by = random.randint(1, 20)  # 20 users
            deletion_date = fake.date_between(start_date='today', end_date='+5y') if random.choice([True, False]) else None
            status = random.choice(['free', 'borrowed', 'lost'])
            primary_location = fake.address()
            category_id = random.randint(1, 10)  # 10 categories
            cursor.execute("""
                INSERT INTO RentalItems (name, description, creation_date, inserted_by, deletion_date, status, primary_location, category_id)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """, (name, description, creation_date, inserted_by, deletion_date, status, primary_location, category_id))

        # RentalTransactions
        for _ in range(100):  # 100 transactions
            rental_date = fake.date_between(start_date='-5y', end_date='today')
            due_date = fake.date_between(start_date='today', end_date='+5y')
            borrowed_by = random.randint(1, 20)  # users
            item_id = random.randint(1, 50)  # items
            return_date = fake.date_between(start_date=rental_date, end_date=due_date) if random.choice([True, False]) else None
            cursor.execute("""
                INSERT INTO RentalTransactions (rental_date, due_date, borrowed_by, item_id, return_date)
                VALUES (%s, %s, %s, %s, %s)
            """, (rental_date, due_date, borrowed_by, item_id, return_date))

        connection.commit()

        print("Data inserted successfully")

except Error as e:
    print("Error while connecting to MySQL", e)

finally:
    if connection.is_connected():
        cursor.close()
    connection.close()
    print("MySQL connection is closed")
