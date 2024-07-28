/*
SOLUTION & EXPLANATION:
https://leetcode.com/problems/last-person-to-fit-in-the-bus/solutions/5544606/easy-1-subquery-approac-over
*/

select person_name
from (
    select *, sum(weight) over(order by turn) as current_sum
    from Queue 
    order by turn
) as sums
where current_sum <= 1000
order by current_sum desc
limit 1