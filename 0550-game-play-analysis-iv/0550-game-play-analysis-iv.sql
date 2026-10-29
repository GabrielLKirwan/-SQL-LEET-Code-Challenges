# Write your MySQL query statement below
WITH first_logins AS (
  SELECT
    A.player_id,
    MIN(A.event_date) AS first_login
  FROM
    Activity A
  GROUP BY
    A.player_id
), 

consec_logins AS (
  SELECT
    COUNT(A.player_id) AS num_logins
  FROM
    first_logins F
    INNER JOIN Activity A ON F.player_id = A.player_id
    AND F.first_login = DATE_SUB(A.event_date, INTERVAL 1 DAY)
)
SELECT
  ROUND(
    (SELECT C.num_logins FROM consec_logins C)
    / (SELECT COUNT(F.player_id) FROM first_logins F)
  , 2) AS fraction;

-- SELECT
-- COUNT(DISTINCT PLAYER_ID) AS PLAYER_COUNT
-- ,EVENT_DATE
-- ,LAG(EVENT_DATE) OVER (PARTITION BY PLAYER_ID ORDER BY EVENT_DATE) AS PREVIOUS_DATE
-- ,COALESCE(DATEDIFF(EVENT_DATE,LAG(EVENT_DATE) OVER (PARTITION BY PLAYER_ID ORDER BY EVENT_DATE)),0) AS DAYS_SINCE
-- ,CASE 
--     WHEN DAYS_SINCE = 1 
--     THEN DAYS_SINCE/PLAYER_COUNT
--     ELSE 0
-- END AS FRACTION
-- FROM ACTIVITY
