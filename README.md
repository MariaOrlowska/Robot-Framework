# AdventureWorks Robot Framework Tests

## Overview

This project contains Robot Framework tests that validate data in the AdventureWorks2012 database using SQL queries. The tests are automated and check different aspects of the database, such as record counts, unique values, and min/max values.

## Prerequisites

Before running the tests, make sure you have the following installed:

1. Install Robot Framework and Required Libraries
Run the following command:
_sh_

`pip install -r requirements.txt`

or install manually:
_sh_

`pip install robotframework robotframework-databaselibrary pymssql`

2. Configure SQL Server

- Make sure you have an MS SQL Server running.
- Create a user with the correct permissions
  ``` 
      -- Create the login
  
      CREATE LOGIN login_name WITH PASSWORD = 'pass123';
  
      -- Create the user in a specific database
  
      USE AdventureWorks2012;
      CREATE USER user_name FOR LOGIN login_name;

      -- Assign roles
  
      ALTER ROLE db_datareader ADD MEMBER user_name;
      ALTER ROLE db_datawriter ADD MEMBER user_name;```

        
- Restart MS SQL Server after user creation.
- Enable TCP/IP connections in SQL Server Configuration Manager.

3. Update Database Connection

Modify the db_connection.robot file (resources/db_connection.robot) with your database credentials:
_robot_
```
${DB_NAME}   AdventureWorks2012
${DB_USER}   myuser
${DB_PASS}   mypassword
${DB_HOST}   localhost
${DB_PORT}   1433
${DB_DRIVER}  ODBC Driver 18 for SQL Server

```
## Running the Tests

Run All Tests
To execute all tests and generate reports, use:

_sh_

`robot -d results tests/`

Run a Specific Test
For example, to test only the [Person].[Address] table:

_sh_

`robot -d results tests/test_address.robot`

Using the Shell Script
On Linux/Mac, you can also use:

_sh_

`bash robot_run.sh`

On Windows (PowerShell):

_powershell_

`./robot_run.sh`


## Test Reports

After execution, reports will be stored in the results/ directory:

- output.xml – Execution details in XML format.
- log.html – Detailed logs of each test case.
- report.html – Summary of all test results.

To view reports, open report.html in your browser.

## Test Cases

| Test Case | 	Description |	Table |
| ------ | ------ |------ |
|     Count Total Addresses   |   Checks if the total number of addresses is greater than 0.     |[Person].[Address] |
|     Unique Cities Count   |	Verifies that there are unique city values in the table.        |[Person].[Address] |
|     Max Document Level | Ensures the max document level is within the expected range. |[Production].[Document]|
| Count of Documents by Owner |	Ensures each owner has at least one document. |[Production].[Document]|
|Min & Max UnitMeasure Length| Verifies that min and max UnitMeasure names exist. |[Production].[UnitMeasure]|
|Check for Specific UnitMeasure Values |Checks if values like 'Each', 'Gallon', or 'Meter' exist.| [Production].[UnitMeasure]|


## Troubleshooting

Common issues and solutions:

1. Database connection errors – Ensure:

- SQL Server is running.
- Credentials in `db_connection.robot` are correct.
- The correct driver (`SQL Server` or `ODBC Driver 18 for SQL Server`) is installed.
- The firewall allows SQL Server connections.

2. Permission denied – The user may not have access to the database. Grant permissions with:

_sql_

`ALTER ROLE db_datareader ADD MEMBER myuser;`

3. Tests failing unexpectedly – Check the logs in `results/log.html` for details.
