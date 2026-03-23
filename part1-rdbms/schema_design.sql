-- Q1: Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Q2: Create Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Q3: Create Sales Representatives table
CREATE TABLE sales_reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL
);

-- Q4: Create Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    sales_rep_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Q5: Create Order Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Q6: Insert customers
INSERT INTO customers VALUES (1,'Amit','Pune');
INSERT INTO customers VALUES (2,'Riya','Mumbai');
INSERT INTO customers VALUES (3,'John','Delhi');
INSERT INTO customers VALUES (4,'Sara','Pune');
INSERT INTO customers VALUES (5,'Raj','Nashik');


-- Q7: Insert products
INSERT INTO products VALUES (101,'Laptop',50000);
INSERT INTO products VALUES (102,'Mouse',500);
INSERT INTO products VALUES (103,'Keyboard',1500);
INSERT INTO products VALUES (104,'Monitor',8000);
INSERT INTO products VALUES (105,'Printer',12000);


-- Q8: Insert sales reps
INSERT INTO sales_reps VALUES (201,'Karan');
INSERT INTO sales_reps VALUES (202,'Meena');
INSERT INTO sales_reps VALUES (203,'Arjun');
INSERT INTO sales_reps VALUES (204,'Neha');
INSERT INTO sales_reps VALUES (205,'Rohit');


-- Q9: Insert orders
INSERT INTO orders VALUES (301,'2024-01-01',1,201);
INSERT INTO orders VALUES (302,'2024-01-02',2,202);
INSERT INTO orders VALUES (303,'2024-01-03',3,203);
INSERT INTO orders VALUES (304,'2024-01-04',4,204);
INSERT INTO orders VALUES (305,'2024-01-05',5,205);


-- Q10: Insert order items
INSERT INTO order_items VALUES (1,301,101,1);
INSERT INTO order_items VALUES (2,302,102,2);
INSERT INTO order_items VALUES (3,303,103,1);
INSERT INTO order_items VALUES (4,304,104,1);
INSERT INTO order_items VALUES (5,305,105,1);