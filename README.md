# Restaurant Analysis and Sales Report

## Project Overview

This project showcases the integration of a MySQL database with a Python-based front-end application using MySQL Connector/Python. Completed as part of the Meta Data Engineering course offered by Coursera, the project focuses on developing a detailed analysis and sales report for a restaurant. All data utilized in this project was sourced from the course materials.

---

## Project Steps

### 1. Establish a Connection Pool
  - Used the `MySQLConnectionPool` class from `mysql.connector` to handle connections.
  - Defined database configurations in a dictionary (`dbconfig`).
  - Established a pool named `pool_b` with two connections.
  - Implemented error handling using a `try-except` block.

### 2. Execute SQL Queries
  - Queried sales by month, menu item popularity, and customer trends.
  - Optimized queries to improve execution time and minimize resource usage.

### 3. Data Analysis and Report
  - Executed queries and formatted results using Python.
  - Visualized the sales report and presented insights using the Python-based visualization library Matplotlib.

---

## Built With

- **MySQL**: For creating the database, populating it, and storing and querying restaurant sales data.
- **MySQL Connector/Python**: For connecting Python to the MySQL database.
- **Python**: For scripting and database interaction.
- **Matplotlib**: For data visualization.


---

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/larisanti/restaurant-db-sql.git
   cd restaurant-db-sql
   ```

2. Install the required Python libraries:
   ```bash
   pip install mysql-connector-python
   ```

3. Set up the MySQL database:
   - Import the provided `.sql` file to create and populate the database.
   - Update the `dbconfig` dictionary in the Python script with your MySQL credentials.

4. Run the Python script to generate the report:
   ```bash
   python sales_report.py
   ```


## License
This project is licensed under the MIT License. For more details, see the [LICENSE](LICENSE) file.

