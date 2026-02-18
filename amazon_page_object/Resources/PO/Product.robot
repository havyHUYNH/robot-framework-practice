*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    Wait Until Element Is Visible  id=productTitle  timeout=15s

Add to Cart
    Click Button  id=add-to-cart-button
