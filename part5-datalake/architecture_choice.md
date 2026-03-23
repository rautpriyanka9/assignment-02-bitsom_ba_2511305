## Architecture Recommendation

For a fast-growing food delivery startup handling GPS logs, text reviews, transactions, and images, I recommend a **Data Lakehouse** architecture. A Lakehouse bridges the gap between the flexibility of a Data Lake and the structured performance of a Data Warehouse, making it the most future-proof choice for a scaling startup.

### 3 Reasons for Choosing a Data Lakehouse:

1. **Support for Multimodal and Unstructured Data:** The startup collects restaurant menu images and customer text reviews. Unlike a traditional Data Warehouse, which requires data to be strictly structured before ingestion, a Lakehouse stores raw images and unstructured text natively. This allows data scientists to run Machine Learning models—such as OCR for menus or sentiment analysis for reviews—directly on the same platform where financial transactions are stored.

2. **Real-Time Analytics and ACID Compliance:** GPS location logs require high-frequency ingestion, while payment transactions require strict consistency (ACID compliance) to ensure data integrity. A Data Lakehouse uses a metadata layer (such as Delta Lake) that allows for reliable concurrent reads and writes. This ensures that a high-volume stream of GPS data doesn't interfere with the accuracy of financial reporting.

3. **Cost-Effective Scalability:** Startups generate massive volumes of telemetry (GPS logs) that can become prohibitively expensive to store in a Data Warehouse. The Lakehouse architecture allows the startup to store "cold" historical data on inexpensive cloud object storage while maintaining the ability to query it with high-performance SQL when needed, providing the best "price-to-performance" ratio as the data grows.