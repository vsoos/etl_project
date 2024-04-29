# Rental Transactions Analytics System (ETL pipeline)

This project encompasses a Dockerized setup of MySQL databases for OLTP and OLAP, it includes a Python script for Extract - Transform - Load (ETL) pipeline processes, and finally an interractive query application that you can run in your terminal.

## Prerequisites

To test it you have to have Docker and Docker compose installed on your computer. For running the Python scirps you will need the following libaries installed: 'pandas', 'SQLAlchemy', 'cryptography'.

## Setup

1. Clone repository 

```sh
git clone https://your-repository-url.git
cd your-repository-directory
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

