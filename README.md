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

`pip install robotframework robotframework-databaselibrary pyodbc`

2. Configure SQL Server

- Make sure you have an MS SQL Server running.
- Create a user with the correct permissions (Guide).
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
${DB_CONN}   Driver={SQL Server};Server=${DB_HOST};Database=${DB_NAME};UID=${DB_USER};PWD=${DB_PASS}
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

