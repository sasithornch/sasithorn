*** Settings ***
Library    SeleniumLibrary   
Library    String
Resource   Resources/Common.resource    
Suite Setup    Ecommerce Suite Setup
Suite Teardown    Close All Browsers
Test Setup     Ecommerce Test Setup
Test Teardown    Capture Page Screenshot

*** Variables ***
${Target URL}	http://automationpractice.com/index.php
${Browser}    gc

*** Test Cases ***
Normal User checkout single product should calculate total price and shipping fee
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"]
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]
    Wait Until Page Contains    Shopping-cart summary    5 seconds
    ${total products price} =    Get Text    id:total_product
    ${total products price} =    Replace String    ${total products price}    $    ${EMPTY}    
    Should Be Equal As Strings    16.51    ${total products price}    
    ${shipping fee} =    Get Text    id:total_shipping
    Should Be Equal As Strings    $2.00    ${shipping fee}
    ${total price} =    Get Text    id:total_price
    Should Be Equal As Strings    $18.51    ${total price}
    

Normal User checkout multiple product should calculate total price and shipping fee
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"]
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]
    Wait Until Page Contains    Shopping-cart summary    5 seconds


