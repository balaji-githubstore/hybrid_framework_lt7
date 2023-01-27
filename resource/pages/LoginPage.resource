*** Settings ***
Documentation       The file handles all elements in login page

Resource    ../base/common_functionalities.resource

*** Variables ***
${USERNAME_LOCATOR}     name=username
${PASSWORD_LOCATOR}     name=password
${LOGIN_LOCATOR}    xpath=//button[normalize-space()='Login']

*** Keywords ***
Enter Username
    [Arguments]     ${username}
    Input Text    ${USERNAME_LOCATOR}    ${username}

Enter Password
    [Arguments]     ${password}
    Input Password    ${PASSWORD_LOCATOR}    ${password}

Click Login
    Click Element    ${LOGIN_LOCATOR}
