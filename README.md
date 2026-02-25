# Fraud Detection Analysis Dashboard

## 📌 Project Overview
Fraudulent transactions cause significant financial losses and operational risk for organizations.  
This project demonstrates an **end-to-end data analytics approach** to analyze transaction data, identify fraud patterns, quantify financial loss, and support decision-making using **Python, SQL, and Power BI**.

The focus of this project is **analytics and insights**, not real-time systems or machine learning deployment.

---

## 🎯 Business Problem
How can an organization:
- Monitor fraudulent transactions effectively?
- Measure fraud rate and financial loss?
- Identify high-risk cities, merchant categories, and transactions?
- Enable analysts and managers to take data-driven actions?

## 🧭 Project Approach (End-to-End Flow)

Business Problem  
↓  
Synthetic Data Generation (Python)  
↓  
Exploratory Data Analysis (Python – Jupyter)  
↓  
Data Storage & Modeling (MySQL)  
↓  
Business Queries & KPIs (SQL)  
↓  
Interactive Dashboard (Power BI + DAX)  
↓  
Insights & Decision Support  

---

## 🧪 Step 1: Data Generation (Python)
- Generated a **synthetic transaction dataset** (~450 records).
- Included realistic attributes such as:
  - Transaction amount, date, city, merchant category
  - International transaction indicator
  - Previous failed attempts
  - Fraud flag (~15% fraud rate)
- Output saved as a CSV file for downstream analysis.

**Tool:** Python (Pandas, NumPy)

---

## 🔍 Step 2: Exploratory Data Analysis (Python)
Performed EDA using Jupyter Notebook to understand:
- Fraud vs non-fraud distribution
- Fraud concentration by city and merchant category
- Transaction amount patterns
- Fraud trends over time
- Relationships between fraud and risk indicators

EDA ensured data quality and guided KPI selection before database storage.

**Tool:** Python (Pandas, Matplotlib, Seaborn)

---

## 🗄️ Step 3: Database Design & Data Loading (MySQL)
- Designed a **normalized relational schema**:
  - `users` (master data)
  - `transactions` (transaction details)
  - `fraud_predictions` (fraud labels)
- Enforced **primary and foreign key relationships**.
- Used staging tables and `LOAD DATA INFILE` for reliable CSV ingestion.
- Ensured correct load order to maintain referential integrity.

**Tool:** MySQL

---

## 📊 Step 4: Business Queries & KPIs (SQL)
Created reusable SQL queries to answer business questions:
- Total transactions
- Total fraud cases
- Fraud rate (%)
- Total fraud loss
- Fraud by city
- Fraud by merchant category
- High-risk transactions
- International vs domestic fraud distribution

These queries formed the analytical backbone for Power BI.

---

## 📈 Step 5: Interactive Dashboard (Power BI)
Built a **one-page storytelling dashboard** with:
- Executive KPIs (Total Transactions, Fraud Rate, Fraud Loss)
- Fraud distribution by city and merchant category
- Fraud trend over time
- International vs domestic fraud comparison
- Transaction-level drill-down with slicers

Implemented business logic using **DAX measures** and designed visuals for clarity and decision-making.

**Tool:** Power BI, DAX

---

![Fraud Detection Analysis Dashboard Preview :](images/dashboard%20preview.png).

## 💡 Key Insights
- Fraud accounts for ~15% of total transactions, indicating moderate risk exposure.
- Fraud losses are significant, justifying targeted fraud control measures.
- Certain cities and merchant categories contribute disproportionately to fraud.
- International transactions show a higher share of fraud compared to domestic ones.
- High-value transactions represent critical risk and require immediate attention.

---

## 🧠 Skills Demonstrated
- Business problem understanding
- Data generation & EDA
- SQL data modeling and querying
- KPI design using DAX
- Dashboard storytelling & visualization
- End-to-end analytics workflow

---

## 🚀 Conclusion
This project demonstrates how a data analyst can transform raw transaction data into actionable insights using a structured, end-to-end analytics approach. The solution is **internship-ready**, **interview-defensible**, and aligned with real-world business workflows.