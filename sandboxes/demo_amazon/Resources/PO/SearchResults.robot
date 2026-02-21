*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Search Completed
    Wait Until Element Is Visible  css=div.s-main-slot  timeout=15s
    Page Should Contain Element  xpath=//span[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'ferrari 458')]

Click Product Link
    [Documentation]  Clicks on the first product in the search results list
    ${is_visible}=  Run Keyword And Return Status
    ...  Wait Until Element Is Visible  xpath=//button[normalize-space(.)="Dismiss"]  timeout=2s
    IF  ${is_visible}
        Click Button  xpath=//button[normalize-space(.)="Dismiss"]
    END
    Wait Until Element Is Visible  xpath=(//div[@data-component-type='s-search-result']//img[contains(@class,'s-image')])[1]  timeout=15s
    Click Element  xpath=(//div[@data-component-type='s-search-result']//img[contains(@class,'s-image')])[1]
