CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
city VARCHAR (50) NOT NULL,
age INTEGER,
email VARCHAR(100)
);

CREATE TABLE books (
book_id SERIAL PRIMARY KEY,
title VARCHAR (150)NOT NULL,
author VARCHAR (80) NOT NULL,
category VARCHAR (80),
price NUMERIC (10,2)
);

CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
customer_id INTEGER NOT NULL,
book_id INTEGER NOT NULL,
order_date DATE NOT NULL,
quantity INTEGER NOT NULL,
payment_method VARCHAR (50),
CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
CONSTRAINT fk_books FOREIGN KEY (book_id) REFERENCES books(book_id)
);

