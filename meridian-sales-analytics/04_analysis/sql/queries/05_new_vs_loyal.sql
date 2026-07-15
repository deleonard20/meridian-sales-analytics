-- ============================================================
-- T5 — New vs Loyal Customers
-- Business goal: segment FY2025 orders into NEW (first order
-- in 2025) vs LOYAL (first order before 2025) to understand
-- the acquisition vs. retention revenue split.
-- ============================================================

WITH first_order AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
),
orders_2025 AS (
    SELECT
        o.order_id,
        o.customer_id
    FROM orders o
    WHERE o.order_date >= DATE '2025-01-01'
      AND o.order_date < DATE '2026-01-01'
),
orders_with_revenue AS (
    SELECT
        o25.order_id,
        o25.customer_id,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS revenue
    FROM orders_2025 o25
    JOIN order_details od ON o25.order_id = od.order_id
    GROUP BY o25.order_id, o25.customer_id
)
SELECT
    CASE
        WHEN fo.first_order_date >= DATE '2025-01-01' THEN 'NEW'
        ELSE 'LOYAL'
    END AS segment,
    COUNT(DISTINCT owr.order_id) AS orders,
    ROUND(SUM(owr.revenue)::numeric, 2) AS revenue
FROM orders_with_revenue owr
JOIN first_order fo ON owr.customer_id = fo.customer_id
GROUP BY 1
ORDER BY 1;
