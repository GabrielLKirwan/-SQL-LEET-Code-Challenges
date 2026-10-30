# Write your MySQL query statement below
Select
    user_id
    ,name
    ,mail
From Users 
    where mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$' 
    AND mail LIKE BINARY '%@leetcode.com';