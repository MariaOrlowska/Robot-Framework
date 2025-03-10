# AdventureWorks Robot Framework Tests

## Overview

This project contains Robot Framework tests that validate data in the AdventureWorks2012 database using SQL queries. The tests are automated and check different aspects of the database, such as record counts, unique values, and min/max values.

## Prerequisites

Before running the tests, make sure you have the following installed:

1. Install Robot Framework and Required Libraries
Run the following command:

`pip install -r requirements.txt`

or install manually:

`pip install robotframework robotframework-databaselibrary pyodbc`

2. Configure SQL Server

- Make sure you have an MS SQL Server running.
- Create a user with the correct permissions (Guide).
- Restart MS SQL Server after user creation.
- Enable TCP/IP connections in SQL Server Configuration Manager.


