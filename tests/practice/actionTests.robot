*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Validate Dropdown Option Selection
    [Documentation]    Validate that the dropdown option selection works correctly.
    Open Browser    https://seleniumbase.io/demo_page    Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10s
    Select From List By Index    id:mySelect    2
    Select From List By Label    id:mySelect    Set to 100%
    Select Checkbox    name:checkBoxName1
    Checkbox Should Be Selected    name:checkBoxName1
    Click Element     id:radioButton2
    Click Button    id:myButton
    Sleep    4s

Validate Switch to New Browser Window Tab
    [Documentation]    Validate that switching to a new browser window tab works correctly.
    Open Browser     https://formy-project.herokuapp.com/switch-window    Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10s
    Wait Until Element Is Visible    id:new-tab-button
    Click Element    id:new-tab-button
    ${handle}=    Switch Window    NEW
    Element Text Should Be    class:display-3    Welcome to Formy
    Switch Window    MAIN
    Element Text Should Be    id:new-tab-button    Open new tab


