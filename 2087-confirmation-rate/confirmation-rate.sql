# Write your MySQL query statement below
SELECT              s.user_id,
ROUND(CAST(COUNT(CASE WHEN action = 'confirmed' THEN 1 ELSE NULL END) AS FLOAT) / COUNT(*), 2) as confirmation_rate
FROM                Signups s
LEFT JOIN     Confirmations c
ON                  s.user_id = c.user_id
GROUP BY            s.user_id