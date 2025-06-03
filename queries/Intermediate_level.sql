-- 1 Join the necessary tables to find the total quantity of each pizza category ordered.
    SELECT 
    pizza_types.category, SUM(order_details.quantity) AS QTY
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY QTY DESC;


-- 2 Determine the distribution of orders by hour of the day.
SELECT hour(order_time) as Hour, count(order_id) as order_count
FROM orders
group by Hour;

-- 3 Join relevant tables to find the category-wise distribution of pizzas.
SELECT category, COUNT(name) as name 
FROM pizza_types
group by category;

-- 4 Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT round(avg(quantity),0) as Avg_order_perDay
FROM(
SELECT orders.order_date, SUM(order_details.quantity) as quantity
FROM orders 
JOIN order_details
ON orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity;

-- 4 Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_types.name,
SUM(order_details.quantity * pizzas.price) as Revenue
FROM pizza_types JOIN pizzas
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by revenue desc 
limit 3;