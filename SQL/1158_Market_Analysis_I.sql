/*
[MEDIUM]
SOLUTION & EXPLANATION:
https://leetcode.com/problems/market-analysis-i/solutions/5644653/easy-sql-union-joins
*/

select buyer_id, join_date, count(*) as orders_in_2019
from Users u join Orders o on u.user_id = o.buyer_id
where year(order_date) = 2019
group by buyer_id
UNION
select user_id, join_date, 0
from Users
where user_id not in (
    select buyer_id
    from Orders
    where year(order_date) = 2019
)