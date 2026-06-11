# Employee-Analytics-Salary-Insights
📊 Employee Attrition Analysis Using SQL & Power BI
🧠 Overview

This project analyzes employee attrition using the IBM HR Analytics dataset.
The goal is to identify key drivers of employee turnover and provide actionable insights using SQL-based data processing and an interactive Power BI dashboard.

The analysis explores relationships between attrition and factors such as job role, department, overtime, satisfaction levels, and work-life balance.

🎯 Objectives
Identify the overall attrition rate within the organization
Understand which departments and job roles experience the highest attrition
Analyze the impact of overtime on employee turnover
Explore how job satisfaction and work-life balance influence attrition
Build an interactive dashboard for HR decision-making

🛠️ Tools & Technologies
MySQL
Microsoft Power BI
Microsoft Excel (for data export)
Kaggle Dataset (IBM HR Analytics Employee Attrition & Performance)

📁 Dataset Information
Source: IBM HR Analytics Dataset (Kaggle)
Total Records: 1470 employees
Key Features:
Age, Gender, Education
Department, Job Role, Job Level
Monthly Income, Salary Metrics
Job Satisfaction, Work-Life Balance
Attrition Status

⚙️ Project Workflow
Data Collection
Imported dataset from Kaggle
Data Cleaning & Preparation (MySQL)
Removed inconsistencies and verified data types
Checked for null values and duplicates
Standardized categorical variables
Exploratory Data Analysis (SQL)
Analyzed attrition distribution
Aggregated salary and department-level insights
Identified high-risk employee segments
Data Export
Exported cleaned dataset to CSV for visualization
Dashboard Development (Power BI)
Built interactive visuals and KPI cards
Created attrition breakdowns by department, role, and satisfaction

📊 Key KPIs
👥 Total Employees: 1470
🚪 Employees Who Left: 237
📉 Attrition Rate: 16.12%
💰 Average Monthly Income: (varies by segment)

📈 Key Insights
Sales and Laboratory roles experienced the highest attrition levels
Employees working overtime showed significantly higher turnover rates
Lower job satisfaction strongly correlates with increased attrition
Poor work-life balance contributes to employee exit behavior
Certain departments exhibit higher retention challenges than others

📌 Dashboard Overview

The Power BI dashboard includes:

Executive KPI Summary (Total Employees, Attrition Rate, Employees Left)
Attrition by Department
Attrition by Job Role
Attrition vs Overtime Analysis
Job Satisfaction vs Attrition
Work-Life Balance vs Attrition

🧩 Data Model (ERD Concept)

The dataset was conceptually structured into a normalized model:

Employee Table → Demographics
Job Table → Role & Department Information
Compensation Table → Salary Details
Performance Table → Satisfaction & Attrition Metrics

This structure reflects how HR systems are typically designed in real-world organizations.

🧠 Business Impact

This analysis helps HR teams:

Identify high-risk employee groups
Improve retention strategies
Optimize workforce planning
Understand compensation vs satisfaction relationships

🚀 Future Improvements
Add predictive modeling for employee attrition risk
Build ML model for churn prediction
Introduce drill-through Power BI pages for employee-level insights
Integrate real-time HR data sources

📌 Author

Built as part of a data analytics portfolio project focusing on HR analytics, SQL, and business intelligence.
