# Write your MySQL query statement below
SELECT
name
,unique_id
FROM Employees as E
LEFT JOIN 
    EmployeeUNI as EU on E.id =EU.id 