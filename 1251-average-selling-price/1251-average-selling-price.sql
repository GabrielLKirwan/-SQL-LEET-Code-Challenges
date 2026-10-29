# Write your MySQL query statement below

SELECT
    p.product_id,
    IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM
    Prices AS p
LEFT JOIN
    UnitsSold AS u
ON
    p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id;
    




-- -- WITH Q1 AS (
-- SELECT
--      U.PRODUCT_ID
--     ,PURCHASE_DATE
--     ,DATEDIFF(END_DATE,PURCHASE_DATE) AS BEFORE_AFTER
--     ,PRICE
--     ,UNITS
--     ,PRICE*UNITS AS TOTAL_PRICE
-- FROM PRICES AS P
-- LEFT OUTER JOIN  UNITSSOLD AS U
--     ON P.PRODUCT_ID = U.PRODUCT_ID


-- -- )

-- -- SELECT 
-- -- PRODUCT_ID
-- -- ,AVG(TOTAL_PRICE)
-- -- FROM Q1 
-- -- GROUP BY PRODUCT_ID