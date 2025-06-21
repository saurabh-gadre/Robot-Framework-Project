*** Settings ***
Documentation    Resource file for DemoBlaze tests
...               Contains libraries and variables used across multiple test cases.
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://www.demoblaze.com
${VALID_USERNAME}    robot_user
${VALID_PASSWORD}    test

*** Keywords ***
Launch Browser and Navigate to DemoBlaze Login Page
    [Arguments]    ${url}=${BASE_URL}
    Open Browser                      ${url}    Chrome
    Maximize Browser Window
    Go To                             ${url}/index.html
    Set Browser Implicit Wait         30s
    Set Selenium Page Load Timeout    30s
    Click Element                     id:login2

Login with Valid Credentials
    [Arguments]      ${username}=${VALID_USERNAME}    ${password}=${VALID_PASSWORD}
    Input Text                         id:loginusername    ${username}
    Input Password                     id:loginpassword    ${password}
    Click Button                       xpath://button[text()='Log in']
    Wait Until Page Contains Element   id:logout2

Logout of DemoBlaze Application
    Click Element    id:logout2
    Wait Until Page Contains Element   id:login2