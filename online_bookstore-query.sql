SELECT * FROM customers;
SELECT * FROM books;
SELECT * FROM orders;


--Totalul comenzilor
SELECT COUNT(*) AS total_orders FROM orders;

--Venitul total
SELECT SUM (o.quantity * b.price) AS total_revenue 
FROM orders o
JOIN books b ON o.book_id=b.book_id;

--Venit pe categorie
SELECT b.category,
SUM (o.quantity * b.price) AS revenue_by_category
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.category
ORDER BY revenue_by_category DESC;

--Cele mai vandute carti
SELECT b.title,
SUM (o.quantity) AS units_sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.title
ORDER BY units_sold DESC;

--Top customers by selling
SELECT c.customer_name,
SUM(o.quantity * b.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN books b ON o.book_id = b.book_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

--Vanzari pe luna
SELECT DATE_TRUNC('month', order_date) AS month,
SUM(o.quantity * b.price) AS revenue
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY month

--Valoarea medie a unei comenzi
SELECT ROUND(AVG(order_total), 2) AS average_order_value
FROM (SELECT order_id,
SUM(o.quantity * b.price) AS order_total
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY order_id
) AS order_totals;

--Top 5 clienti
SELECT c.customer_name,
SUM(o.quantity * b.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN books b ON o.book_id = b.book_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

