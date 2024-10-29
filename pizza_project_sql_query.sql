SELECT * FROM pizzadb.pizza_sales;

select hour(order_time) as order_hour, sum(quantity) as total_pizza_sold
from pizzadb.pizza_sales
group by hour(order_time)
ORDER BY hour(order_time);

select week(order_date) as week_number , year(order_date) as order_year , count(distinct order_id) as Total_orders from pizzadb.pizza_sales
group by week(order_date) , year(order_date) 
order by week(order_date) , year(order_date);

select pizza_category, sum(total_price) as total_sales, sum(total_price) * 100 / (select sum(total_price) from pizzadb.pizza_sales) as percen_of_sales
from pizzadb.pizza_sales 
group by pizza_category;

select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_sales, cast(sum(total_price) * 100 / 
(select sum(total_price) from pizzadb.pizza_sales) as decimal(10,2)) as percen_of_sales
from pizzadb.pizza_sales 
group by pizza_size
order by percen_of_sales desc;

select pizza_name, sum(quantity) as total_quantity from pizzadb.pizza_sales
group by pizza_name
order by total_quantity desc limit 5;

SELECT * FROM pizzadb.pizza_sales;

select sum(total_price) as Total_revenue from pizzadb.pizza_sales;

select sum(total_price) / count(distinct order_id) from pizzadb.pizza_sales;

select count(distinct order_id) as total_orders from pizzadb.pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal (10,2)) as avg_pizza_per_order from pizzadb.pizza_sales;

select DATEPART(HOUR, ORDER_TIME) as order_hour, sum(quantity) as total_pizza_sold
from pizzadb.pizza_sales;

**(Hourly trend for total pizza sold)**

select DATEPART(HOUR, ORDER_TIME) as order_hour, sum(quantity) as total_pizza_sold
from pizzadb.pizza_sales
group by DATEPART(HOUR, ORDER_TIME);



