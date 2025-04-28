create database olympics;

use olympics;

-- top 5 countries by total gold medals
SELECT 
    Team, 
    COUNT(*) AS GoldMedals
FROM
    athlete_events
WHERE
    Medal = 'Gold'
GROUP BY 
Team
ORDER BY 
GoldMedals DESC
LIMIT 5;


-- top 5 athletes by total medals 
SELECT 
    Name, Team, 
    COUNT(Medal) AS TotalMedals
FROM
    athlete_events
WHERE
    Medal IS NOT NULL
GROUP BY 
Name , Team
ORDER BY 
TotalMedals DESC
LIMIT 5;


-- Medal trends over time (by decade)
select
floor(Year / 10) * 10 as Decade,
count(Medal) as TotalMedals
from
athlete_events
where
Medal is not null
group by
floor(Year / 10) * 10
order by
Decade;


-- Most popular sports by participant count
select 
Sport,
count(distinct Id) as ParticipantCount
from
athlete_events
group by
Sport
order by
ParticipantCount desc
limit 5;


-- Average age of medalists by medal type
select
Medal,
round(avg(Age), 2) as AverageAge
from
athlete_events
where
Medal is not null
and Age is not null
group by
Medal;


-- Gender Distribution of Medals
select
Sex,
count(Medal) as TotalMedals,
(count(Medal) * 100.0 / sum(count(Medal)) over()) as Percentage
from
athlete_events
where
Medal is not null
group by
Sex;

