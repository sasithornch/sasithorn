*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../Resources/Common.resource
Resource    ../Resources/HomePage.resource
Resource    ../Resources/OrderPage.resource
Suite Setup    Ecommerce Suite Setup
Suite Teardown    Close All Browsers
Test Setup    Ecommerce Test Setup
    
*** Test Cases ***
Test import selenium resource file
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"]
    
Demo page resource Verify add single product
    HomePage.Add product to shipping cart    1  
    HomePage.Checkout product
    OrderPage.Wait until page load success
    OrderPage.Verify total product price    $16.51 
    OrderPage.Verify shipping fee    $2.00   
    OrderPage.Verify total price    $18.51 
    OrderPage.Summary total price
    
Demo math
    ${result}    Evaluate    2 + 10       
    
Unauthen user checkout single product should calculate total price and shipping fee
    # [Tags]    ignore
    Give Unauthen user add product "1" to shipping cart
    # When I checkout product
    # Then I should see total product price equal to $16.51
    # And I should see total shipping fee equal to $2.00
    # And I should see total price equal to $18.51
    # And I should see total price equal to summary price
    