*** Settings ***
Documentation  Tests for [Production].[Document] table
Library  DatabaseLibrary
Resource  ../resources/db_connection.robot

*** Test Cases ***
Max Document Level
    [Documentation]  Verify that the maximum document level is within an expected range.
    Connect To DB
    ${max_level}  Query  USE AdventureWorks2012;SELECT MAX(DocumentLevel) FROM [Production].[Document];
    Log  Max document level: ${max_level[0][0]}
    Should Be True  ${max_level[0][0]} >= 0 and ${max_level[0][0]} <= 2
    Disconnect From Database

Count of Documents by Owner
    [Documentation]  Verify each document owner has at least one document.
    Connect To DB
    ${owners}  Query  USE AdventureWorks2012; SELECT Owner, COUNT(*) FROM [Production].[Document] GROUP BY Owner;
    Log  Owners and their document count: ${owners}
    FOR  ${row}  IN  @{owners}
        Should Be True  ${row[1]} >= 1
    END
    Disconnect From Database
