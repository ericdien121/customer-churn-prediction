-- Churn rate by payment plan and method
-- Churn is consistent across all payment combinations (50-52%)
-- suggesting payment type is not a driver of churn

SELECT
    payment_plan,
    payment_method,
    COUNT(*) AS total_customers,
    ROUND(AVG(churned) * 100, 2) AS churn_rate_pct
FROM customers
GROUP BY payment_plan, payment_method
ORDER BY churn_rate_pct DESC;
