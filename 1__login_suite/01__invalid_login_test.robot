*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/base/common_functionalities.resource
Resource    ../resource/pages/LoginPage.resource

Library     DataDriver    file=../test_data/orange_data.xlsx    sheet_name=InvalidLoginTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser

Test Template       Invalid Login Template


*** Test Cases ***
Invalid Login Test

*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Element Should Contain    xpath=//p[contains(@class,'oxd-alert')]    ${expected_error}