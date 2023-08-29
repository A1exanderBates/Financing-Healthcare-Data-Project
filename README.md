# Financing-Healthcare-Data-Project

Welcome to my Financing Healthcare Data Engineering Project, a project pursued to demonstrate skills with key tools, technologies, and concepts related to data and analytics engineering. See [table of contents](#table-of-contents ) below to navigate.

### Full Data Pipeline Architecture
![Financing Healthcare Data Pipeline Architecture](./images/financing_healthcare_data_engineering_diagram.png)

## Table of Contents

[1. About the Dataset](#about-the-dataset)
[2. Technologies Used](#technologies-used)
[3. ETL Processes and Data Modeling](#etl-processes-and-data-modeling")
[4. Future Improvements](#future-improvements)

## About the Dataset

The Financing Healthcare dataset, available from Kaggle [here](https://www.kaggle.com/datasets/programmerrdai/financing-healthcare), was originally sourced by a non-profit organization called, [Our World in Data](https://ourworldindata.org/). The [Healthcare Spending](https://ourworldindata.org/financing-healthcare) research paper by E. Ortiz-Ospina and M. Roser provides open access to the data, licensed under the Creative Commons BY License. Full citation of the paper available here: Esteban Ortiz-Ospina and Max Roser (2017) - "Healthcare Spending". Published online at OurWorldInData.org. Retrieved from: 'https://ourworldindata.org/financing-healthcare' [Online Resource]

## Technologies Used

Prefect - a data orchestration tool that automates, schedules, and monitors data workflows, ensuring robust and reliable data pipeline execution with built-in failure handling. Used as the data orchestration tool for data ingestion from Kaggle to AWS S3.

AWS S3 (Simple Storage Service) - a scalable cloud storage service from Amazon Web Services, designed for secure and easy-to-use object storage with high availability and durability. Used to store the csv data from Kaggle.

Snowflake - a cloud-native data warehousing platform that offers easy scalability, on-demand compute, and seamless data integration with a variety of cloud platforms. Used as the central data warehouse for financing healthcare data and serves as the compute engine behind the dbt data transformations.

dbt Cloud - a centralized environment for developing, deploying, and collaborating on dbt projects, streamlining the transformation of raw data into trusted insights. Used as the data transformation tool.


## ETL Processes and Data Modeling


## Future Improvements

There are three main future improvements I plan to tackle over the coming weeks. 

**A. Testing and Data Quality Tests**

Testing and data quality checks are paramount in data engineering because they ensure the reliability and accuracy of data pipelines. As businesses increasingly rely on data-driven decisions, even minor errors in data processing can lead to significant misinterpretations, resulting in flawed business strategies. By implementing robust testing and quality checks, data engineers can identify and rectify inconsistencies, missing values, or anomalies early in the pipeline, guaranteeing that end users receive trustworthy and high-caliber data for their analytics and operational needs.

I plan to ehance the data ingestion pipeline and dbt workflow by incorporating tests throughout. Some of these tests will include:
* NULL values tests
* Volume tests
* Accepted range/numeric distribution tests
* Source freshness checks

**B. Performance and Optimization**

Refactoring data pipelines for performance and optimization is vital in data engineering to handle growing data volumes efficiently and to ensure that data is available for analysis in near real-time. By streamlining and enhancing these pipelines, data engineers can reduce latency, minimize resource consumption, and provide more reliable data delivery, enabling businesses to derive insights faster and make informed decisions promptly.

**C. End Analysis and/or Tableau Dashboard**

Incorporating an analysis component or a Tableau data visualization in a data engineering project illuminates the value and potential of the data being processed, offering stakeholders tangible insights and a visual representation of their data's story. This not only validates the integrity and efficacy of the engineered pipelines but also empowers decision-makers with accessible, actionable intelligence, bridging the gap between raw data and meaningful business strategy.







------------------------------------


### Financing Healthcare ERD of Raw Tables
![Financing Healthcare ERD](./images/financing_healthcare_ERD.png)
