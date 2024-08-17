/*
[MEDIUM]
SOLUTION & EXPLANATION:
https://leetcode.com/problems/game-play-analysis-iv/solutions/5596252/easy-sql-solution-join-exists-coalesce
*/

with firtDayByPlayer as (
    select player_id, min(event_date) as first_day
    from activity
    group by player_id
)

select coalesce(round(count(distinct t.player_id) / count(distinct a.player_id),2),0) as fraction
from Activity a, (
    select player_id
    from firtDayByPlayer f
    where exists (
        select 1
        from activity a
        where f.player_id = a.player_id
        and datediff(a.event_date, f.first_day) = 1
    )
) as t