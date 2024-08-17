/*
[MEDIUM]
SOLUTION & EXPLANATION:
https://leetcode.com/problems/department-top-three-salaries/solutions/5549154/easy-solution-dense-rank-over
*/

with top3ByDept as (
    select d.name as Department, 
        e.name as Employee, 
        salary,
        dense_rank() over(partition by d.name order by salary desc) as rankByDept
    from Department d join Employee e on e.departmentId = d.id
)

select distinct Department, Employee, salary 
from top3ByDept 
where rankByDept <= 3