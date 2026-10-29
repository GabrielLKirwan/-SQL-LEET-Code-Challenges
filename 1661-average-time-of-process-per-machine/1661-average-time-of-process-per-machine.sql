-- # Write your MySQL query statement below
SELECT a.machine_id, 
       ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a, 
     Activity b
WHERE 
    a.machine_id = b.machine_id
AND 
    a.process_id = b.process_id
AND 
    a.activity_type = 'start'
AND 
    b.activity_type = 'end'
GROUP BY machine_id




-- VERSION 2
-- WITH Q1 AS
-- (
--     SELECT 
--         MACHINE_ID,
--         PROCESS_ID,
--         TIMESTAMP, -- Added comma here
--         LAG(timestamp) OVER(
--             PARTITION BY MACHINE_ID ORDER BY PROCESS_ID
--         ) AS START_RUN_TIME 
--     FROM 
--         ACTIVITY
-- ),

-- Q2 AS
-- (
--     SELECT 
--         PROCESS_ID
--        , MACHINE_ID,
--         ROUND(TIMESTAMP,3) AS END_TIME, -- Added comma/AS for clarity
--         ROUND(START_RUN_TIME,3) AS START_TIME -- Added AS for clarity
--     FROM Q1 
-- ),

-- Q3 AS 
-- (
-- SELECT
--     * , -- Selects MACHINE_ID, END_TIME, START_TIME from Q2
--     (END_TIME - START_TIME) AS DURATION -- Calculation is now correctly inside the SELECT list
-- FROM 
--     Q2
-- WHERE 
--     START_TIME IS NOT NULL
-- )

-- SELECT

--     MACHINE_ID
--     ,PROCESS_ID
--     ,START_TIME
--     ,END_TIME
--    ,AVG(DURATION) AS PROCESSING_TIME
-- FROM 
--     Q3 





; 




-- VERSION 1

-- WITH Q1 AS
-- (
--     SELECT 
--     MACHINE_ID
--     ,PROCESS_ID
--     ,TIMESTAMP
--        ,LAG(timestamp) OVER(
--         PARTITION BY MACHINE_ID ORDER BY PROCESS_ID) AS START_RUN_TIME 
--     FROM 
--         ACTIVITY
   

-- ),


-- Q2 AS
-- (
-- SELECT 
-- MACHINE_ID
-- ,ROUND(TIMESTAMP,3) AS END_TIME 
-- ,ROUND(START_RUN_TIME,3) START_TIME 
-- FROM Q1 
-- )

-- SELECT* 
-- (END_TIMED-START_TIME) AS DURATION
-- FROM Q2
-- WHERE START_TIME IS NOT NULL 
-- ;
-- Q2 AS
-- (
--     SELECT
--     MACHINE_ID
--     ,START_RUN_TIME
--     ,TIMESTAMP
--     ,TIMESTAMPDIFF(MINUTE,TIMESTAMP, START_RUN_TIME) AS DURATION


--     FROM Q1
--  where START_RUN_TIME IS NOT NULL
--  AND TIMESTAMP IS NOT NULL

-- ),

-- Q3 AS
-- (
--     SELECT 
--     MACHINE_ID
--     ,START_RUN_TIME
--     ,TIMESTAMP
--     ,TIMESTAMPDIFF(SECOND,TIMESTAMP, START_RUN_TIME) AS DURATION
--     FROM Q2
-- )

-- Select *

-- From q3
-- -- WHERE 
-- --     START_RUN_TIME IS NOT NULL
