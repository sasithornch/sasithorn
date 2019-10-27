*** Settings ***
Library    SeleniumLibrary    

*** Keywords ***
Unauthen user add product "${product id}" to shipping cart
    HomePage.Add product to shipping cart    1 