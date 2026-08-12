# Online Retail Data Warehouse - dbt

---

This repository contains the dbt transformation layer of an educational data warehouse project built from a transactional Online Retail dataset.

The project is designed to demonstrate how raw transactional data can be transformed into an analytical data warehouse using Snowflake and dbt, following dimensional modeling principles.

## Project Objective

The objective of this project is to use a transactional dataset to design and implement a data warehouse for educational purposes.

The ingestion process is handled by a separate Python project:

[Python Snowflake Online Retail Data Ingestion](https://github.com/k1ssa1/python_snowflake_online_retail_data_ingestion/tree/main)

This repository is responsible for the second stage: data transformation and warehouse modeling with dbt.

---

## Dataset


### Online Retail

The dataset contains transactional data from a UK-based and registered non-store online retailer. The company mainly sells unique all-occasion gifts, and many of its customers are wholesalers.

The dataset contains transactions occurring between:

`01/12/2010` and `09/12/2011`

### Source

UCI Machine Learning Repository:

https://archive.ics.uci.edu/dataset/352/online+retail

### Data Attribution

#### Creator

Daqing Chen

School of Engineering
London South Bank University

#### DOI

`10.24432/C5BW33`

#### License

The dataset is licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** license:

https://creativecommons.org/licenses/by/4.0/legalcode

---

## Using the starter project

Try running the following commands:
- dbt run
- dbt test
---

## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
