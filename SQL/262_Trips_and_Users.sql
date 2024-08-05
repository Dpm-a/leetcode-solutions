/*
SOLUTION & EXPLANATION:
https://leetcode.com/problems/trips-and-users/solutions/5591262/easy-sql-solution-case
*/

with validTable as (
    select status, client_id, driver_id, request_at,
        case when u1.banned != "Yes" and u2.banned != "Yes" then 1 else 0 end as valid
    from Trips t, users u1, users u2
    where t.client_id = u1.users_id
    and t.driver_id = u2.users_id
    and request_at BETWEEN "2013-10-01" and "2013-10-03"
    order by request_at
)

select request_at as Day,
    round(sum(case when status LIKE "cancelled_%" then 1 else 0 end) / count(request_at), 2) as "Cancellation Rate"
from validTable
where valid = 1 
group by request_at
having count(valid) >= 1