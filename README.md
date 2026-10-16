# stockzen --- Mobile Shop Management System

**Project type:** Mobile application\
**Working name:** stockzen\
**Tagline:** Sales. Stock. Simplicity.\
**Project scope:** A management and POS system for one shop only.

> **Important scope rule:** This project is for a single shop. Do not
> add multi-shop, branch management, tenant management, or multi-tenancy
> unless the project owner explicitly changes the scope.

## 1. Project Overview

stockzen is a Mobile Shop Management System that helps a shop manage
products, inventory, purchasing, sales, customers, expenses, payments,
users, and reports from one application.

The application should be practical, fast, easy to use, and suitable for
daily shop operations. Build it in small, testable phases instead of
generating the entire system at once.

## 2. User Roles and Permissions

The system should support role-based access. A user may be assigned more
than one role where needed, because in a small shop one person may
handle several responsibilities.

### Shop Admin / Owner

-   Manage shop settings and application-level shop information.
-   Create, edit, deactivate, and manage users.
-   Assign roles and permissions.
-   Manage products, categories, suppliers, purchases, sales, customers,
    expenses, and reports.
-   View business summaries and transaction history.
-   Access settings and backups where implemented.

### Store Keeper

-   View and manage products and inventory according to permissions.
-   Receive stock against purchases.
-   Update permitted product details.
-   Review stock levels and low-stock items.
-   View stock movement/history where available.

### Cashier

-   Use the Point of Sale (POS) screen.
-   Search/select products and add them to a sale.
-   Calculate totals, discounts, and applicable taxes if configured.
-   Record payments and complete sales.
-   Print or reprint receipts according to permissions.
-   View permitted sales history.

### Super Admin

Only include a Super Admin if the product owner needs a separate
software-level administrator. Do not make this role a requirement for
ordinary shop operations by default. It must not imply support for
multiple shops.

## 3. Core Modules

1.  **Authentication and Access Control**
    -   Login and logout.
    -   Secure password handling.
    -   Role-based permissions.
    -   Session handling appropriate for the selected desktop framework.
2.  **Dashboard**
    -   Summary cards for sales, purchases, inventory value, and
        low-stock products where supported by stored data.
    -   Recent transactions.
    -   Quick actions based on the signed-in user's permissions.
3.  **Products and Inventory**
    -   Product creation and editing.
    -   SKU/barcode, name, category, unit, cost price, selling price,
        and stock quantity as applicable.
    -   Product search and filtering.
    -   Low-stock alerts.
    -   Stock movement history.
    -   Prevent invalid stock updates and keep stock calculations
        consistent.
4.  **Suppliers and Purchases**
    -   Supplier records.
    -   Purchase entry and purchase items.
    -   Purchase totals and payment status.
    -   Stock increases only when the purchase is confirmed/received,
        according to the agreed workflow.
    -   Purchase history and supplier balances where supported.
5.  **Point of Sale (POS) and Sales**
    -   Fast product search and cart.
    -   Quantity changes and item removal.
    -   Subtotal, discount, tax (if configured), grand total, amount
        paid, and balance/change.
    -   Complete sale and generate a receipt.
    -   Reduce inventory only once for a successfully completed sale.
    -   Handle cancelled/failed sales without corrupting stock or
        payment records.
6.  **Customers**
    -   Customer details and search.
    -   Link customers to sales when needed.
    -   Purchase history where permissions allow.
7.  **Expenses and Payments**
    -   Record shop expenses with date, category, amount, and notes.
    -   Record relevant payment methods and payment status.
    -   Keep sales, purchases, and payment records auditable.
8.  **Reports**
    -   Sales reports by date range.
    -   Purchase reports.
    -   Profit summaries only when required cost and transaction data
        are available.
    -   Inventory and low-stock reports.
    -   Expense reports.
    -   Export/print options if included in the selected implementation
        scope.
9.  **Users, Profile, and Settings**
    -   User profile and password change.
    -   User and role management for authorized users.
    -   Shop details, receipt settings, currency, and tax configuration
        where needed.
    -   Backup/restore options if supported by the chosen architecture.

## 4. Desktop Application Requirements

-   Deliver a desktop application, not a web-only application.
-   Confirm the target operating system(s) and technology stack before
    implementation if they have not already been selected.
-   Provide a clear application entry point and a reliable
    installation/build process.
-   Design for common desktop screen sizes and keyboard/mouse use.
-   Use reusable UI components and consistent navigation.
-   Provide clear validation, loading, empty, success, and error states.
-   Do not hardcode secrets, passwords, or environment-specific paths.
-   Keep data persistence reliable and document where the application
    stores its data.
-   Decide whether the application is local-only or needs a shared
    database before implementing data storage. Do not assume
    multi-device synchronization without approval.

## 5. Suggested Navigation

-   Dashboard
-   POS / New Sale
-   Products & Inventory
-   Stock Receiving
-   Purchases
-   Suppliers
-   Customers
-   Expenses
-   Sales History
-   Reports
-   Users & Roles
-   Profile & Settings

Show only the navigation items the current user is authorized to access.

## 6. Development Phases

Complete one phase at a time. Do not start the next phase until the
current phase is implemented, tested, and documented.

### Phase 1 --- Project Foundation

