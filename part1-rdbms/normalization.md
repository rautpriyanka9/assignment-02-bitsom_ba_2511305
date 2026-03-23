## Anomaly Analysis

Insert Anomaly:
In orders_flat.csv, product information (product_id, product_name, price) is stored together with order_id.
If we want to add a new product but no order exists, we cannot insert the product without creating an order.
Example columns: product_id, product_name, order_id.

Update Anomaly:
Customer information is repeated in multiple rows.
If a customer changes city, we must update all rows.
Example: customer_id = 101 appears in multiple rows with customer_name and city.

Delete Anomaly:
If an order row is deleted, customer or product data may also be lost.
For example, deleting the last order of a customer removes customer information.
Example columns: order_id, customer_id, customer_name.


## Normalization Justification

Keeping all data in a single table may look simple at first, but it creates serious problems when the dataset grows. In the orders_flat.csv file, customer details, product details, order information, and sales representative data are stored together in one table. This causes data redundancy and leads to insert, update, and delete anomalies.

For example, customer information such as customer_name and city appears in multiple rows for every order placed by the same customer. If the customer changes their city, the update must be done in many rows. If even one row is missed, the database becomes inconsistent. This is called an update anomaly. Similarly, product details are repeated for every order, which increases storage usage and makes maintenance difficult.

Insert anomaly also occurs in the flat table. If a new product needs to be added but no order exists yet, it cannot be inserted without creating a fake order row. This shows that the design mixes different types of data in one place. Delete anomaly is another issue. If the last order of a customer is deleted, the customer information is also lost, even though the customer should still exist in the system.

Normalization solves these problems by dividing the data into separate tables such as customers, products, orders, and sales representatives. This removes redundancy, improves data consistency, and makes the database easier to maintain. Therefore, normalization is not over-engineering but a necessary step for building a reliable database system.