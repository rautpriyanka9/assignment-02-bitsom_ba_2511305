## Architecture Diagram

```mermaid
graph LR
    subgraph Sources [Data Sources]
        A[EHR/EMR Databases]
        B[ICU Monitoring Devices]
        C[Billing & ERP Systems]
    end

    subgraph Ingestion [Ingestion Layer]
        D[Batch ETL - Airflow]
        E[Streaming - Kafka]
    end

    subgraph Lakehouse [Medallion Storage - Data Lakehouse]
        direction TB
        F[(Bronze: Raw Data)]
        G[(Silver: Cleaned & Anonymized)]
        H[(Gold: Aggregated Tables)]
        F --> G
        G --> H
    end

    subgraph Consumption [Business & AI Goals]
        I[ML Model: Readmission Risk]
        J[NLP: Patient History Queries]
        K[BI Dashboard: Mgmt Reports]
        L[Real-time ICU Alerts]
    end

    %% Data Flows
    A --> D
    C --> D
    B --> E
    
    D --> F
    E --> F

    H --> I
    G --> J
    H --> K
    G --> L