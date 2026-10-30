# Write your MySQL query statement below
select 
product_name
,sum(unit) as unit

from orders as o 
    left join products as p
    on o.product_id = p.product_id
where order_date between '2020-02-01' AND '2020-02-29'
group by product_name 
having sum(o.unit) >= 100
