*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${Target URL}    http://automationpractice.com/index.php 
${Browser}    gc



*** Test Cases ***
Open browser demo
    Open Browser    url=${Target URL}    browser=${Browser}
    
Test case 2
    Log    ${Target URL}
    
Test Id locator
    Open Browser    url=${Target URL}    browser=${Browser}
    Click Element    id:contact-link
    Sleep    3 seconds
    Page Should Contain    send a message
    
Test CSS locator
    Open Browser    url=${Target URL}    browser=${Browser}
    Click Element    css:a.login
    Sleep    3 seconds
    Page Should Contain    Already registered?    