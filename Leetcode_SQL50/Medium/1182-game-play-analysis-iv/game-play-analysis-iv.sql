/* Write your T-SQL query statement below */
SELECT ROUND((COUNT( DISTINCT a1.player_id)*1.0)/(
    SELECT COUNT(DISTINCT player_id )  -- get the total players count
    FROM Activity 
),2) as fraction
FROM (
    SELECT player_id ,MIN(event_date ) as event_date -- Return first logged in day
    FROM Activity
    GROUP BY  player_id
) a1
INNER JOIN Activity a2 ON a1.player_id = a2.player_id 
WHERE DATEDIFF(day,a1.event_date,a2.event_date) =1-- and a2.event_date