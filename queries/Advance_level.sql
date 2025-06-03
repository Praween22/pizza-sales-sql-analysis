-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT * FROM  pizza_types;

SELECT pizza_types.category,
concat(ROUND(SUM(order_details.quantity * pizzas.price) / ( SELECT
round(SUM(order_details.quantity * pizzas.price),
2) AS Total_sales
FROM 
   order_details
   JOIN 
   pizzas
ON pizzas.pizza_id = order_details.pizza_id)*100,0),"%") AS revenue
FROM pizza_types join pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by revenue desc;


-- Analyze the cumulative revenue generated over time.

SELECT order_date,
round(SUM(revenue) over(order by order_date),0) as cum_revenue
FROM 
(SELECT orders.order_date,
sum(order_details.quantity * pizzas.price) as revenue
From order_details JOIN pizzas
on order_details.pizza_id = pizzas.pizza_id
JOIN orders
ON orders.order_id = order_details.order_id
group by orders.order_date) as sales;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT name, revenue 
FROM
(SELECT category, name , revenue,
rank() over(partition by category order by revenue desc) as rn
FROM
(SELECT pizza_types.category, pizza_types.name,
sum((order_details.quantity) * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as a) as b
WHERE rn <= 3;