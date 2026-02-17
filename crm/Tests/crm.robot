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

    page should contain         Customers Are Priority One

    click link                  id=SignIn
    page should contain         Login

    input text                  id=email-id     admin@robotframeworktutorial.com
    input text                  id=password     qwe
    click button                Submit

    # 1) Click "New Customer" button
    click link                  New Customer

    # 2-6) Fill customer details
    input text                  id=EmailAddress         testuser@example.com
    input text                  id=FirstName            John
    input text                  id=LastName             Doe
    input text                  id=City                 New York
    select from list by label   id=StateOrRegion        Texas

    # 7) Select gender
    select radio button         gender                  male

    # 8) Optionally check promotion checkbox
    select checkbox             name=promos-name

    # 9) Click "Submit" button
    click button                Submit

    sleep                       2s
    close browser

*** Keywords ***
