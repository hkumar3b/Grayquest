select * from swiggy
--1. I want to reward top 5 delivery executives for each city per week
create or replace view city_weekly_delivery_stats as 
select
	city,
    delivery_person_id,
    DATE_TRUNC('week', delivery_timestamp)::DATE AS delivery_week,
    COUNT(*) AS total_orders,
    SUM(order_value) AS total_order_value,
    ROUND(AVG(order_rating), 2) AS avg_rating
from swiggy
group by city, delivery_person_id, DATE_TRUNC('week', delivery_timestamp);
-- 2

drop view if exists top_5_delivery_execs_per_city_week;

create view top_5_delivery_execs_per_city_week as
with ranked_execs as (
    select
        city,
        delivery_person_id,
        delivery_week,
        total_orders,
        total_order_value,
        avg_rating,
        (total_orders * 0.4 + total_order_value * 0.3 + avg_rating * 20 * 0.3) as score,
        rank() over (
            partition by city, delivery_week
            order by (total_orders * 0.4 + total_order_value * 0.3 + avg_rating * 20 * 0.3) desc
        ) as rnk
    from city_weekly_delivery_stats
)
select *
from ranked_execs
where rnk < 6;
select * from top_5_delivery_execs_per_city_week;


--2. Design framework to get results in excel by selecting city
-- create or replace view top_5_delivery_execs_per_city_week as 
-- select 
-- 	delivery_person_id,
-- 	city,
-- 	delivery_week
-- from
-- 	(select 
-- 		delivery_person_id,
-- 		city,
-- 		date_trunc('week',delivery_timestamp) as delivery_week,
-- 		count(*) as total_orders,
-- 		sum(order_value) as total_order_value,
-- 		round(avg(order_rating), 2) AS avg_rating,
-- 		rank() over(
-- 			partition by city,date_trunc('week',delivery_timestamp)
-- 			order by count(*) desc,sum(order_value)desc,avg(order_rating) desc
-- 		) as rnk
-- 	from swiggy
-- 	group by city, delivery_person_id, DATE_TRUNC('week', delivery_timestamp)
-- 	) as t1
-- where rnk<6;













