*** Settings ***
Documentation    Supporting Page Object Code the Dashboard Page
Library          SeleniumLibrary

*** Variables ***
${dashboard_header}        css=.oxd-topbar-header-breadcrumb h6

*** Keywords ***
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