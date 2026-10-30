# Write your MySQL query statement below

Select 
sell_date
,count(distinct product) as num_sold
,group_concat(distinct product separator ',') as products 
From Activities
group by sell_date