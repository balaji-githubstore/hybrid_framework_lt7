*** Settings ***
Documentation       This file contains test cases for add valid employee
...     records

Resource    ../resource/base/common_functionalities.resource
Resource    ../resource/pages/LoginPage.resource
Resource    ../resource/pages/MainPage.resource

Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=AddValidEmployeeTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser

Test Template   Add Valid Employee Template


*** Test Cases ***
Add Valid Employee Test_${test_name}

#Add Valid Employee Test     Admin    admin123    john   j   ken     john ken    john

*** Keywords ***
Add Valid Employee Template
    [Arguments]     ${username}     ${password}     ${firstname}       ${lastname}      ${middlename}   ${expected_fullname}     ${expected_firstname}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Click PIM
    Click Element    link=Add Employee
    Input Text    name=firstName    ${firstname}
    Input Text    name=middleName    ${middlename}
    Input Text    name=lastName    ${lastname}
    Sleep    5s
    Click Element    xpath=//button[normalize-space()='Save']
    Wait Until Page Contains    ${firstname}${SPACE}${lastname}
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstname}')]    ${expected_fullname}
    Element Attribute Value Should Be    name=firstName    value    ${expected_firstname}
