-- Churn rate by customer service inquiry level
-- High inquiry users churn at 74% vs 29% for Low — nearly 3x difference

SELECT
    customer_service_inquiries,
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(AVG(churned) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(weekly_hours), 2) AS avg_weekly_hours,
    ROUND(AVG(num_subscription_pauses), 2) AS avg_pauses
FROM customers
GROUP BY customer_service_inquiries
ORDER BY churn_rate_pct DESC;
