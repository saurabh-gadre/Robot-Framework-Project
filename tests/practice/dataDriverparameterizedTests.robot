*** Settings ***
Documentation     Test case to verify login functionality of OrangeHRM application for invalid credentials
Resource          resource.robot
Resource          ../../PO/OrangeHRMLoginPage.robot
Library           DataDriver    file=resources/data.csv    encoding=UTF-8
Test Template     Validate Unsuccessful Login for OrangeHRM Application
Test Teardown     Close Browser

*** Variables ***
${Error_Message_Element}    xpath=//div[@role='alert']//p
${Error_Message}            Invalid credentials
${dashboard_header}         css=.oxd-topbar-header-breadcrumb h6

*** Test Cases ***
Login with user ${userName} and password ${password}    admin_user    admin_password

*** Keywords ***
Validate Unsuccessful Login for OrangeHRM Application
    [Arguments]                                        ${userName}              ${password}
    User launches the browser and navigates to the login page
    User enters username and password                  ${userName}              ${password}
    User clicks on the login button
    User should see an error message indicating invalid credentials

User should see an error message indicating invalid credentials
    Wait for The Element To Be Visible On The Page     ${Error_Message_Element}    5s
    Element Text Should Be                             ${Error_Message_Element}    ${Error_Message}