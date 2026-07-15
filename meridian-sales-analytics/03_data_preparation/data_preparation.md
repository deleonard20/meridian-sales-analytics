# Data Preparation

## Source

This analysis uses the **Northwind Traders** dataset, a widely-used relational database commonly used for SQL practice and portfolio projects. It was loaded into a local **PostgreSQL** instance and queried via **DBeaver**.

## Date Normalization

The source dataset's original order dates are from the 1990s. To analyze the data as a current fiscal year (FY2025) exercise, all order-related dates were shifted forward by a constant offset so that `MAX(order_date)` aligns with the present analysis period. The applied offset is logged in `_time_shift_log` (not included in this repository's `data/raw`, as it is a metadata table rather than an analysis table). All relative patterns in the data — seasonality, order sequencing, customer/product mix — are preserved; only the absolute calendar dates were shifted.

## Tables Used

Of the tables available in the source database, **7 were used** for this analysis: `orders`, `order_details`, `products`, `categories`, `employees`, `shippers`, `customers`. See [`02_data_discovery/data_dictionary.md`](../02_data_discovery/data_dictionary.md) for full column-level documentation.

## Verification Steps

1. **Row count check** — confirmed row counts for all 7 tables matched the source export (see data dictionary).
2. **Referential integrity** — confirmed no orphaned `order_details.order_id` / `product_id`, no orphaned `orders.customer_id` / `employee_id` / `ship_via`.
3. **Date range check** — confirmed `orders.order_date` spans a continuous range with no unexpected gaps.
4. **Cross-validation** — all 5 analysis queries (`04_analysis/sql/queries/`) were independently re-run against the raw CSV exports using Python (DuckDB) to confirm the PostgreSQL outputs matched exactly before being used in the final deck and dashboard.
5. **Label accuracy fix** — Query T3 (Top 10 Products) groups by `product_name`, not `category_name`. Chart labels use the actual product name (e.g. *Côte de Blaye*) with category shown as supporting context, rather than mislabeling bars by category alone.

## Known Data Notes

- `ship_via` only has shipped-order activity for 3 of the 6 `shippers` records (United Package, Speedy Express, Federal Shipping) — the SLA analysis (T2) reflects only these 3 active couriers.
- `order_details.discount` is stored as a 0–1 fraction and is applied multiplicatively in all revenue calculations: `unit_price * quantity * (1 - discount)`.
