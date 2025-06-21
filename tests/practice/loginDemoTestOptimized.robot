*** Settings ***
Documentation    Test cases for the login demo application
Library    SeleniumLibrary
Suite Setup    Set Screenshot Directory    ./screenshots
Suite Setup    Set Log Level    INFO
Suite Teardown    Close All Browsers
Resource       tests/practice/resource.robot
Library        SeleniumLibrary
Library        Collections
Test Setup     User launches the browser and navigates to the login page
Test Setup     Set Log Level    DEBUG
Test Teardown  Close All Browsers Under Test Teardown

*** Variables ***
${Error_Message_Element}    xpath=//div[@role='alert']//p
${Error_Message}            Invalid credentials
${dashboard_header}         css=.oxd-topbar-header-breadcrumb h6

*** Test Cases ***
Validate Unsuccessful Login for OrangeHRM Application
    [Documentation]    Test case to verify login functionality of OrangeHRM application for invalid credentials
    User enters username and password                  ${invalid_username}    ${invalid_password}
    User clicks on the login button
    User should see an error message indicating invalid credentials

Validate different menus displayed after successful login
    [Documentation]    Test case to verify login functionality of OrangeHRM application for valid credentials
    User enters username and password                  ${valid_username}    ${valid_password}
    User clicks on the login button
    Wait for The Element To Be Visible On The Page     ${dashboard_header}    5s
    Element Text Should Be                             ${dashboard_header}   Dashboard
    User verifies the presence of different menus displayed after successful login

Validate presence of multiple menus elements displayed after successful login
    [Documentation]    Verifies the presence of multiple menu elements displayed after successful login
     User enters username and password                  ${valid_username}    ${valid_password}
     User clicks on the login button
     Wait for The Element To Be Visible On The Page     ${dashboard_header}    5s
     Element Text Should Be                             ${dashboard_header}   Dashboard
    @{expected_menus} =     Create List     Admin    PIM    Leave    Time    Recruitment    My Info    Performance    Dashboard    Directory    Maintenance   Claim  Buzz
    ${ui_menu_elements} =    Get WebElements    //li[@class="oxd-main-menu-item-wrapper"]//span
    @{actual_menus} =    Create List
    FOR     ${element}     IN     @{ui_menu_elements}
        Log     Verifying Menu: ${element.text}
        Append To List     ${actual_menus}    ${element.text}
    END
    Lists Should Be Equal    ${expected_menus}    ${actual_menus}

*** Keywords ***
User should see an error message indicating invalid credentials
    Wait for The Element To Be Visible On The Page     ${Error_Message_Element}    5s
    Element Text Should Be                             ${Error_Message_Element}    ${Error_Message}

User verifies the presence of different menus displayed after successful login
    [Documentation]    Verifies the presence of multiple menu elements displayed after successful login
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Admin']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='PIM']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Leave']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Time']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Recruitment']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='My Info']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Performance']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Dashboard']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Directory']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Maintenance']
    Page Should Contain Element    xpath=//li[@class="oxd-main-menu-item-wrapper"]//span[text()='Buzz']