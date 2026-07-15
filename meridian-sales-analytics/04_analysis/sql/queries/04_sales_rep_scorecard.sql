-- ============================================================
-- T4 — Sales Rep Scorecard
-- Business goal: summarize per-rep performance — order count,
-- average order value, and share of "big" orders (> $1,000).
-- ============================================================

WITH order_totals AS (
    SELECT
        o.order_id,
        o.employee_id,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS order_total
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_id, o.employee_id
)
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS sales_rep,
    COUNT(ot.order_id) AS total_orders,
    ROUND(AVG(ot.order_total)::numeric, 2) AS avg_order_value,
    ROUND(
        (
            100.0 * SUM(CASE WHEN ot.order_total > 1000 THEN 1 ELSE 0 END)
            / COUNT(ot.order_id)
        )::numeric,
        2
    ) AS big_order_pct
FROM order_totals ot
JOIN employees e ON ot.employee_id = e.employee_id
GROUP BY sales_rep
ORDER BY big_order_pct DESC, avg_order_value DESC;
