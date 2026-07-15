-- ============================================================
-- T2 — Shipper SLA
-- Business goal: evaluate courier delivery reliability for
-- all orders that have shipped.
-- ============================================================

SELECT
    s.company_name,
    COUNT(o.order_id) AS shipped_orders,
    SUM(CASE WHEN o.shipped_date > o.required_date THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN o.shipped_date > o.required_date THEN 1 ELSE 0 END)
        / COUNT(o.order_id),
        2
    ) AS late_rate_pct
FROM orders o
JOIN shippers s ON o.ship_via = s.shipper_id
WHERE o.shipped_date IS NOT NULL
GROUP BY s.shipper_id, s.company_name
ORDER BY late_rate_pct DESC;
