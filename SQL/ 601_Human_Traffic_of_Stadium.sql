/*
[HARD]
SOLUTION & EXPLANATION:
https://leetcode.com/problems/human-traffic-of-stadium/solutions/5649141/easy-sql-lag-lead-cte
*/

with windows as (
    select *,
        lag(id) over() as previous,
        lag(id,2) over() as previous2,
        lead(id) over() as following,
        lead(id,2) over() as following2
    from Stadium
    where people >= 100
)

select id, visit_date, people
from (
    select *,
        case when previous = (id - 1) and previous2 = (id - 2) then 1
             when following = (id + 1) and following2 = (id + 2) then 1
             when previous = (id - 1) and following = (id + 1) then 1
             else 0 end as correct
    from windows
) as corrects
where correct = 1