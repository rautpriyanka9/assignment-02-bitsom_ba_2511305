## ETL Decisions

### Decision 1 — Standardizing Date Format
Problem:  
The raw transactional data contained inconsistent date formats such as DD-MM-YYYY, MM/DD/YYYY, and some missing values. This created problems while loading data into the dim_date table because the warehouse requires a consistent DATE format.

Resolution:  
All dates were converted into the standard format YYYY-MM-DD before loading. Missing dates were removed or replaced using valid transaction dates where possible. A separate dim_date table was created with year, month, and day columns extracted from the cleaned date.

---

### Decision 2 — Fixing Category Casing and Naming
Problem:  
Product categories in the raw data had inconsistent casing such as "electronics", "Electronics", and "ELECTRONICS". This caused duplication in the product dimension and incorrect grouping in analytical queries.

Resolution:  
All category values were standardized using proper title case (Electronics, Clothing, Groceries). This ensured that each category appeared only once in dim_product and allowed accurate aggregation in reports.

---

### Decision 3 — Handling NULL and Missing Values
Problem:  
Some rows in the raw data had NULL values in product name, store name, or quantity fields. Fact tables require complete foreign key references, so these NULL values caused errors during insertion.

Resolution:  
Rows with critical missing values were either removed or replaced with valid default values. Only clean records with valid store, product, and date references were inserted into the fact_sales table. This ensured referential integrity between fact and dimension tables.