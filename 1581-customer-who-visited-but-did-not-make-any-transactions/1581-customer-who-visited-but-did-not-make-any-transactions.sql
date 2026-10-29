# Write your MySQL query statement below

SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    Visits v
LEFT JOIN
    Transactions t ON v.visit_id = t.visit_id
WHERE
    t.transaction_id IS NULL
GROUP BY
    v.customer_id
ORDER BY
    v.customer_id;






-- SELECT DISTINCT
-- customer_id,
-- count(transaction_id)
-- FROM Transactions as T 
-- RIGHT JOIN
--  VISITS as V on V.visit_id=t.visit_id 
--  Where transaction_id is null
-- Group by customer_id


--  SELECT
--     customer_id,
--     COUNT(CASE
--         WHEN transaction_id = 0 THEN 1    -- This is non-NULL, so COUNT it
--         ELSE NULL                        -- This is NULL, so COUNT ignores it
--     END) AS visits_without_transaction
-- FROM
--     Visits
-- GROUP BY
--     customer_id;