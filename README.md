# MySQL Restaurant Database & Python Analytics System

## Overview

This project combines a MySQL backend with Python analytics through MySQL Connector/Python to track operations from bookings to sales. Developed during Meta's Data Engineering course, the solution features 13 relational tables, connection pooling for performance, and automated Matplotlib visualizations.

---

## Implementation Process

### 1. Database Architecture
  - Created the ER diagram.
  - Set up a MySQL instance in MySQL Workbench.
  - Implemented the database schema.

  ![ERD](https://github.com/larisanti/restaurant-db/blob/main/images/ERD.png)


### 2. Database Connection
  - Established database connectivity using  `mysql-connector-python`.
  - Configured secure connection parameters.

  ```python
db_config = {
    'host': 'localhost',
    'user': '-------',  # Insert your username
    'password': '--------',  # Insert your password
    'database': 'restaurant_db'
}

# Connection handling with error management
try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("Successfully connected to database")
except mysql.connector.Error as err:
    print(f"Database connection failed: {err}")
    exit()
```

### 3. Query Execution
  - Executed queries to insert sample data.
  - Verified data integrity by counting records across tables.

### 4. Data Analysis
Generated visualizations using `matplotlib`.

  ![Booking Activity by Hour](https://github.com/larisanti/restaurant-db/blob/main/images/3-booking-activity.png)
   
  *See more of the data analysis in the [restaurant-analysis.ipynb](https://github.com/larisanti/restaurant-db/blob/main/restaurant-analysis.ipynb) file.*

---

## Built With

  - MySQL Workbench
  - MySQL Connector/Python
  - Python
  - Matplotlib

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
   - Update your MySQL credentials for the database connection.


## License
This project is licensed under the MIT License. For more details, see the [LICENSE](LICENSE) file.
