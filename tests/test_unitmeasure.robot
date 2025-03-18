*** Settings ***
Documentation  Tests for [Production].[UnitMeasure] table
Library  DatabaseLibrary
Resource  ../resources/db_connection.robot

*** Test Cases ***
Min & Max UnitMeasure Length
    [Documentation]  Verify that min and max UnitMeasure names exist.
    Connect To DB
    ${min_max}  Query   SELECT MIN(Name), MAX(Name) FROM [Production].[UnitMeasure];
    Log  Min: ${min_max[0][0]}, Max: ${min_max[0][1]}
    Should Not Be Empty  ${min_max[0][0]}
    Should Not Be Empty  ${min_max[0][1]}
    Disconnect From Database

Check for Specific UnitMeasure Values
    [Documentation]  Verify that at least one of the expected UnitMeasure values exists.
    Connect To DB
    ${result}  Query   SELECT Name FROM [Production].[UnitMeasure] WHERE Name IN ('Each', 'Gallon', 'Meter');
    Log  Found UnitMeasures: ${result}
    Should Not Be Empty  ${result}
    Disconnect From Database
