# DEGlobSuicide

Welcome to DEGlobSuicide. This project delves into the exploration and analysis of global suicide rates spanning from 2010 to 2022. Suicide is a pressing public health issue, influenced by a myriad of socioeconomic factors. Understanding the intricate relationship between these factors and suicide rates is pivotal for devising effective prevention strategies. Socioeconomic factors, including at-risk-of-poverty rates, annual growth rates for industry, and healthcare expenditures, play a significant role in explaining suicide rates. While unemployment stands out as a prominent risk factor, the impact of education and income level remains less consistent.

This project forms an integral part of the Data Engineering Zoomcamp course and aims to shed light on global suicide trends through data engineering and visualization techniques.

## Overview

The DEGlobSuicide project aims to analyze suicide trends, demographic patterns, and potential correlations with economic factors. 

The project involves extracting, loading, and transforming (ELT) this data into Google Cloud Platform (GCP), specifically storing it in Google Cloud Storage (GCS) and BigQuery. The workflow also includes data transformation using DBT (Data Build Tool) and visualization using Looker Studio.

## Dataset Information

The [dataset](https://www.kaggle.com/datasets/ronaldonyango/global-suicide-rates-1990-to-2022/data) is sourced from the [Kaggle](https://www.kaggle.com) website.

## Objective

The main objective of this project is to build an end-to-end data pipeline to process, analyze, and visualize the data of suicide trends in world. This involves setting up data lakes, creating pipelines for importing, exporting, processing, and transforming data, integrating with data warehouses, and building interactive dashboards for visualization.

## File Structure

- **Data**: Directory to store the dataset downloaded from the OPSD website.
- **mage-globsuicide**: Contains Mage project.
- **mage-globsuicide/dbt/dbt_globsuicide**: Contains DBT Project.
- **terraform**: Terraform file for setting up GCP infrastructure.
- **reproduce**: Detailed documentation and scripts for reproducing the project and pipelines.

## Technologies Used

- **Programming Language**: Python (for data processing)
- **Cloud**: Google Cloud Platform (GCP)
- **Infrastructure as Code (IaC)**: Terraform
- **Workflow Orchestration**: Mage
- **Data Lake**: GCS (Google Cloud Storage)
- **Data Warehouse**: BigQuery
- **Data Transformation**: DBT (Data Build Tool)
- **Business Intelligence Tools**: Google Data Studio
- **Containerization**: Docker
- **Container Orchestration**: Docker Compose

## Project Components

1. **System and Infrastructure Setup**
2. **Data Ingestion and Loading into Data lake Pipeline**
3. **Loading Data into Data warehouse and Transforming Pipeline**
4. **Dashboard Development for Visualization**

## Workflow

1. **Infrastructure Setup**: The project starts with setting up the required infrastructure using Terraform IaC solution.
2. **Data Ingestion and Data Loading to GCS**: In this step, the project ingests the required data from the OPSD website, processes it, converts the CSV file to Parquet (Parquet format is used for efficient storage), and loads the Parquet formatted data into Google Cloud Storage (GCS) for storage and easy accessibility.
3. **Data Ingestion to BigQuery**: The data stored in GCS is then ingested into BigQuery for transformation. The data is organized into appropriate tables for efficient data processing.
4. **Data Transformation with DBT**: DBT (Data Build Tool) is utilized for data transformations and modeling. This step involves creating views, tables using data transformation techniques such as removing sparse data, cleaning and correcting data, and applying business logic to the data in BigQuery.
5. **Data Visualization with Looker Studio**: The transformed and modeled data in BigQuery is visualized using Looker Studio for insightful data analysis and reporting. Looker Studio connects directly to BigQuery for visualization purposes.



## Dashboard

A dashboard is created using Looker Studio, providing interactive visualizations and insights into the renewable energy power plants data. The dashboard allows users to explore various aspects of the data, including geographical distribution, renewable energy adoption through years, energy sources, capacity trends, and more. A live dashboard will be available [here](https://lookerstudio.google.com/reporting/0bea9b01-4c18-4df6-9907-e9d98efa6bf9/page/L7NxD) for a period of time.

![Dashboard](./img/dashboard.png)

## How to Use

To use this project, the first step is to clone or fork this repository to your machine. Further and detailed information can be found [here](./reproduce/README.md).

## Conclusion

Over the past decade, there has been a positive decline in global suicide rates, possibly due to effective suicide prevention efforts and mental health initiatives. However, demographic disparities such as gender and age reveal the need for targeted interventions. Males are disproportionately affected, and the 35-54 age group and Silent generation are particularly at risk. Moving forward, a comprehensive approach involving mental health education, destigmatization, and tailored support services is crucial. Continued research is essential to understand and address the complex factors influencing suicide rates, with the ultimate goal of creating a society that prioritizes mental well-being and supports individuals in seeking help without fear or stigma.
## License

This project is licensed under the [Apache License](./LICENSE).