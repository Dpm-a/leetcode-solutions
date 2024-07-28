/*
SOLUTION & EXPLANATION:
https://leetcode.com/problems/product-price-at-a-given-date/solutions/5544497/easiest-union-approach/?source=submission-ac
*/

with valid_product_ids as (
    select product_id, max(change_date) as max_change_date
    from products
    where change_date <= "2019-08-16"
    group by product_id
)

select p.product_id, p.new_price as price
from valid_product_ids as v join Products p on p.product_id = t.product_id and p.change_date = t.max_change_date
union
select product_id, 10
from Products
where product_id not in (select product_id from valid_product_ids)