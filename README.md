# Rental Transactions Analytics System (ETL pipeline)

This project encompasses a Dockerized setup of MySQL databases for OLTP and OLAP, it includes a Python script for Extract - Transform - Load (ETL) pipeline processes, and finally an interractive query application that you can run in your terminal.

## Demo
![](https://github.com/vsoos/etl_project/blob/main/demo.gif)

## Prerequisites

To test it you have to have Docker and Docker compose installed on your computer. For running the Python scirps you will need the following libaries installed: 'pandas', 'SQLAlchemy', 'cryptography'.

```sh
pip install pandas
pip install SQLAlchemy
pip install cryptography
```

## Setup

1. Clone repository 

```sh
git clone TBD
cd etl_project
```
2. Run the Database (Docker)
```sh
docker-compose up -d
```
<img width="665" alt="Screenshot 2024-04-29 at 12 12 46" src="https://github.com/vsoos/etl_project/assets/107116615/c50566eb-64fb-4b65-ab39-98bf7da266b7">

## Running ETL script

3. Running ETL Scripts
```sh
cd etl_script
python3 etl.py

```

## The Query APP
4. Queries with the terminal app
```sh
cd terminal
python3 query_app.py
```

5. Greeting output
```sh
Welcome to my OLAP! Here you can look at Rental Transactions Analytics of Random Data.
Please enter a year and a month to analyze:
Year (ex. 2023): 2021
Month (January-December / 1-12): 7
Selected month: July 2021
```

### Example output
```sh
vini@Vincenzinas-MacBook-Air terminal % python3 query_app.py

Welcome to my OLAP! Here you can look at Rental Transactions Analytics of Random Data.
Please enter a year and a month to analyze:
Year (ex. 2023): 2021
Month (January-December / 1-12): 7
Selected month: July 2021

Number of rental transactions in January 2021 grouped daily:
Date: 2021-07-07, Transactions: 1
Date: 2021-07-15, Transactions: 2
Date: 2021-07-24, Transactions: 2

Number of rental transactions in 2021 grouped monthly: 
Month: 1, Transactions: 1
Month: 1, Transactions: 1
Month: 1, Transactions: 1
Month: 1, Transactions: 1
Month: 3, Transactions: 1
Month: 3, Transactions: 1
Month: 4, Transactions: 1
Month: 5, Transactions: 1
Month: 5, Transactions: 1
Month: 6, Transactions: 1
Month: 6, Transactions: 1
Month: 6, Transactions: 1
Month: 7, Transactions: 1
Month: 7, Transactions: 2
Month: 7, Transactions: 2
Month: 9, Transactions: 1
Month: 9, Transactions: 2
Month: 10, Transactions: 1
Month: 11, Transactions: 1
Month: 11, Transactions: 1
Month: 11, Transactions: 1
Month: 12, Transactions: 1
Month: 12, Transactions: 1

Top 10 most borrowed items of all time:
Item: protect, Transactions: 5
Item: learn, Transactions: 5
Item: we, Transactions: 4
Item: life, Transactions: 4
Item: than, Transactions: 4
Item: box, Transactions: 3
Item: wonder, Transactions: 3
Item: top, Transactions: 3
Item: pass, Transactions: 3
Item: work, Transactions: 3

Top 10 most borrowed items in 2021 grouped monthly:
Month: 1, Item: today, Transactions: 1
Month: 1, Item: different, Transactions: 1
Month: 1, Item: learn, Transactions: 1
Month: 1, Item: catch, Transactions: 1
Month: 3, Item: one, Transactions: 1
Month: 3, Item: hear, Transactions: 1
Month: 4, Item: work, Transactions: 1
Month: 5, Item: only, Transactions: 1
Month: 5, Item: away, Transactions: 1
Month: 6, Item: exist, Transactions: 1

Month with most items inserted in 2021:
Month with most items inserted in 2021: 1

Top borrower in 2021 grouped by week: 
Week: 1, User: gregory06, Transactions: 1
Week: 4, User: zgomez, Transactions: 1
Week: 4, User: martinashley, Transactions: 1
Week: 5, User: joshuasmith, Transactions: 1
Week: 9, User: martinashley, Transactions: 1
Week: 11, User: ztran, Transactions: 1
Week: 14, User: xcooke, Transactions: 1
Week: 18, User: stephaniefranco, Transactions: 1
Week: 20, User: anna41, Transactions: 1
Week: 22, User: robertmartinez, Transactions: 1
Week: 23, User: briankennedy, Transactions: 1
Week: 24, User: suarezcalvin, Transactions: 1
Week: 27, User: zgomez, Transactions: 1
Week: 28, User: hineswilliam, Transactions: 1
Week: 28, User: xcooke, Transactions: 1
Week: 29, User: leahsolomon, Transactions: 1
Week: 29, User: margaret70, Transactions: 1
Week: 36, User: nathanielnelson, Transactions: 1
Week: 36, User: xcooke, Transactions: 1
Week: 36, User: briankennedy, Transactions: 1
Week: 41, User: joshuasmith, Transactions: 1
Week: 45, User: joshuasmith, Transactions: 1
Week: 46, User: gregory06, Transactions: 1
Week: 47, User: zgomez, Transactions: 1
Week: 48, User: joshuasmith, Transactions: 1
Week: 50, User: taylorallison, Transactions: 1
Do you want to analyze another year? (yes/no): yes
Please enter a year and a month to analyze:
Year (ex. 2023): 
Month (January-December / 1-12): 
Demo mode: January 2023

Number of rental transactions in January 2023 grouped daily:
Date: 2023-01-25, Transactions: 1

Number of rental transactions in 2023 grouped monthly: 
Month: 1, Transactions: 1
Month: 2, Transactions: 1
Month: 3, Transactions: 1
Month: 4, Transactions: 1
Month: 4, Transactions: 1
Month: 4, Transactions: 1
Month: 5, Transactions: 1
Month: 6, Transactions: 1
Month: 6, Transactions: 1
Month: 6, Transactions: 1
Month: 6, Transactions: 1
Month: 7, Transactions: 1
Month: 8, Transactions: 1
Month: 8, Transactions: 1
Month: 8, Transactions: 1
Month: 10, Transactions: 1
Month: 11, Transactions: 1
Month: 11, Transactions: 1
Month: 11, Transactions: 1
Month: 12, Transactions: 1

Top 10 most borrowed items of all time:
Item: protect, Transactions: 5
Item: learn, Transactions: 5
Item: we, Transactions: 4
Item: life, Transactions: 4
Item: than, Transactions: 4
Item: box, Transactions: 3
Item: wonder, Transactions: 3
Item: top, Transactions: 3
Item: pass, Transactions: 3
Item: work, Transactions: 3

Top 10 most borrowed items in 2023 grouped monthly:
Month: 1, Item: market, Transactions: 1
Month: 2, Item: already, Transactions: 1
Month: 3, Item: we, Transactions: 1
Month: 4, Item: than, Transactions: 2
Month: 4, Item: morning, Transactions: 1
Month: 5, Item: work, Transactions: 1
Month: 6, Item: than, Transactions: 1
Month: 6, Item: learn, Transactions: 1
Month: 6, Item: more, Transactions: 1
Month: 6, Item: decade, Transactions: 1

Month with most items inserted in 2023:
Month with most items inserted in 2023: 3

Top borrower in 2023 grouped by week: 
Week: 4, User: hineswilliam, Transactions: 1
Week: 7, User: nathanielnelson, Transactions: 1
Week: 12, User: taylorallison, Transactions: 1
Week: 13, User: hineswilliam, Transactions: 1
Week: 14, User: leahsolomon, Transactions: 1
Week: 17, User: vmitchell, Transactions: 1
Week: 20, User: ztran, Transactions: 1
Week: 24, User: hineswilliam, Transactions: 1
Week: 24, User: anna41, Transactions: 1
Week: 25, User: leahsolomon, Transactions: 1
Week: 26, User: ruizchristopher, Transactions: 1
Week: 30, User: xcooke, Transactions: 1
Week: 33, User: joshuasmith, Transactions: 1
Week: 35, User: robertmartinez, Transactions: 1
Week: 35, User: anna41, Transactions: 1
Week: 40, User: ztran, Transactions: 1
Week: 45, User: ruizchristopher, Transactions: 1
Week: 45, User: brooke85, Transactions: 1
Week: 47, User: nathanielnelson, Transactions: 1
Week: 52, User: twood, Transactions: 1
Do you want to analyze another year? (yes/no): no
Thank you for using my Analytics tool. Goodbye!
vini@Vincenzinas-MacBook-Air terminal % 
```
