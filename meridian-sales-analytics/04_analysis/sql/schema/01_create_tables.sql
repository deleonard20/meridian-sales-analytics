-- ============================================================
-- Meridian Sales Analytics — Schema Reference
-- Reflects the Northwind Traders table structure for the
-- 7 tables used in this analysis (PostgreSQL dialect).
-- ============================================================

CREATE TABLE categories (
    category_id     SMALLINT PRIMARY KEY,
    category_name   VARCHAR(50) NOT NULL,
    description     TEXT
);

CREATE TABLE shippers (
    shipper_id      SMALLINT PRIMARY KEY,
    company_name    VARCHAR(40) NOT NULL,
    phone           VARCHAR(24)
);

CREATE TABLE customers (
    customer_id     CHAR(5) PRIMARY KEY,
    company_name    VARCHAR(40) NOT NULL,
    contact_name    VARCHAR(30),
    contact_title   VARCHAR(30),
    address         VARCHAR(60),
    city            VARCHAR(15),
    region          VARCHAR(15),
    postal_code     VARCHAR(10),
    country         VARCHAR(15),
    phone           VARCHAR(24),
    fax             VARCHAR(24)
);

CREATE TABLE employees (
    employee_id       SMALLINT PRIMARY KEY,
    last_name         VARCHAR(20) NOT NULL,
    first_name        VARCHAR(10) NOT NULL,
    title             VARCHAR(30),
    title_of_courtesy VARCHAR(25),
    birth_date        DATE,
    hire_date         DATE,
    address           VARCHAR(60),
    city              VARCHAR(15),
    region            VARCHAR(15),
    postal_code       VARCHAR(10),
    country           VARCHAR(15),
    home_phone        VARCHAR(24),
    extension         VARCHAR(4),
    reports_to        SMALLINT REFERENCES employees(employee_id)
);

CREATE TABLE products (
    product_id        SMALLINT PRIMARY KEY,
    product_name      VARCHAR(40) NOT NULL,
    supplier_id       SMALLINT,  -- suppliers dimension not included in this analysis subset
    category_id       SMALLINT REFERENCES categories(category_id),
    quantity_per_unit VARCHAR(20),
    unit_price        NUMERIC(10,2),
    units_in_stock    SMALLINT,
    units_on_order    SMALLINT,
    reorder_level     SMALLINT,
    discontinued      BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE orders (
    order_id          INTEGER PRIMARY KEY,
    customer_id       CHAR(5) REFERENCES customers(customer_id),
    employee_id       SMALLINT REFERENCES employees(employee_id),
    order_date        DATE,
    required_date     DATE,
    shipped_date      DATE,
    ship_via          SMALLINT REFERENCES shippers(shipper_id),
    freight           NUMERIC(10,2),
    ship_name         VARCHAR(40),
    ship_address      VARCHAR(60),
    ship_city         VARCHAR(15),
    ship_region       VARCHAR(15),
    ship_postal_code  VARCHAR(10),
    ship_country      VARCHAR(15)
);

CREATE TABLE order_details (
    order_id    INTEGER REFERENCES orders(order_id),
    product_id  SMALLINT REFERENCES products(product_id),
    unit_price  NUMERIC(10,2) NOT NULL,
    quantity    SMALLINT NOT NULL,
    discount    NUMERIC(4,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (order_id, product_id)
);

-- ============================================================
-- Indexes supporting the analysis query patterns in 04_analysis/sql/queries
-- ============================================================
CREATE INDEX idx_orders_order_date   ON orders(order_date);
CREATE INDEX idx_orders_customer_id  ON orders(customer_id);
CREATE INDEX idx_orders_employee_id  ON orders(employee_id);
CREATE INDEX idx_orders_ship_via     ON orders(ship_via);
CREATE INDEX idx_order_details_product_id ON order_details(product_id);
