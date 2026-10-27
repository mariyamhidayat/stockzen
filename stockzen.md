# Shop Management System (Mobile POS)

## Professional Development Plan

> **Purpose:** This document converts the Shop Management System requirements into a phase-by-phase implementation roadmap.
>
> **Important:** Inspect the existing repository before implementation. Reuse the existing framework, language, database, and project conventions unless a change is approved. Where a technical choice has not been confirmed, record it as an open decision rather than silently assuming it.

---

# 1. Project Overview

**Project Name:** Shop Management System (Mobile POS)

**Platform:** Android mobile app for the current build. iOS and web come later. Keep the existing Flutter platform folders in the repository.

**Primary Goal:** Manage the daily operations of one shop, including products, inventory, suppliers, purchases, stock receiving, POS sales, payments, receipts, users, expenses, and reports.

The system includes these major areas:

- User login and permissions
- Shop Admin dashboard and operations
- Store Keeper inventory and stock receiving
- Cashier POS and sales
- Products and categories
- Suppliers and purchases
- Stock movement history
- Sales history and receipts
- Customers
- Expenses and payment records
- Reports
- Profile and settings
- Backup and recovery: cloud backup plus a local export

---



# 2. User Roles and Access Rules

The system has exactly three roles:

- **Shop Admin / Shopkeeper:** Manages shop operations, users and permissions, products, categories, suppliers, purchases, stock, sales oversight, reports, and shop settings.
- **Store Keeper:** Manages products and stock within granted permissions, records stock receiving, reviews stock levels, and checks stock movement history.
- **Cashier:** Creates POS sales, manages the cart, records payments, and prints or reprints receipts within granted permissions.



## Important role rules

- The Shop Admin is the highest-level user inside this single shop.
- One person may perform more than one job. Support assigning one or more of the three available roles to a user when required.
- Do not add a role dropdown to the login screen.
- After login, if the user has one assigned role, open that role's dashboard directly. If the user has multiple assigned roles, show a **Select Workspace** screen containing only their assigned roles.
- Users must not see or perform actions outside their permissions, including direct data-changing operations.
- Cashiers should not see product cost price, user management, or sensitive reports by default.
- Store Keepers should not access financial or purchase-management features unless the Shop Admin grants permission.

---



# 3. Screen Flow



## A. Login and Workspace

Shop User Login  
→ If one role is assigned: open that role's dashboard  
→ If multiple roles are assigned: Select Workspace  
→ Open the selected role's dashboard

The Select Workspace screen may show only the roles assigned to the logged-in user: **Shop Admin, Store Keeper, and Cashier**. Provide a way to switch workspace later without signing out, subject to the user's assigned roles.

## B. Shop Admin / Shopkeeper Screens

Shop User Login → Shop Admin Dashboard (directly or through Select Workspace)

- Dashboard
- Products & Inventory
- Categories
- Suppliers
- Purchases / Purchase Entry
- Stock Receiving, if separate from purchase workflow
- Sales / POS Overview
- Sales History / Receipts
- Customers
- Expenses and Payments
- Reports
- Users & Permissions
- Profile & Settings



## C. Store Keeper Screens

Shop User Login → Store Keeper Dashboard (directly or through Select Workspace)

- Dashboard
- Products & Inventory
- Product / Stock Details
- Stock Receiving
- Stock Movement / Stock History
- Low Stock Items
- Profile & Settings

Purchase or financial access is available only when explicitly permitted by the Shop Admin.

## D. Cashier Screens

Shop User Login → Cashier Dashboard (directly or through Select Workspace)

- Dashboard
- POS / New Sale
- Product Search / Cart
- Payment
- Sale Confirmation / Receipt
- Sales History
- Sale Details / Receipt Reprint
- Profile & Settings

Cost price, user management, and sensitive reports remain hidden by default and must be permission-controlled.

---



# 4. Database / Domain Model

Inspect the existing database and schema first. Adapt names to the repository's existing conventions rather than creating duplicate models.

Important entities may include:

```text
users
roles
permissions
role_permissions
user_roles

categories
products
suppliers

purchases
purchase_items
stock_receipts
stock_movements
stock_adjustments

sales
sale_items
payments
customers

expense_categories
expenses

shop_settings
audit_logs
```



## Important modeling rules



### Users and Roles

Support only the three roles defined in Section 2. A user may have multiple assigned roles where required. Use a consistent user-role relationship and enforce permissions in both the UI and the business/data layer.

### Products and Inventory

Product records may include:

```text
product_id
name
sku_or_barcode
category_id
unit
cost_price
selling_price
current_stock
low_stock_threshold
status
```

Only include fields that fit the existing requirements and implementation. Do not store stock changes without a traceable reason or movement record.

### Purchases and Stock Receiving

Keep purchase headers and purchase line items separate where appropriate. Receiving a purchase must increase stock only once for the quantity actually received. Prevent repeated clicks or retries from receiving the same quantity twice.

