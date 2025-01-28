# Restaurant Analysis and Sales Report

## Project Overview

This project integrates a MySQL database with a Python-based front-end application using MySQL Connector/Python. Developed as part of the Meta Data Engineering course from Coursera, the project focuses on generating a detailed analysis and sales report for a restaurant. All data utilized in the project was sourced from the course materials.

---

## Project Steps

### 1. Establish a Connection Pool
  - Utilized the MySQLConnectionPool class from mysql.connector to manage database connections.
  - Defined database configurations in a dictionary (dbconfig) for easier management.
  - Created a connection pool named pool_b with two connections for optimized performance.
  - Implemented error handling to manage connection failures and timeouts.

### 2. Execute SQL Queries
  - Executed a series of queries to retrieve sales by month, menu item popularity, and customer booking trends.
  - Optimized queries to reduce execution time and resource usage, ensuring efficient data retrieval.

### 3. Data Analysis and Report
  - Retrieved and formatted query results using Python.
  - Visualized the data and presented the analysis in the form of a detailed sales report, utilizing Matplotlib for clear and informative charts.

---

## Built With

  - MySQL: Used for creating, populating, and querying the restaurant database.
  - MySQL Connector/Python: Enabled the connection between Python and MySQL for database operations.
  - Python: Used for scripting, querying the database, and performing analysis.
  - Matplotlib: Utilized for data visualization and generating graphical reports.

---

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/larisanti/restaurant-db.git
   cd restaurant-db
   ```

2. Install the required Python libraries:
   ```bash
   pip install mysql-connector-python matplotlib
   ```

3. Set up the MySQL database:
   - Import the provided `.sql` file to create and populate the database.
   - Update the dbconfig dictionary in the Python script with your MySQL credentials for the database connection.

4. Run the Python script to generate the report:
   ```bash
   python restaurant_analysis.py
   ```


## License
This project is licensed under the MIT License. For more details, see the [LICENSE](LICENSE) file.

