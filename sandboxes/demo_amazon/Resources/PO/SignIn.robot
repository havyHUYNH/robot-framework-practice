*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    ${new_sign_in}=  Run Keyword And Return Status
    ...  Wait Until Page Contains  Sign in or create account  10s
    IF  not ${new_sign_in}
        Wait Until Page Contains  Sign in  20s
    END
