SELECT 
  mgr.employee_id, 
  mgr.name, 
  COUNT(emp.employee_id) AS reports_count, 
  ROUND(
    AVG(emp.age)
  ) AS average_age 
FROM 
  employees emp 
  JOIN employees mgr ON emp.reports_to = mgr.employee_id 
GROUP BY 
  employee_id 
ORDER BY 
  employee_id


-- SELECT*
-- FROM EMPLOYEES
-- WHERE (EMPLOYEE_ID) IN (
--         SELECT 
--         E2.EMPLOYEE_ID
--         -- ,NAME
--         -- ,REPORTS_TO
--         -- ,AGE
--         FROM EMPLOYEES AS E1
--             JOIN EMPLOYEES AS E2 
--             ON E1.EMPLOYEE_ID = E2.REPORTS_TO )

--     AND E1.REPORTS_TO = E2.REPORTS_TO
-- WHERE E1.EMPLOYEE_ID = E2.REPORTS_TO


-- WHERE (EMPLOYEE_ID,NAME) IN (
--         SELECT 
--         EMPLOYEE_ID
--         ,NAME
--         ,REPORTS_TO 
--         ,AGE
--         FROM EMPLOYEES 
--         WHERE EMPLOYEE_ID = REPORTS_TO)

-- WHERE (product_id, year) IN (
--     -- This subquery finds the first year for EVERY product
--     SELECT product_id, MIN(year)
--     FROM Sales
--     GROUP BY product_id
-- );
