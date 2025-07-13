*** Settings ***
Documentation        Test cases for the login demo application
Library              SeleniumLibrary
Resource             ../../PO/OrangeHRMLoginPage.robot
Suite Setup          Set Screenshot Directory    ./screenshots
Test Setup           Set Log Level    INFO
Suite Teardown       Close All Browsers

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
Validate Unsuccessful Login for OrangeHRM Application
    [Documentation]    Test case to verify login functionality of OrangeHRM application for invalid credentials
    User launches the browser and navigates to the login page
    User enters invalid username and password
    User clicks on the login button
    User should see an error message indicating invalid credentials

*** Keywords ***
User launches the browser and navigates to the login page
    Open Browser    ${URL}    Chrome
    Set Browser Implicit Wait    5s
    Maximize Browser Window







