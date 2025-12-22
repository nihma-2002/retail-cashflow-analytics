-- 1. Percentage of late payments
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN payment_status = 'Late' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_payment_percentage
FROM payments;


-- 2. Average payment delay by customer
SELECT
    o.customer_id,
    ROUND(AVG(p.payment_delay_days), 2) AS avg_delay_days
FROM payments p
JOIN orders o
    ON p.order_id = o.order_id
GROUP BY o.customer_id
ORDER BY avg_delay_days DESC;


-- 3. Top 10 high-risk customers
SELECT
    o.customer_id,
    COUNT(*) AS late_payment_count,
    ROUND(AVG(p.payment_delay_days), 2) AS avg_delay_days
FROM payments p
JOIN orders o
    ON p.order_id = o.order_id
WHERE p.payment_status = 'Late'
GROUP BY o.customer_id
ORDER BY late_payment_count DESC, avg_delay_days DESC
LIMIT 10;


-- 4. Receivables aging distribution
SELECT
    aging_bucket,
    COUNT(*) AS order_count
FROM payments
GROUP BY aging_bucket
ORDER BY order_count DESC;
