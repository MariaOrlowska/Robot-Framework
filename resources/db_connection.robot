*** Settings ***
Library  DatabaseLibrary

*** Variables ***
${DB_NAME}    AdventureWorks2012
${DB_USER}    Kruszyna
${DB_PASS}    Framework123
${DB_HOST}    EPPLWARW0394\LOCALDB
${DB_PORT}    1433
${DB_DRIVER}  ODBC Driver 18 for SQL Server



*** Keywords ***
Connect To DB

    ${DB_CONN}=    Set Variable    DRIVER=${DB_DRIVER};SERVER=${DBHost};DATABASE=${DBName};UID=${DBUser};PWD=${DBPass};PORT=${DBPort};Encrypt=no;TrustServerCertificate=yes
    Connect To Database    pymssql    ${DB_CONN}

Disconnect From DB
    Disconnect From Database


