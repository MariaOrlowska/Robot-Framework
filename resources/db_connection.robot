*** Settings ***
Library  DatabaseLibrary


*** Keywords ***
Connect To DB

    Connect To Database    pyodbc    AdventureWorks2012     Kruszyna   Framework123    EPPLWARW0394\\LOCALDB   1433    None    driver={ODBC Driver 17 for SQL Server}

Disconnect From DB
    Disconnect From Database


