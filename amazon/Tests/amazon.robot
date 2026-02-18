*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary
Library  Collections
Test Teardown  Close Browser

# use the below line (without the # sign) to run the script
# robot -d results tests

*** Variables ***
${AMAZON_URL}  https://www.amazon.com
${SEARCH_INPUT}  id=twotabsearchtextbox
${SEARCH_RESULTS_CONTAINER}  css=div.s-main-slot
${DELIVERY_DISMISS_BUTTON}  xpath=//button[normalize-space(.)="Dismiss"]


*** Test Cases ***
User can search for products
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  ${AMAZON_URL}  edge
    Wait Until Page Contains  Search Amazon
    Dismiss Delivery Popup If Present
    Input Text  ${SEARCH_INPUT}  Ferrari 458
    Press Keys  ${SEARCH_INPUT}  ENTER
    Wait Until Element Is Visible  ${SEARCH_RESULTS_CONTAINER}  timeout=15s
    Page Should Contain Element  xpath=//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'ferrari 458')]

User can view a product
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  edge
    Wait Until Page Contains  Search Amazon
    Dismiss Delivery Popup If Present
    Input Text  ${SEARCH_INPUT}  Ferrari 458
    Press Keys  ${SEARCH_INPUT}  ENTER
    Wait Until Element Is Visible  ${SEARCH_RESULTS_CONTAINER}  timeout=15s
    Dismiss Delivery Popup If Present
    Wait Until Element Is Visible  xpath=(//div[@data-component-type='s-search-result']//img[contains(@class,'s-image')])[1]  timeout=15s
    Click Element  xpath=(//div[@data-component-type='s-search-result']//img[contains(@class,'s-image')])[1]
    Wait Until Element Is Visible  id=productTitle  timeout=15s
    Close Browser

*** Keywords ***
Dismiss Delivery Popup If Present
    ${is_visible}=  Run Keyword And Return Status
    ...  Wait Until Element Is Visible  ${DELIVERY_DISMISS_BUTTON}  timeout=2s
    IF  ${is_visible}
        Click Button  ${DELIVERY_DISMISS_BUTTON}
    END
