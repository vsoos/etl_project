# Rental Transactions Analytics System (ETL pipeline)

This project encompasses a Dockerized setup of MySQL databases for OLTP and OLAP, it includes a Python script for Extract - Transform - Load (ETL) pipeline processes, and finally an interactive query application that you can run in your terminal.

## Demo
![](https://github.com/vsoos/etl_project/blob/main/demo.gif)

## Setup instructions
To test it you have to have Docker and Docker Compose installed on your computer.
For running the Python script you will need the following libraries installed: 'pandas', 'SQLAlchemy' and 'cryptography':

```sh
pip install pandas
pip install SQLAlchemy
pip install cryptography
```
### 1. Clone repository 

```sh
git clone https://github.com/vsoos/etl_project
cd etl_project
```
### 2. Run the Database (Docker)
```sh
docker-compose up -d
```
<img width="665" alt="Screenshot 2024-04-29 at 12 12 46" src="https://github.com/vsoos/etl_project/assets/107116615/c50566eb-64fb-4b65-ab39-98bf7da266b7">

### 3. Run ETL script (etl.py)

```sh
cd etl_script
python3 etl.py
```

### 4. Run the Terminal app (query_app.py)

```sh
cd terminal
python3 query_app.py
```

### 5. Try out the terminal app!
```sh
Welcome to my OLAP! Here you can look at Rental Transactions Analytics of Random Data.
Please enter a year and a month to analyze:
Year (ex. 2023): -- your_input --
Month (January-December / 1-12): -- your_input --
Selected month: January 2023
```

## Development process

### 1. Research
- **ETL**: ETL pipelines using PostgreSQL tutorials from freeCodeCamp on YouTube [[1]](#1).
- **Faker**: Faker for generating synthetic data based on a NeuralNine tutorial on YouTube[[2]](#2).

### 2. Database Schemas
- **OLTP**: Created using DataGrip
- **OLAP**: Developed for analytical processing / extending the OLTP design

### 3. Data Generation and Preparation
- **Data Generation**: with Faker I seeded the OLTP database with random data.
- **Data Export**: MySQL dump to create portable versions of both OLTP and OLAP (mostly to avoid issues with foreign key dependencies)

### 4. Docker
- **Docker Setup**: run OLTP and OLAP databases in SQL containers on different ports (3308:3306 / 3309:3306)

### 5. ETL Pipeline in Python with SQLAlchemy
- **ETL**: wrote Python scripts to extract data from OLTP, transform it, and load it into OLAP, guided by several tutorials and articles on ETL pipeline development [[3]](#3) [[4]](#4) [[5]](#5).

### 6. Query Tool Development
- **Query Application**: developed a terminal tool for data querying and reporting from the OLAP database and used models.oy for abstraction, and to provide readability and ease of use
- **User Interaction**: enhanced user experience by allowing dynamic input with default settings (2023 / January upon clicking e.g. Enter)

## References
<a id="1">[1]</a> freeCodeCamp.org. (2024, January 16). Data Engineering course for beginners [Video]. YouTube. https://www.youtube.com/watch?v=PHsC_t0j1dU

<a id="2">[2]</a> NeuralNine. (2022, April 11). Generating Professional Sample Data with Faker in Python [Video]. YouTube. https://www.youtube.com/watch?v=7M2Q5wrqC7I

<a id="3">[3]</a> SQLAlchemy Unified Tutorial — SQLAlchemy 2.0 Documentation. (n.d.). https://docs.sqlalchemy.org/en/20/tutorial/index.html#tutorial-overview

<a id="4">[4]</a> Verma, S. (2023, July 31). Building an Efficient ETL Pipeline using Python: A Step-by-Step Guide | 1. Medium. https://medium.com/@siddharthverma.er.cse/building-an-efficient-etl-pipeline-using-python-a-step-by-step-guide-9ac9fc88d60

<a id="5">[5]</a> Tope. (2023, September 13). Build an ETL Data Pipeline using Python - Data Engineer Things. Medium. https://blog.det.life/build-an-etl-data-pipeline-using-python-139c6875b046

### Utilization of AI

During this project, I used GPT-3.5 and GPT-4 for debugging and getting preliminary structures for the ETL scripts and Docker setup. 

**Reasons for Utilizing GPT Models:**
- **Schema Validation**: The AI's ability to assess the appropriateness of the OLAP schema based on the OLTP schema proved crucial, especially when inconsistencies could lead to significant setbacks.
- **ETL**: ChatGPT was a great help in suggesting basic structures for the ETL scripts
- **Docker Configuration**: GPT models assisted in deciding the architecture of Docker containers
- **Quick Error Analytics**: effectively reduced the debugging time for me

**Disclaimer:** Given the limited resources available, I did decide to use it. By doing so, I could navigate through a steep learning curve and effectively create the final product which I am super proud of.

## Example output 28.30.2024 on a MacBook Air 2021
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