-   Inspect the existing repository before changing files.
-   Confirm the desktop framework, language, database, and build tools.
-   Set up the project structure, shared theme, reusable components,
    navigation pattern, and error handling.
-   Document setup and run commands.

**Acceptance criteria:** The application starts successfully; the
structure is understandable; no unrelated files are overwritten.

### Phase 2 --- Authentication and Permissions

-   Implement login/logout and password handling.
-   Define roles and permission checks.
-   Support assigning multiple roles to one user if required.
-   Protect both screens and operations, not just navigation visibility.

**Acceptance criteria:** Unauthorized users cannot access restricted
screens or invoke restricted actions.

### Phase 3 --- Main Layout and Dashboards

-   Build the desktop shell, sidebar/navigation, header, user menu, and
    role-aware dashboards.
-   Add loading, empty, and error states.

**Acceptance criteria:** Navigation works and users see only permitted
sections.

### Phase 4 --- Products and Inventory

-   Implement product/category management and inventory views.
-   Add search, filtering, stock validation, and stock movement records.
-   Define how opening stock and stock adjustments are recorded.

**Acceptance criteria:** Product data persists and stock changes are
traceable.

### Phase 5 --- Suppliers and Purchases

-   Implement supplier management and purchase workflows.
-   Link received purchases to inventory updates.
-   Track purchase totals and payment status.

**Acceptance criteria:** Receiving a purchase updates stock correctly
and only once.

### Phase 6 --- POS and Sales

-   Build the cashier workflow, cart, totals, payment capture, sale
    completion, and receipt.
-   Add transaction-safe stock deduction.
-   Handle cancellation, duplicate clicks, and failed saves safely.

**Acceptance criteria:** A completed sale is recorded once, stock is
deducted once, and totals are correct.

### Phase 7 --- Customers, Expenses, and Payment Details

-   Add customer records and sale links.
-   Add expense recording.
-   Complete relevant payment status/history views.

**Acceptance criteria:** Records are searchable and related transactions
remain consistent.

### Phase 8 --- Reports

-   Implement date filters and reports for sales, purchases, inventory,
    and expenses.
-   Show profit only when the required cost data is available.
-   Add export/print functions only if included in scope.

**Acceptance criteria:** Report totals match the underlying records for
tested date ranges.

### Phase 9 --- Users, Profile, and Settings

-   Finish user management, profile, shop settings, receipt settings,
    and approved configuration options.
-   Add backup/restore only after the database and storage approach are
    defined.

**Acceptance criteria:** Settings persist and access is restricted
appropriately.

### Phase 10 --- Testing, Packaging, and Release

-   Test core workflows end to end.
-   Test permissions, validation, stock calculations, totals, and
    failure scenarios.
-   Fix critical issues before release.
-   Create the desktop build/installer for the agreed operating
    system(s).
-   Document installation, data location, backup, and recovery steps.

**Acceptance criteria:** A clean build runs on the target machine and
critical workflows pass the test checklist.

## 7. Non-Negotiable Business Rules

-   This is a single-shop application; do not add branches, multi-shop
    support, or multi-tenancy.
-   Do not duplicate the same business logic across UI screens.
-   Validate important values before saving them.
-   Sales and purchases must be saved consistently with their stock
    movements and payment records.
-   Prevent double-processing caused by repeated clicks or retries.
-   Never silently delete financial or stock history; use a controlled
    cancellation/reversal workflow where appropriate.
-   Apply permissions to data-changing operations as well as screens.
-   Do not invent or display report figures that cannot be calculated
    from stored data.
-   Keep the implementation maintainable and testable.
-   Do not replace the selected stack or redesign the whole project
    without approval.

## 8. Instructions for an AI Code Editor

Before writing code:

1.  Inspect the repository and identify the current framework,
    structure, existing features, and unfinished work.
2.  Summarize the current state and identify files that will need
    changes.
3.  Implement only the phase explicitly requested by the project owner.
4.  Reuse existing patterns when they are sound; do not rewrite working
    code unnecessarily.
5.  If a critical requirement is ambiguous, ask one focused question
    instead of silently making a major assumption.
6.  After implementation, run available checks/tests and fix issues
    caused by the changes.
7.  Report the files changed, functionality completed, tests run, known
    limitations, and exact next step.
8.  Update project documentation when setup, data models, commands, or
    workflows change.
9.  Do not claim that a feature or test is complete unless it has
    actually been implemented or run.

## 9. Definition of Done

A phase is complete only when: - Its agreed requirements are
implemented. - UI states and validation are handled. - Permissions are
enforced where applicable. - Data is saved and retrieved correctly. -
Related stock/payment calculations are tested. - Available tests or
build checks pass. - No known critical regression remains. -
Documentation is updated. - The project owner receives a concise
completion report.

## 10. Decisions to Confirm Before Implementation

Confirm these items if they are not already settled: - Target operating
system: Windows only, or Windows/macOS/Linux. - Desktop technology
stack. - Database and whether the app is local-only or shared across
multiple computers. - Currency, tax rules, receipt format, and barcode
scanner/printer requirements. - Backup and restore requirements. -
Whether a separate Super Admin is actually needed.

Do not delay work on already-defined requirements while waiting for
optional decisions. Use safe, clearly documented defaults only when they
do not change the project's scope.
