*** Settings ***
Resource    ../templates/login_template.robot
Library     DataDriver     users.csv    dialect=excel    encoding=utf-8
Library     SeleniumLibrary

Test Template    Login Avec Cridentials Corrects
Test Setup        executer apres chaque test
Test Teardown    Close Browser

*** Test Cases ***

Login Avec Cridentials Corrects    ${username}    ${password}
    [Tags]    @regression

*** Keywords ***
Login Avec Cridentials Corrects
    [Arguments]    ${username}    ${password}
    Log To Console    ${username} ${password}
    RETURN    ${username}    ${password}

executer apres chaque test
    Log To Console    bye apres chaque test 
    Open Browser    http://www.saucedemo.com    chrome    remote_url=http://192.168.1.22:4444/wd/hub
