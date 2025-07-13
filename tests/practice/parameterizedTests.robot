*** Settings ***
Documentation    Test case to verify login functionality of OrangeHRM application for invalid credentials
Library           SeleniumLibrary
Resource          ./resource.robot
Resource          ../../PO/OrangeHRMLoginPage.robot
Suite Setup       Set Screenshot Directory    ./screenshots
Test Template     Validate Unsuccessful Login for OrangeHRM Application
Test Teardown     Close All Browsers

*** Variables ***
${Error_Message_Element}    xpath=//div[@role='alert']//p
${Error_Message}            Invalid credentials
${dashboard_header}         css=.oxd-topbar-header-breadcrumb h6
${browser_name}             Edge

*** Test Cases ***                                    userName                  password
Invalid UserName and Valid Password                   fake_user_name            ${valid_password}
Invalid Password and Valid UserName                   ${valid_username}         fake_password
Invalid UserName and Invalid Password                 fake_user_name            fake_password
Special Characters for userName and Password          @!#%$^&*()_+              @!#%$^&*()_+

*** Keywords ***
Validate Unsuccessful Login for OrangeHRM Application
    [Arguments]                                        ${userName}              ${password}
    [Documentation]    Test case to verify login functionality of OrangeHRM application for invalid credentials
    User launches the browser and navigates to the login page    ${browser_name}
    User enters username and password                            ${userName}              ${password}
    User clicks on the login button
    User should see an error message indicating invalid credentials

User should see an error message indicating invalid credentials
    Wait for The Element To Be Visible On The Page     ${Error_Message_Element}    5s
    Element Text Should Be                             ${Error_Message_Element}    ${Error_Message}