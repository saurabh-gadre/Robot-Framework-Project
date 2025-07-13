*** Settings ***
Documentation    Supporting Page Object Code the Login Page
Library    SeleniumLibrary

*** Variables ***
${user_name_input}                xpath=//input[@name='username']
${password_input}                 xpath=//input[@name='password']
${login_button}                   xpath=//button[@type='submit']
${error_message_element}          xpath=//div[@role='alert']//p
${error_message}                  Invalid credentials

*** Keywords ***
User enters invalid username and password
    Page Should Contain Textfield    ${user_name_input}
    Input Text                       ${user_name_input}    invalidUser
    Page Should Contain Textfield    ${password_input}
    Input Text                       ${password_input}     invalidPass

User enters username and password
    [Arguments]                       ${username}          ${password}
    Page Should Contain Textfield     ${user_name_input}
    Input Text                        ${user_name_input}   ${username}
    Page Should Contain Textfield     ${password_input}
    Input Password                    ${password_input}    ${password}

User clicks on the login button
    Page Should Contain Button       ${login_button}
    Click Button                     ${login_button}
    
User should see an error message indicating invalid credentials
    Wait Until Element Is Visible    ${error_message_element}    5s
    Element Text Should Be           ${error_message_element}    ${error_message}