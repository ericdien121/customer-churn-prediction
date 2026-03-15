-- Behavioral comparison: churned vs retained customers
-- Churned users spend 28% less time on platform and skip 20% more songs

SELECT
    churned,
    COUNT(*) AS total_customers,
    ROUND(AVG(-signup_date), 1) AS avg_tenure_days,
    ROUND(AVG(weekly_hours), 2) AS avg_weekly_hours,
    ROUND(AVG(song_skip_rate), 3) AS avg_skip_rate,
    ROUND(AVG(num_playlists_created), 2) AS avg_playlists,
    ROUND(AVG(notifications_clicked), 2) AS avg_notifications
FROM customers
GROUP BY churned;
