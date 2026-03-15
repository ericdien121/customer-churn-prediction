-- Churn rate by subscription type
-- Free users churn at 79% vs 34% for Premium/Family, showing paid plans drive retention

SELECT 
    subscription_type,
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(AVG(churned) * 100, 2) AS churn_rate_pct
FROM customers
GROUP BY subscription_type
ORDER BY churn_rate_pct DESC;
