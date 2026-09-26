# 🎬 MovieLens Data Transformation Project — dbt + Snowflake + AWS S3

An end-to-end data transformation and analytics engineering project built using **AWS S3, Snowflake, and dbt** with the MovieLens dataset.

The project focuses on storing raw data in **Amazon S3**, loading it into Snowflake, and using **dbt** to transform raw data into clean staging models, dimension/fact tables, and analytical marts.

---

## 🏗️ Architecture

```text
MovieLens CSV Files
        │
        ▼
   Amazon S3
   Raw Storage
        │
        ▼
    Snowflake
    RAW Layer
        │
        ▼
       dbt
 ┌───────────────┐
 │ Staging       │
 │ Transformations│
 │ Data Tests    │
 │ Snapshots     │
 │ Macros        │
 └───────────────┘
        │
        ▼
  Analytics Models
 ┌──────────────────────┐
 │ Dimension Tables      │
 │ Fact Tables           │
 │ Mart Tables           │
 └──────────────────────┘

```

---

## 🎯 Project Objective

The goal of this project was to build a structured transformation workflow for MovieLens data while learning and applying practical **analytics engineering and data engineering concepts**.

The project focuses on:

* Storing raw data using **Amazon S3**
* Working with raw datasets in **Snowflake**
* Building transformations with **dbt**
* Creating reusable SQL models
* Organizing models into staging, dimension, fact, and mart layers
* Implementing dbt data quality tests
* Using dbt snapshots for tracking changes
* Using seeds for reference data
* Creating reusable dbt macros
* Building a clean and maintainable analytics layer

---

## 🛠️ Tech Stack

| Technology            | Purpose                                       |
| --------------------- | --------------------------------------------- |
| **AWS S3**            | Raw file storage                              |
| **Snowflake**         | Cloud data warehouse                          |
| **dbt**               | Data transformation and analytics engineering |
| **SQL**               | Data transformation                           |
| **Python**            | Supporting data workflows                     |
| **MovieLens Dataset** | Source dataset                                |
| **Git & GitHub**      | Version control                               |

---

## 📂 Project Structure

```text
dbt-movielens/
│
├── analyses/
│   └── movies_analysis.sql
│
├── macros/
│   └── check_nulls.sql
│
├── models/
│   ├── staging/
│   │   ├── src_links.sql
│   │   ├── src_movies.sql
│   │   ├── src_ratings.sql
│   │   └── src_tags.sql
│   │
│   ├── dim/
│   │   ├── dim_movies.sql
│   │   └── dim_users.sql
│   │
│   ├── fact/
│   │   ├── fact_ratings.sql
│   │   └── fact_tags.sql
│   │
│   ├── mart/
│   │   └── mart_movie_release_date.sql
│   │
│   ├── schema.yml
│   └── sources.yml
│
├── seeds/
│   └── movie_release_date.csv
│
├── snapshots/
│   └── snap_tags.sql
│
├── tests/
│   └── rating_range.sql
│
├── dbt_project.yml
├── packages.yml
├── package-lock.yml
└── README.md
```

---

## 🔄 dbt Transformation Layers

### 1. Staging Layer

The staging models provide a clean starting point for downstream transformations.

```text
src_links
src_movies
src_ratings
src_tags
```

These models standardize and prepare the raw MovieLens data before it is used by analytical models.

### 2. Dimension Layer

Dimension tables contain descriptive information used for analysis.

```text
dim_movies
dim_users
```

### 3. Fact Layer

Fact tables contain measurable/event-level data.

```text
fact_ratings
fact_tags
```

### 4. Mart Layer

The mart layer contains models designed for specific analytical use cases.

```text
mart_movie_release_date
```

---

## 🧪 Data Quality & Testing

Data quality is implemented using dbt tests.

The project includes:

* Schema tests
* Source definitions
* Custom SQL tests
* Rating range validation
* Null checking through a reusable macro

Example:

```text
tests/
└── rating_range.sql
```

This helps ensure that transformed data follows the expected business and data-quality rules.

---

## 📸 dbt Features Used

This project helped me practice several core dbt concepts:

### Models

SQL transformations are organized into reusable dbt models rather than maintaining one large SQL script.

### Sources

Source definitions are maintained using:

```text
models/sources.yml
```

### Seeds

Reference data is loaded using:

```text
seeds/movie_release_date.csv
```

### Snapshots

A dbt snapshot is used for tracking changes over time:

```text
snapshots/snap_tags.sql
```

### Macros

Reusable SQL logic is implemented using:

```text
macros/check_nulls.sql
```

### Tests

Custom and schema-level tests are used to validate transformed data.

---

## ☁️ AWS S3

Amazon S3 is used as the **raw file storage layer** for the project.

The general workflow is:

```text
Local MovieLens Files
        ↓
      AWS S3
        ↓
   Data Warehouse
        ↓
    dbt Models
```

Using S3 as the storage layer helped me understand the separation between **data storage, data warehousing, and transformation** in a modern data stack.

---

## ❄️ Snowflake

Snowflake is used as the cloud data warehouse where the MovieLens data is made available for transformation.

The project follows a layered approach:

```text
RAW
 ↓
DBT STAGING
 ↓
DIMENSIONS / FACTS
 ↓
MARTS
```

This structure makes the transformation workflow easier to maintain and extend.

---

## 📊 Key Concepts Practiced

Through this project, I worked with:

* Data lake/object storage concepts
* Amazon S3
* Cloud data warehousing
* Snowflake
* dbt
* SQL transformations
* ELT architecture
* Staging models
* Dimension and fact modeling
* Data marts
* Data quality testing
* dbt sources
* dbt seeds
* dbt snapshots
* dbt macros
* Git/GitHub version control

---

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone https://github.com/Aditech95/dbt-movielens.git
cd dbt-movielens
```

### 2. Install dbt

Install the required dbt adapter for your Snowflake environment.

### 3. Configure Snowflake credentials

Configure your dbt profile locally.

**Do not commit credentials or `.env` files to GitHub.**

### 4. Install dbt packages

```bash
dbt deps
```

### 5. Load seeds

```bash
dbt seed
```

### 6. Run the models

```bash
dbt run
```

### 7. Run tests

```bash
dbt test
```

---

## 📌 Future Improvements

Some possible extensions to the project:

* Add an orchestration layer using Airflow
* Automate S3 → Snowflake ingestion
* Add incremental dbt models
* Add more analytical marts
* Add dbt documentation and lineage
* Add a BI dashboard
* Automate the complete pipeline using AWS services

---

## 👨‍💻 Author

**Aditya Chauhan**



* GitHub: [@Aditech95](https://github.com/Aditech95)
* LinkedIn: [Aditya Chauhan](https://www.linkedin.com/in/adityachauhan95/)

---


**Repository:**
https://github.com/Aditech95/dbt-movielens
