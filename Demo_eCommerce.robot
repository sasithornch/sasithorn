*** Settings ***
Library    SeleniumLibrary   
Library    String    
Suite Setup    Ecommerce Suite Setup
Suite Teardown    Close All Browsers
Test Setup     Ecommerce Test Setup
Test Teardown    Capture Page Screenshot

*** Variables ***
${Target URL}    http://automationpractice.com/index.php 
${Browser}    gc


*** Test Cases ***
Normal User Checkout single product should calculate total price and shipping free correctly
    # Open Browser    url=${Target URL}    browser=${Browser}
    # Maximize Browser Window
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"]
    # Sleep    3 seconds
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]
    Wait Until Page Contains    Shopping-cart summary    5 seconds    
    ${total product price} =    Get Text    id:total_product
    Should Be Equal As Strings    $16.51    ${total product price}
    ${total shipping price} =    Get Text    id:total_shipping
    Should Be Equal As Strings    $2.00    ${total shipping price}
    ${total price} =    Get Text    id:total_price_without_tax
    Should Be Equal As Strings    $18.51    ${total price}
    ${tax price} =    Get Text    id:total_tax
    Should Be Equal As Strings    $0.00    ${tax price}
    ${total price} =    Get Text    id:total_price
    Should Be Equal As Strings    $18.51    ${total price}
    # Close All Browsers
    
Normal User Checkout multiple product should calculate total price and shipping free correctly
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"]
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]
    Wait Until Page Contains    Shopping-cart summary    5 seconds   
    
*** Keywords ***
Ecommerce Suite Setup
    Open Browser    url=${Target URL}    browser=${Browser}
    Maximize Browser Window
    
Ecommerce Test Setup
    Delete All Cookies
    Go To    ${Target URL}  
    
        