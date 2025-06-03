# 🍕 Pizza Sales SQL Analysis

This project analyzes pizza sales data using SQL to uncover insights about orders, revenue, pizza types, and customer behavior. It helped me learn SQL joins, aggregations, CTEs, and window functions in a real-world business context.

---

## 🛠️ Tools Used
- MySQL
- SQL
- CSV files
- Git & GitHub

---

## 📁 Project Structure


---

## 🔍 Questions Solved (Examples)

- ✅ Total number of orders
- ✅ Total revenue generated from pizza sales
- ✅ Most ordered pizza size
- ✅ Top 5 most popular pizza types
- ✅ Revenue contribution % by category
- ✅ Hourly order trends
- ✅ Top 3 pizza types by revenue per category

---

## 💡 Sample SQL Query

```sql
-- Calculate total revenue
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_sales
FROM
    order_details
JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;

📊 Key Insights
BBQ Chicken pizza was one of the top revenue generators.

Medium size pizzas had the highest number of orders.

Most orders occurred between 6 PM to 9 PM.

