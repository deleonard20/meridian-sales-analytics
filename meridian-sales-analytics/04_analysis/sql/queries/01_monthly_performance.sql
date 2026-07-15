-- ============================================================
-- T1 — Monthly Performance
-- Business goal: track monthly order count, revenue & AOV
-- momentum across FY2025 to spot seasonal patterns.
-- ============================================================

SELECT
    EXTRACT(MONTH FROM o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue,
    SUM(od.unit_price * od.quantity * (1 - od.discount))
        / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
WHERE EXTRACT(YEAR FROM o.order_date) = 2025
GROUP BY 1
ORDER BY 1;
