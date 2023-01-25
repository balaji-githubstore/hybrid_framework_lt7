*** Settings ***
Documentation       This file contains test cases related to valid login

Resource    ../resource/base/common_functionalities.resource

Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser

Test Template       Valid Login Template

*** Test Cases ***
Valid Login Test1    Admin   admin123   Dashboard

*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${expected_header}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[normalize-space()='Login']
    Element Text Should Be    xpath=//h6[contains(normalize-space(),'Dash')]    ${expected_header}
