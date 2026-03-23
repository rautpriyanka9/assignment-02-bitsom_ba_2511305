-- Create Date Dimension
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    year INT,
    month INT,
    day INT
);

-- Create Store Dimension
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50) NOT NULL,
    city VARCHAR(50)
);

-- Create Product Dimension
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL
);
-- Create Fact Table

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- dim_date

INSERT INTO dim_date VALUES (1,'2024-01-01',2024,1,1);
INSERT INTO dim_date VALUES (2,'2024-01-02',2024,1,2);
INSERT INTO dim_date VALUES (3,'2024-01-03',2024,1,3);


-- dim_store

INSERT INTO dim_store VALUES (1,'Store A','Mumbai');
INSERT INTO dim_store VALUES (2,'Store B','Pune');
INSERT INTO dim_store VALUES (3,'Store C','Delhi');


-- dim_product

INSERT INTO dim_product VALUES (101,'Laptop','Electronics');
INSERT INTO dim_product VALUES (102,'T-Shirt','Clothing');
INSERT INTO dim_product VALUES (103,'Milk','Groceries');

-- fact_sales

INSERT INTO fact_sales VALUES (1,1,1,101,1,50000);
INSERT INTO fact_sales VALUES (2,1,2,102,2,1600);
INSERT INTO fact_sales VALUES (3,1,3,103,5,300);
INSERT INTO fact_sales VALUES (4,2,1,101,1,50000);
INSERT INTO fact_sales VALUES (5,2,2,102,3,2400);
INSERT INTO fact_sales VALUES (6,2,3,103,4,240);
INSERT INTO fact_sales VALUES (7,3,1,101,2,100000);
INSERT INTO fact_sales VALUES (8,3,2,102,1,800);
INSERT INTO fact_sales VALUES (9,3,3,103,6,360);
INSERT INTO fact_sales VALUES (10,3,1,102,2,1600);