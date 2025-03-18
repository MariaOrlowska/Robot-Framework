*** Settings ***
Documentation   Tests for [Person].[Address] table
Library  DatabaseLibrary
Resource  ../resources/db_connection.robot

*** Test Cases ***
Count Total Addresses
    [Documentation]  Verify the total number of addresses is greater than 0.
    Connect To DB
    ${count}  Query   SELECT COUNT(*) FROM [Person].[Address];
    Log  Total addresses: ${count[0][0]}
    Should Be True  ${count[0][0]} > 0
    Disconnect From DB

Unique Cities Count
    [Documentation]  Verify that the count of distinct cities is a positive number.
    Connect To DB
    ${count}  Query  SELECT COUNT(DISTINCT City) FROM [Person].[Address];
    Log  Unique cities count: ${count[0][0]}
    Should Be True  ${count[0][0]} > 0
    Disconnect From DB
