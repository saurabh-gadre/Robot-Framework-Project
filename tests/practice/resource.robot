*** Settings ***
Documentation    Resource file for login demo application test cases
...               This file contains the settings, variables, and keywords used in the login demo test cases.
...               It is intended to be included in test cases for better organization and reusability.
Library          SeleniumLibrary

*** Variables ***
${URL}                    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${invalid_username}       invalid_userName
${invalid_password}       invalid_password
${valid_username}         Admin
${valid_password}         admin123

*** Keywords ***
User launches the browser and navigates to the login page
    [Arguments]    ${browser}=Chrome
    Open Browser    ${URL}    ${browser}
    Set Browser Implicit Wait    10s
    Maximize Browser Window
    
Wait for the Element to be visible on the page
    [Arguments]    ${element}    ${timeout}=5s
    Wait Until Element Is Visible     ${element}    ${timeout}

Close All Browsers Under Test Teardown
    Close All Browsers