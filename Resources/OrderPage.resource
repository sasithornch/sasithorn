*** Settings ***
Library    SeleniumLibrary    
Library    String    

*** Keywords ***
Wait until page load success
    Wait Until Page Contains    Shopping-cart summary    5 seconds
    
Verify total product price
    [Arguments]    ${expect total product price}
    ${total products price} =    Get Text    id:total_product
    #${total products price} =    Replace String    ${total products price}    $    ${EMPTY}    
    Should Be Equal As Strings    ${expect total product price}    ${total products price}    
    
Verify shipping fee
    [Arguments]    ${expect shipping fee}
    ${shipping fee} =    Get Text    id:total_shipping
    Should Be Equal As Strings    ${expect shipping fee}    ${shipping fee}
    
Verify total price
    [Arguments]    ${expect total price}
    ${total price} =    Get Text    id:total_price
    Should Be Equal As Strings    ${expect total price}    ${total price}
    
Summary total price
    ${total product} =    Get Text    id:total_product
    ${total product} =    Replace String    ${total product}    $    ${EMPTY}
    ${total product} =    Convert To Number    ${total product}
    ${total shipping} =    Get Text    id:total_shipping
    ${total shipping} =    Replace String    ${total shipping}    $    ${EMPTY}
    ${total shipping} =    Convert To Number    ${total shipping}    
    ${total tax} =    Get Text    id:total_tax
    ${total tax} =    Replace String    ${total tax}    $    ${EMPTY}
    ${total tax} =    Convert To Number    ${total tax}   
    ${total price} =    Get Text    id:total_price
    ${total price} =    Replace String    ${total price}    $    ${EMPTY}
    ${total price} =    Convert To Number    ${total price}
    ${expect total price}    Evaluate    ${total product} + ${total shipping} +  ${total tax}
    Should Be Equal As Numbers    ${expect total price}    ${total price
        