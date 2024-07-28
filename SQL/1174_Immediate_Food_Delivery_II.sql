/*
SOLUTION & EXPLANATION:
https://leetcode.com/problems/product-price-at-a-given-date/
*/

select round(avg(order_date = customer_pref_delivery_date) * 100, 2) as immediate_percentage
from Delivery
where (customer_id, order_date) in (
    select customer_id, min(order_date)
    from Delivery
    group by customer_id
)
