*** Settings ***
Documentation    Test cases for the login demo application
Library    SeleniumLibrary
Suite Setup    Set Screenshot Directory    ./screenshots
Suite Setup    Set Log Level    INFO
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Error_Message_Element}    xpath=//div[@role='alert']//p
${Error_Message}    Invalid credentials

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

User enters invalid username and password
    Page Should Contain Textfield    xpath=//input[@name='username']
    Input Text    xpath=//input[@name='username']    invalidUser
    Page Should Contain Textfield    xpath=//input[@name='password']
    Input Text    xpath=//input[@name='password']    invalidPass

User clicks on the login button
    Page Should Contain Button    xpath=//button[@type='submit']
    Click Button    xpath=//button[@type='submit']

User should see an error message indicating invalid credentials
    Wait Until Element Is Visible    ${Error_Message_Element}    5s
    Element Text Should Be    ${Error_Message_Element}    ${Error_Message}







