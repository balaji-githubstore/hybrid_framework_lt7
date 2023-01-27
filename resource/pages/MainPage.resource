*** Settings ***
Documentation       The file handles all elements in login page

Resource    ../base/common_functionalities.resource

*** Variables ***
${PIM_LOCATOR}  xpath=//a[normalize-space()='PIM']
${ADMIN_LOCATOR}  xpath=//a[normalize-space()='Admin']

*** Keywords ***
Click PIM
    Click Element    ${PIM_LOCATOR}

Click Admin
    Click Element    ${ADMIN_LOCATOR}