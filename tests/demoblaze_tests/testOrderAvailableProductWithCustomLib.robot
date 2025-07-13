*** Settings ***
Documentation    Test cases for verifying order functionality of available products on DemoBlaze
Resource   tests/demoblaze_tests/resources.robot
Library    SeleniumLibrary
Library    Collections
Library    customLibraries/Shop.py
Suite Setup    Set Screenshot Directory    tests/demoblaze_tests/screenshots

*** Variables ***
@{PRODUCT_NAME}    MacBook Pro

*** Test Cases ***
Validate Order of Available Product
    [Documentation]    This test case verifies that a user can successfully order an available product.
    Launch Browser and Navigate to DemoBlaze Login Page
    Login with Valid Credentials
    Wait Until Element Is Visible    id:cat
    Sleep    3s
    Wait Until Element Is Visible    xpath://a[text()='Laptops']
    Scroll Element Into View         xpath://a[text()='Laptops']
    Click Element                    xpath://a[text()='Laptops']
    Sleep    3s
    Select Item To Add To Cart       @{PRODUCT_NAME}
    Add Product to Cart for Order
    Place Product Order for Product Added to Cart   ${PRODUCT_NAME}
    
*** Keywords ***
Select Product
    [Arguments]    ${product_name}
    ${products}=    Get WebElements    css:.card-title
    FOR     ${element}     IN     @{products}
        ${actual_product_name}=     Set Variable    ${element.text}
        IF     '${actual_product_name}' == '${product_name}'
           Click Element   ${element}
           BREAK
        END
    END
    Sleep    2s
    Element Text Should Be        css:.product-content h2    ${product_name}
    Page Should Contain Element   xpath://a[text()='Add to cart']

Add Product to Cart for Order
    Click Element              xpath://a[text()='Add to cart']
    Sleep    2s
    Alert Should Be Present    Product added.    ACCEPT
    Click Element              xpath://div[@id='navbarExample']//li/a[text()='Cart']
    Sleep    2s

Place Product Order for Product Added to Cart    
    [Arguments]    ${product_name}
    Element Text Should Be     xpath://tbody[@id='tbodyid']/tr[1]/td[2]    ${product_name}
    Click Element              xpath://button[text()='Place Order']
    Sleep    2s
    Input Text                id:name    John Doe
    Input Text                id:country    USA
    Input Text                id:city    New York
    Input Text                id:card    1234567890123456
    Input Text                id:month    12
    Input Text                id:year    2025
    Click Element             xpath://button[text()='Purchase']
    Sleep    2s
    Wait Until Page Contains Element    css:.showSweetAlert > h2
    Element Text Should Be              css:.showSweetAlert > h2    Thank you for your purchase!
    Click Button                        xpath://button[text()='OK']