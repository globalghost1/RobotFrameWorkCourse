*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser    

*** Variables ***
${Error_Message_Login}    css:.alert-danger


*** Test Cases ***
Validate Succesful Login
    Open the browser with the Mortage payment url
    Fill the login Form
    Wait until it checks and display error message
    Verify error message is correct

*** Keywords ***
Open the browser with the Mortage payment url
    Create Webdriver    Chrome    executable_path=/home/parallels/Downloads/chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345678    
    Click Button    signInBtn
Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.



     




    







