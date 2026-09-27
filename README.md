# 🚚 Delhivery: Supply Chain Performance & Predictive Delay Engine

> **Delhivery Analytics Engine** is an end-to-end logistics analytics platform that combines **Predictive Machine Learning (Random Forest)**, **PostgreSQL analytics**, and **Power BI dashboarding** to analyze trip telemetry, forecast transit delays, identify bottleneck routes, and quantify potential SLA financial risk.

---

---

## 📌 Executive Summary & Problem Statement

Modern logistics networks process millions of shipment movements across multiple origin-destination corridors. Even small delays across individual routes can accumulate into significant operational inefficiencies and potential SLA breach exposure.

### 🎯 Analytical Solution

The **Delhivery Supply Chain Analytics Engine** transforms raw logistics telemetry into actionable operational insights through a 3-stage analytical workflow:

1. **PostgreSQL Data Sanitization & Analysis**  
   Uses multi-tier CTEs, window functions, ranking, and aggregation techniques to clean telemetry data and identify high-risk delay corridors.

2. **Predictive Delay Forecasting Engine**  
   A `RandomForestRegressor` learns historical spatial and temporal travel patterns to predict transit delays.

3. **Interactive SLA Risk Dashboard**  
   Power BI provides interactive corridor-level analysis, operational KPIs, and a dynamic What-If financial risk simulator.

---

## ✨ Key Features & Highlights

### 🎯 High-Performance Delay Prediction

The Random Forest regression model achieved:

- **R² Score:** 0.9984
- **MAE:** 3.08 minutes
- **RMSE:** 5.12 minutes

The model was benchmarked against Linear Regression and Decision Tree Regression.

### 💸 SLA Financial Risk Analysis

The analytics pipeline estimated approximately **₹1.47 Crore (₹14.7 Million)** in potential SLA penalty exposure across the analyzed test telemetry records.

### 🚦 Bottleneck & Delay Corridor Analysis

Advanced SQL analytics using window functions and cumulative aggregations were used to identify routes experiencing significant delay variation and operational bottlenecks.

### 📊 Interactive Power BI Dashboard

The dashboard provides:

- Origin-destination corridor filtering
- State-level analysis
- Shipment delay KPIs
- Mean transit speed
- Route-level performance metrics
- Dynamic SLA penalty What-If analysis

---

## 🛠️ Tech Stack

| Domain | Tools & Technologies |
| :--- | :--- |
| **Programming** | Python 3.10+ |
| **Notebook Environment** | Jupyter Notebook |
| **Database** | PostgreSQL 15 |
| **Data Processing** | Pandas, NumPy |
| **Machine Learning** | Scikit-Learn |
| **ML Models** | Random Forest, Decision Tree, Linear Regression |
| **Visualization** | Matplotlib, Seaborn |
| **Business Intelligence** | Power BI Desktop |
| **Version Control** | Git, GitHub |

---

## 🏗️ System Architecture

```text
┌──────────────────────────────┐
│   Raw Logistics Telemetry    │
│      Trip & OHT Records      │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│     PostgreSQL Analytics     │
│                              │
│ • Data Sanitization          │
│ • CTEs                       │
│ • Window Functions           │
│ • Route-Level Aggregation    │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│   Feature Engineering & ML   │
│                              │
│ • Feature Preparation        │
│ • Random Forest Regression   │
│ • Model Evaluation           │
│ • Delay Prediction           │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│      Power BI Dashboard      │
│                              │
│ • KPI Monitoring             │
│ • Corridor Analysis          │
│ • Delay Risk                 │
│ • SLA Financial Simulation   │
└──────────────────────────────┘
```

---

## 🔬 Predictive Model Benchmarking

Three regression models were evaluated for transit delay prediction:

| Model | R² Score | MAE (Minutes) | RMSE (Minutes) |
| :--- | ---: | ---: | ---: |
| Linear Regression | 0.8842 | 14.12 | 22.45 |
| Decision Tree Regressor | 0.9810 | 5.20 | 9.80 |
| **Random Forest Regressor** | **0.9984** | **3.08** | **5.12** |

The Random Forest model produced the highest R² and lowest MAE/RMSE among the evaluated models.

---

## 📈 Power BI Dashboard

The Power BI dashboard provides an executive-level view of logistics performance and SLA risk.

### Key Dashboard Components

- **Origin-Destination Corridor Slicers**
  - Filter logistics performance by origin
  - Filter by destination
  - Analyze state-level route performance

- **Delay Performance KPIs**
  - Overall delayed shipment percentage
  - Average transit speed
  - Route-level delay metrics

- **SLA Financial Risk Simulator**
  - Interactive What-If penalty threshold
  - Dynamic potential penalty exposure
  - Route-level financial risk analysis

- **Operational Bottleneck Analysis**
  - Identify high-delay corridors
  - Compare route performance
  - Analyze delay variation

> The complete dashboard is available in `Delhivery_analytics_dashboard.pbix`.

---

## 📁 Repository Structure

