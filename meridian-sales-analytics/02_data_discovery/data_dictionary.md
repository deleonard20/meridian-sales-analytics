# Data Dictionary

Source database: **Northwind Traders** (PostgreSQL practice dataset). 7 of the available tables are used in this analysis.

## `orders`

| Column | Type | Description |
|--------|------|--------------|
| order_id | INTEGER (PK) | Unique order identifier |
| customer_id | CHAR(5) (FK → customers) | Customer placing the order |
| employee_id | SMALLINT (FK → employees) | Sales rep who took the order |
| order_date | DATE | Date the order was placed |
| required_date | DATE | Date the customer requested delivery by |
| shipped_date | DATE | Date the order actually shipped (NULL if not yet shipped) |
| ship_via | SMALLINT (FK → shippers) | Courier used |
| freight | NUMERIC(10,2) | Freight cost charged |
| ship_name / ship_address / ship_city / ship_region / ship_postal_code / ship_country | VARCHAR | Shipping destination detail |

## `order_details`

| Column | Type | Description |
|--------|------|--------------|
| order_id | INTEGER (PK, FK → orders) | Parent order |
| product_id | SMALLINT (PK, FK → products) | Product ordered |
| unit_price | NUMERIC(10,2) | Unit price at time of order |
| quantity | SMALLINT | Quantity ordered |
| discount | NUMERIC(4,2) | Discount applied (0–1 fraction) |

Revenue formula used throughout this analysis: `unit_price * quantity * (1 - discount)`

## `products`

| Column | Type | Description |
|--------|------|--------------|
| product_id | SMALLINT (PK) | Unique product identifier |
| product_name | VARCHAR(40) | Product name |
| supplier_id | SMALLINT | Supplier reference (suppliers dimension not included in this analysis subset) |
| category_id | SMALLINT (FK → categories) | Product category |
| quantity_per_unit | VARCHAR(20) | Packaging description |
| unit_price | NUMERIC(10,2) | List unit price |
| units_in_stock / units_on_order / reorder_level | SMALLINT | Inventory attributes (not used in this analysis) |
| discontinued | BOOLEAN | Whether the product is discontinued |

## `categories`

| Column | Type | Description |
|--------|------|--------------|
| category_id | SMALLINT (PK) | Unique category identifier |
| category_name | VARCHAR(50) | e.g. Beverages, Dairy Products, Confections |
| description | TEXT | Category description |

## `employees`

| Column | Type | Description |
|--------|------|--------------|
| employee_id | SMALLINT (PK) | Unique employee identifier |
| first_name / last_name | VARCHAR | Employee name |
| title | VARCHAR(30) | Job title (e.g. Sales Representative, Sales Manager, VP Sales) |
| hire_date / birth_date | DATE | HR attributes (not used in this analysis) |
| reports_to | SMALLINT (FK → employees) | Manager reference |

## `shippers`

| Column | Type | Description |
|--------|------|--------------|
| shipper_id | SMALLINT (PK) | Unique courier identifier |
| company_name | VARCHAR(40) | Courier name (United Package, Speedy Express, Federal Shipping) |
| phone | VARCHAR(24) | Contact number |

## `customers`

| Column | Type | Description |
|--------|------|--------------|
| customer_id | CHAR(5) (PK) | Unique customer code |
| company_name | VARCHAR(40) | Customer / account name |
| contact_name / contact_title | VARCHAR | Primary contact detail |
| city / region / country | VARCHAR | Customer location |

## Row Counts (as loaded)

| Table | Rows |
|-------|------|
| orders | 830 |
| order_details | 2,155 |
| products | 77 |
| categories | 8 |
| employees | 9 |
| shippers | 6 (3 with shipped-order activity) |
| customers | 91 |
