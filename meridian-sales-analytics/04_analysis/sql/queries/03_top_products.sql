-- ============================================================
-- T3 — Top 10 Products by Revenue
-- Business goal: identify which products genuinely drive
-- revenue, and their price positioning.
-- ============================================================

SELECT
    p.product_name,
    c.category_name,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue,
    CASE
        WHEN p.unit_price < 10 THEN '<10'
        WHEN p.unit_price BETWEEN 10 AND 20 THEN '10-20'
        WHEN p.unit_price BETWEEN 20 AND 50 THEN '20-50'
        ELSE '>50'
    END AS price_range
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY
    p.product_name,
    c.category_name,
    p.unit_price
ORDER BY total_revenue DESC
LIMIT 10;