```text
Logistics-Supply-Chain-Performance-Analytics/
│
├── logistics_analysis_output/
│   └── Delhivery_analytics_dashboard.pdf
│
├── Delhivery_analytics_dashboard.pbix
├── delhivery_data.csv
├── logistics_advanced_queries.sql
├── logistics_ML_Pipeline.ipynb
├── README.md
└── LICENSE
```

### File Description

| File | Description |
| :--- | :--- |
| `delhivery_data.csv` | Raw logistics telemetry dataset |
| `logistics_advanced_queries.sql` | PostgreSQL analytical queries using CTEs and window functions |
| `logistics_ML_Pipeline.ipynb` | End-to-end ML and feature engineering pipeline |
| `Delhivery_analytics_dashboard.pbix` | Interactive Power BI dashboard |
| `Delhivery_analytics_dashboard.pdf` | PDF export of dashboard visuals |
| `LICENSE` | MIT License |

---

# 🚀 Quick Start

## 1. Clone the Repository

```bash
git clone https://github.com/janhavi1027/Logistics-Supply-Chain-Performance-Analytics.git
cd Logistics-Supply-Chain-Performance-Analytics
```

## 2. Create a Virtual Environment

### Windows

```bash
python -m venv venv
.\venv\Scripts\activate
```

### macOS / Linux

```bash
python3 -m venv venv
source venv/bin/activate
```

## 3. Install Dependencies

```bash
pip install pandas numpy scikit-learn matplotlib seaborn jupyter
```

## 4. Run the Analytics Pipeline

### PostgreSQL Analysis

1. Create a PostgreSQL database.
2. Import `delhivery_data.csv`.
3. Execute:

```text
logistics_advanced_queries.sql
```

The SQL workflow performs data analysis using:

- Common Table Expressions (CTEs)
- Window Functions
- Ranking
- Aggregation
- Route-level performance analysis

### Machine Learning Pipeline

Launch Jupyter Notebook:

```bash
jupyter notebook
```

Then open:

```text
logistics_ML_Pipeline.ipynb
```

Run the notebook sequentially to reproduce the feature engineering, model training, prediction, and evaluation workflow.

### Power BI Dashboard

Open:

```text
Delhivery_analytics_dashboard.pbix
```

using **Power BI Desktop**.

---

## 🧠 Analytical Workflow

The complete project follows the pipeline below:

```text
Raw Dataset
     │
     ▼
Data Cleaning & Validation
     │
     ▼
Exploratory Data Analysis
     │
     ▼
PostgreSQL Analytics
     │
     ├── CTEs
     ├── Window Functions
     ├── Route Aggregations
     └── Delay Analysis
     │
     ▼
Feature Engineering
     │
     ▼
Model Benchmarking
     │
     ├── Linear Regression
     ├── Decision Tree
     └── Random Forest
     │
     ▼
Transit Delay Prediction
     │
     ▼
SLA Risk Quantification
     │
     ▼
Power BI Executive Dashboard
```

---

## 📊 Key Analytical Metrics

The project focuses on the following operational metrics:

### Transit Performance

- Average transit time
- Mean transit speed
- Shipment delay percentage
- Route-level delay variation

### Route Performance

- Origin-destination corridor performance
- High-delay routes
- Bottleneck identification
- Delay variance

### Predictive Analytics

- R² Score
- Mean Absolute Error (MAE)
- Root Mean Squared Error (RMSE)

### Financial Risk

- Potential SLA penalty exposure
- Penalty threshold simulation
- Route-level financial risk

---

## 🔎 Machine Learning Pipeline

The predictive pipeline follows these stages:

```text
Historical Trip Data
        │
        ▼
Data Preprocessing
        │
        ▼
Feature Engineering
        │
        ▼
Train/Test Split
        │
        ▼
Model Training
        │
        ├── Linear Regression
        ├── Decision Tree
        └── Random Forest
        │
        ▼
Model Evaluation
        │
        ▼
Transit Delay Prediction
```

The primary predictive model is:

```python
RandomForestRegressor
```

Model performance is evaluated using:

```text
R² Score
MAE
RMSE
```

---

## 💡 Business Use Cases

The analytics engine can support logistics operations teams in:

- Identifying delay-prone transportation corridors
- Monitoring route-level operational performance
- Estimating potential SLA penalty exposure
- Prioritizing high-risk routes for operational intervention
- Understanding historical transit patterns
- Supporting data-driven logistics planning
- Simulating the financial impact of different SLA penalty thresholds

---

## 📌 Project Outcomes

The project demonstrates an end-to-end analytics workflow connecting:

**Raw Data → SQL Analytics → Machine Learning → Business Intelligence**

Key outcomes include:

- Predictive transit delay modeling
- Route-level bottleneck identification
- SQL-based logistics analytics
- SLA financial risk quantification
- Interactive Power BI reporting
- Comparative evaluation of multiple regression models

---

## 📜 License

This project is distributed under the **MIT License**.

See the [`LICENSE`](LICENSE) file for details.

---

## 👤 Author

**Janhavi Sakore**

B.Tech — Artificial Intelligence & Machine Learning  
Madhav Institute of Technology and Science, Gwalior

### 🔗 Project Repository

[Logistics-Supply-Chain-Performance-Analytics](https://github.com/janhavi1027/Logistics-Supply-Chain-Performance-Analytics)

---
