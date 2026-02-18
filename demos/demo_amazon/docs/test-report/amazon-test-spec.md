# Amazon E2E Test Specification (Logged-Out User)

## 1. Document Control
- Document ID: `TS-AMZ-PO-001`
- Version: `1.0`
- Last Updated: `2026-02-18`
- Source Suite: `amazon_page_object/Tests/amazon.robot`
- Test Type: UI End-to-End, Smoke

## 2. Objective
Validate critical buying journey behavior for a logged-out user on Amazon:
1. Search for products.
2. View a product detail page.
3. Add product to cart.
4. Be redirected to sign-in when starting checkout.

## 3. Scope
### In Scope
- Amazon public storefront flows for anonymous users.
- Search, product navigation, cart add, and checkout gate (sign-in requirement).
- Edge/Chrome-compatible Selenium execution via Robot Framework.

### Out of Scope
- Authenticated checkout completion.
- Payment, shipping, order placement.
- Account creation and multi-factor authentication.

## 4. Test Environment
- Framework: Robot Framework + SeleniumLibrary
- Suite: `amazon_page_object/Tests/amazon.robot`
- Setup/Teardown: `Begin Web Test` / `End Web Test`
- Browser: configurable (`BROWSER` variable), default typically `chrome` or `edge`
- Base URL: `http://www.amazon.com`

## 5. Entry and Exit Criteria
### Entry Criteria
- Browser driver and Selenium dependencies installed.
- Internet access available.
- Amazon site reachable.

### Exit Criteria
- All smoke tests executed.
- No open blocker defects in smoke scope.
- Test evidence generated (`output.xml`, `log.html`, `report.html`).

## 6. Test Data
- Search term: `Ferrari 458`
- User state: Logged out / anonymous session

## 7. Functional Test Cases

| TC ID | Test Case Name | Priority | Preconditions | Steps (High Level) | Expected Result |
|---|---|---|---|---|---|
| TC-AMZ-001 | Logged out user can search for products | High | User is not signed in; browser open | 1) Open Amazon landing page 2) Search `Ferrari 458` | Search results page is displayed with relevant results container/content |
| TC-AMZ-002 | Logged out user can view a product | High | TC-AMZ-001 search completed | 1) Select first product from results | Product details page loads (product title visible) |
| TC-AMZ-003 | Logged out user can add product to cart | High | TC-AMZ-002 product page loaded | 1) Click Add to Cart | Cart confirmation state is shown (item added) |
| TC-AMZ-004 | Logged out user must sign in to check out | Critical | TC-AMZ-003 item in cart | 1) Proceed to checkout from cart/cart sheet 2) Observe auth gate | User is redirected to Sign-in / Create account page |

## 8. Traceability Matrix

| Robot Test Case | Spec TC ID |
|---|---|
| `Logged out user can search for products` | `TC-AMZ-001` |
| `Logged out user can view a product` | `TC-AMZ-002` |
| `Logged out user can add product to cart` | `TC-AMZ-003` |
| `Logged out user must sign in to check out` | `TC-AMZ-004` |

## 9. Pass/Fail Rules
- Pass: All expected outcomes are met without unhandled Selenium/Robot failures.
- Fail: Any expected result not met, timeout on critical UI state, or locator/action failure.

## 10. Risks and Constraints
- Amazon UI/DOM changes frequently; locator volatility is expected.
- Geo/location popups and A/B UI variants can affect deterministic execution.
- Network latency and anti-bot behavior may increase intermittency.

## 11. Execution Command
```bat
robot -d amazon_page_object/Results/batch/edge -v BROWSER:edge amazon_page_object/Tests/amazon.robot
```
