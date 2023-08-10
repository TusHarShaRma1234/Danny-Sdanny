use pizza_runner ; 
#A. Pizza Metrics

# How many pizzas were ordered?
select count(order_id) as pizza_orders
from customer_orders;

# How many unique customer orders were made?
select count(distinct order_id ) as unique_order
from customer_orders ;

# How many successful orders were delivered by each runner?
select runner_id,
	count(order_id) as order_deliver
from runner_orders 
where duration is not null 
group by runner_id;

# How many Vegetarian and Meatlovers were ordered by each customer?
select c.customer_id,
	    pn.pizza_id,
        count(c.order_id) as order_count 
from  pizza_names pn 
join customer_orders c 
on pn.pizza_id = c.pizza_id
where pn.pizza_name in( "Vegetarian", "Meatlovers")
group by  c.customer_id, pn.pizza_id
order by c.customer_id, pn.pizza_id ;

# What was the maximum number of pizzas delivered in a single order?
select date(order_time ) as Dilevery_day,
       max(pizza_id) as num_pizza_dilivered
from customer_orders
group by date(order_time) ;

#For each customer, how many delivered pizzas had at least 1 change and how many had no changes
select c.customer_id, 
       sum(case when c.exclusions <> '' or c.extras is not null then 1 else 0 end ) as pizza_with_change ,
       sum(case when c.exclusions = '' or c.extras is  null then 1 else 0 end ) as pizza_no_change
  from customer_orders c   
  join runner_orders ro 
  on ro.order_id = c.order_id
  where ro.cancellation is not null 
group by c.customer_id;

#How many pizzas were delivered that had both exclusions and extras?
SELECT
    COUNT(*) AS pizzas_with_exclusions_and_extras
FROM customer_orders
WHERE exclusions <> '' or not null  AND extras <> '' or  NOT NULL;

# What was the total volume of pizzas ordered for each hour of the day?
select date_format(order_time, '%y-%m-%d %h:00:00') as  pizza_time,
       sum(order_id) as  ordered_pizza
  from customer_orders 
  group by pizza_time
  order by pizza_time;

#What was the volume of orders for each day of the week
select dayname(order_time) as day_of_the_weak,
       count(order_id) as  NO_of_order
	from customer_orders 
    group by order_time;







       
















