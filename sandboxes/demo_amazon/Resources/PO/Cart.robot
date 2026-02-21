*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Product Added
    Wait Until Page Contains  Added to Cart

Proceed to Checkout
    ${cart_sheet_checkout}=  Run Keyword And Return Status
    ...  Wait Until Element Is Visible  id=hlb-ptc-btn-native  timeout=8s
    IF  ${cart_sheet_checkout}
        Click Element  id=hlb-ptc-btn-native
    ELSE
        Wait Until Element Is Visible  name=proceedToRetailCheckout  timeout=15s
        Click Element  name=proceedToRetailCheckout
    END
