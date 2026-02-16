*** Settings ***
Documentation    This is some basic info about the whole suite
Library          SeleniumLibrary

#Run the script:
#robot -d results tests/crm.robot

*** Variables ***


*** Test Cases ***
Should be able to add new customer
    [Documentation]             This is some basic info about the test
    [Tags]                      1006    Smoke   Contacts
    #Initialze Selenium
    Set selenium speed          .2s
    Set selenium timeout        10s

    #open the browser
    log                         Starting the test case!
    open browser                https://automationplayground.com/crm/   edge

    # resize browser window for recording
    Set window position         x=341   y=169
    Set window size             width=1935  height=1090

    sleep                       3s
    close browser

*** Keywords ***