### Sales and Payments

Keep sale details and payment records linked to the sale. Completing a sale must reduce stock only once. Store enough transaction detail to review the sale and reprint its receipt later.

### History and Reversals

Do not silently delete completed sales, payments, purchases, or stock movements. Use a controlled cancellation, return, correction, or reversal process where the workflow requires it.

---



# 5. Development Phases

Complete and verify each phase before starting the next. Implement only the phase requested by the user or project owner. Do not generate the entire system in one step.

---



## PHASE 0 --- Project Discovery & Requirements Freeze



### Objective

Inspect the existing repository and establish a reliable implementation baseline before changing production code.

### Tasks

- Inspect the current project structure, framework, programming language, database, dependencies, and existing screens.
- Identify which features are already implemented and which are incomplete.
- Confirm the target mobile operating system and current build/run process.
- Confirm whether data is stored on one device or shared across multiple devices.
- Confirm currency, tax, barcode scanner, receipt printer, and backup requirements if these are not already defined.
- Record open decisions clearly; do not silently make major architecture changes.



### Locked scope

- One shop only.
- Exactly three roles: Shop Admin, Store Keeper, and Cashier.
- No multiple shops, branches, or multi-tenancy.
- No role dropdown on the login screen.
- Support multiple roles per user when needed.
- Reuse the existing technology stack unless a change is approved.

**Done when:** The existing implementation and open decisions are documented, and the phase plan matches the actual repository.

---



## PHASE 1 --- Project Foundation & Mobile Layout



### Objective

Establish or verify the mobile application's shared foundation without disrupting working code.

### Tasks

- Organize code into clear feature areas using the existing project conventions.
- Set up or refine the main mobile app screen/layout, navigation, shared layout, and reusable components.
- Establish consistent typography, spacing, colors, form controls, dialogs, and loading/error states.
- Separate UI, business logic, and database operations where practical.
- Document how to run and build the application.

**Done when:** The app launches reliably and the shared layout and navigation foundation works.

---



## PHASE 2 --- Login, Users & Permissions



### Objective

Implement secure user access for Shop Admin, Store Keeper, and Cashier.

### Tasks

- Implement login, logout, and secure password handling using the project's existing authentication approach.
- Add user creation, editing, activation/deactivation, and role assignment for authorized users.
- Support one or more of the three permitted roles per user.
- Do not add a role dropdown to the login screen.
- Protect restricted screens and data-changing operations at both UI and business/data layers.
- Provide clear handling for invalid credentials, inactive users, and expired sessions where supported.

**Done when:** Users can sign in and only access the screens and actions granted to them.

---



## PHASE 3 --- Select Workspace & Role Dashboards



### Objective

Provide the correct dashboard and navigation for each user's assigned role.

### Tasks

- If a user has one assigned role, open its dashboard after login.
- If a user has multiple assigned roles, show Select Workspace.
- Show only the roles assigned to the current user.
- Build the Shop Admin, Store Keeper, and Cashier dashboards.
- Show relevant database-backed summaries rather than hardcoded values.
- Provide workspace switching for users with multiple roles.

**Done when:** Login routing, workspace selection, dashboard summaries, and role-based navigation work correctly.

---



## PHASE 4 --- Products, Categories & Inventory



### Objective

Manage the shop's product catalogue and current stock.

### Tasks

- Add, view, edit, search, and filter products.
- Manage product categories.
- Store product name, SKU/barcode when required, unit, cost price, selling price, stock quantity, and low-stock threshold as applicable.
- Show stock details and low-stock items.
- Record stock adjustments and stock movement history with date, reason, quantity, and responsible user.
- Apply role permissions to cost price and inventory-changing actions.

**Done when:** Product data persists correctly and stock changes can be traced to a recorded movement.

---



## PHASE 5 --- Suppliers, Purchases & Stock Receiving



### Objective

Record suppliers, purchases, and the receipt of stock.

### Tasks

- Create and maintain supplier records.
- Create purchase records and purchase line items.
- Record ordered quantity, received quantity, purchase cost, totals, and payment status as applicable.
- Support full or partial receiving if required by the existing workflow.
- Increase stock only when items are confirmed as received.
- Prevent duplicate stock increases caused by repeated clicks, retries, or reopening a purchase.
- Allow Store Keeper receiving actions only within assigned permissions.

**Done when:** Purchase and receiving records are accurate and inventory increases exactly once for each confirmed received quantity.

---



## PHASE 6 --- Cashier POS & Sales



### Objective

Build the cashier's day-to-day sales workflow.

### Tasks

