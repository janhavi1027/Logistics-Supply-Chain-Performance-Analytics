# Delhivery Logistics Performance & Supply Chain Analytics 

##  Project Overview
This project focuses on identifying operational bottlenecks and optimizing delivery performance for **Delhivery**. Using a dataset of over **26,300+ trips**, I performed end-to-end data analysis—starting from data cleaning in Python to complex querying in SQL and finally creating a 3-page interactive dashboard in Power BI.

##  Problem Statement
The primary goal was to analyze delivery efficiency by comparing actual travel times against OSRM (Estimated) times, identifying "Red Zones" (high delay states), and understanding the impact of route types and distances on overall logistics performance.

##  Tech Stack
- **Python:** Data Cleaning & Preprocessing (Handling missing values, Outliers).
- **SQL (PostgreSQL):** Advanced Querying to answer 10 critical business questions.
- **Power BI:** 3-Page Interactive Dashboard for visual storytelling.

---

##  SQL Analysis: 10 Business Questions Answered
I executed the following queries on the `logistics` database to extract actionable insights:

1.  **Overall Delay Rate (KPI):** What percentage of total orders are delivered late?
2.  **Red Zones Identification:** Which states have the highest average delivery delay?
3.  **Operational Bottlenecks:** Which route types (FTL vs. Carting) contribute most to delays?
4.  **Root Cause Analysis:** Are delays caused more by sellers or by carriers?
5.  **Inefficiency Detection:** Which locations miss commitments despite short distances (<100km)?
6.  **Distance vs. Delay:** Does delivery distance directly impact the duration of the delay?
7.  **Speed Efficiency:** How does the average transport speed correlate with delivery delays?
8.  **Reliability KPI:** How does the 'Efficiency Ratio' impact delivery commitments?
9.  **Route-Level Analysis:** Which specific source-to-destination routes are the most problematic?
10. **Critical Cases:** Top 10 worst-performing deliveries requiring immediate management action.

---

##  Power BI Dashboard Highlights
The dashboard is divided into **3 specialized pages**:

### 1. Executive Summary (Overview)
- **High-level KPIs:** Total Trips, Average Delay Minutes, and Overall Efficiency Ratio.
- **Delivery Status:** Breakdown of On-time vs. Late deliveries.
- **State-wise Performance:** A map visual showing delay intensity across India.

### 2. Efficiency & Speed Analysis
- **Route Type Comparison:** Analyzing FTL vs. Carting performance.
- **Distance Impact:** Visualizing how short vs. long-haul trips behave.
- **Speed Buckets:** Identifying the sweet spot for vehicle speed to minimize delays.

### 3. Route & Bottleneck Deep-Dive
- **Top 10 Problematic Routes:** Detailed table of specific routes with highest delays.
- **Efficiency Levels:** Categorizing trips into High, Medium, and Low efficiency.
- **Reason for Delay:** Visualizing Seller vs. Carrier delay contributions.

---

##  Key Insights
- **High Delay States:** States like Maharashtra and Uttar Pradesh show higher average delays, needing infrastructure review.
- **Carrier vs. Seller:** A significant portion of delays occurs during the carrier phase, suggesting a need for better transit routing.
- **Efficiency Gap:** Trips with an efficiency ratio below 0.8 consistently miss delivery deadlines.

---

## 📂 How to Use
1. **SQL Queries:** Check the `logistics_queries.sql` file for the full code.
2. **Data Cleaning:** The Python logic is available in the `Data_Cleaning.ipynb` notebook.
3. **Visualization:** Download the `.pbix` file to interact with the dashboard.
