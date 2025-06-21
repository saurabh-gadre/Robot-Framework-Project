*** Settings ***
Documentation    Resource file for login demo application test cases
...               This file contains the settings, variables, and keywords used in the login demo test cases.
...               It is intended to be included in test cases for better organization and reusability.
Library          SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${invalid_username}    invalid_userName
${invalid_password}    invalid_password
${valid_username}    Admin
${valid_password}    admin123

*** Keywords ***
User launches the browser and navigates to the login page
    Open Browser    ${URL}    Chrome
    Set Browser Implicit Wait    10s
    Maximize Browser Window

User clicks on the login button
    Page Should Contain Button        xpath=//button[@type='submit']
    Click Button                      xpath=//button[@type='submit']

User enters username and password
    [Arguments]    ${username}    ${password}
    Page Should Contain Textfield     xpath=//input[@name='username']
    Input Text                        xpath=//input[@name='username']   ${username}
    Page Should Contain Textfield     xpath=//input[@name='password']
    Input Password                    xpath=//input[@name='password']   ${password}

Wait for the Element to be visible on the page
    [Arguments]    ${element}    ${timeout}=5s
    Wait Until Element Is Visible     ${element}    ${timeout}

Close All Browsers Under Test Teardown
    Close All Browsers