- Search for and select products.
- Add products to the cart, edit quantities, and remove items.
- Calculate subtotal, discount, tax if configured, and final total.
- Validate available stock before completing a sale.
- Record payment method, amount received, and change or remaining balance as applicable.
- Complete the sale and generate a receipt.
- Reduce stock only once after a sale is successfully saved.
- Handle failed saves, cancellation, duplicate clicks, and retries safely.
- Apply permission rules to discounts, price overrides, and refunds.

**Done when:** Sale totals, payment details, receipts, and stock reductions pass the defined tests.

---



## PHASE 7 --- Sales History, Sale Details & Receipts



### Objective

Make completed transactions easy to find, review, and reproduce.

### Tasks

- Show sales history with date, search, and relevant filters.
- Display sale details, line items, payment information, and transaction status.
- Print and reprint receipts according to user permissions.
- Preserve completed transaction history.
- Use a controlled cancellation, return, or reversal workflow rather than silently deleting transactions.

**Done when:** Authorized users can search past sales, review details, and reprint receipts accurately.

---



## PHASE 8 --- Customers, Expenses & Payments



### Objective

Track customers and routine shop expenses. Both are included in the MVP.

### Tasks

- Add customer records.
- Link customer records to sales when applicable.
- Record expenses with date, category, amount, payment method, and notes as required.
- Keep purchase, sale, and expense payment statuses consistent.
- Restrict sensitive financial details according to role permissions.

**Done when:** Customer and expense records persist correctly and authorized users can review them.

---



## PHASE 9 --- Reports



### Objective

Provide reliable summaries of shop performance and inventory.

### Tasks

- Add date-filtered sales reports.
- Add purchase and supplier-related reports where required.
- Add stock-on-hand and low-stock reports.
- Add expense reports.
- Show profit only when the required cost data is reliable.
- Add export or print functionality if required.
- Restrict financial and sensitive reports according to permissions.
- Ensure report totals are calculated from transaction data, not manually maintained summary values.

**Done when:** Report results match the underlying sales, purchases, stock, and expense records.

---



## PHASE 10 --- Profile & Shop Settings



### Objective

Allow users to manage their own profile and authorized shop settings.

### Tasks

- Add profile viewing and editing.
- Add password change where supported.
- Configure shop name, contact details, currency, tax, and receipt format when applicable.
- Allow only Shop Admin or explicitly authorized users to change shop-wide settings.
- Provide cloud backup and a local export backup.

**Done when:** Profile and settings changes persist and are permission-controlled.

---



## PHASE 11 --- Testing, Bug Fixes & Mobile Release



### Objective

Verify the main workflows and prepare a reliable mobile build.

### Tasks

- Test login, logout, role assignment, workspace selection, and permissions.
- Test product creation and stock adjustments.
- Test purchase receiving, including partial receiving if implemented.
- Test POS totals, discounts, payments, receipts, and stock reduction.
- Test cancelled sales, returns, duplicate clicks, invalid inputs, and failed saves.
- Test reports against underlying records.
- Run the available automated tests and build checks.
- Fix critical regressions.
- Build the mobile app package for the agreed operating system.
- Document installation, data storage location, backup, and recovery steps.

**Done when:** The mobile build succeeds and the agreed core shop workflows pass testing.

---



# 6. Rules for the Code Editor

1. Inspect the existing repository before changing code.
2. Implement only the phase explicitly requested; do not build the whole system at once.
3. Keep the system limited to one shop.
4. The only roles are Shop Admin, Store Keeper, and Cashier.
5. Do not add a role dropdown to the login screen.
6. Support multiple assigned roles for a user when required.
7. Reuse existing working code and patterns; avoid unnecessary rewrites.
8. Keep UI, business logic, and database operations separated where practical.
9. Validate inputs and show useful error messages.
10. Keep sales, payments, purchases, and stock movements consistent.
11. Prevent duplicate transaction submissions and duplicate stock changes.
12. Do not silently delete completed financial or inventory history.
13. Run available tests/build checks after changes and fix regressions.
14. At the end of each phase, report files changed, features completed, tests run, known issues, and the next phase.

---



# 7. Decisions



## Confirmed

- Framework and language: Flutter and Dart, already in the repository.
- Local database: SQLite, for on-device data and offline use.
- Cloud sync: Cloud Firestore, so more than one device can share the shop's data.
- Sync is a separate design. Offline sales must not duplicate, and stock must stay consistent.
- Authentication: Firebase Authentication with password sign-in.
- Roles live in the app data model, not on the login screen. The only roles are Shop Admin, Store Keeper, and Cashier. A user may have more than one.
- Currency is PKR (Pakistani Rupee). Tax is disabled and zero by default in the MVP.
- Customers are included in the MVP.
- Expenses are included in the MVP.
- MVP receipts are digital. Barcode scanning and receipt printing are deferred to a later phase.
- Backup is cloud backup plus a local export.
- Current target is the Android mobile app. iOS and web are deferred. Do not remove their Flutter platform folders.

Do not make further architecture decisions silently. Proceed only where the requirements above are already confirmed.