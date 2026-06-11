-- High Level Workforce Overview
-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM hr_employee_attrition_cleaned;

-- Total Attrition Count
SELECT COUNT(*) AS Employees_Left
FROM hr_employee_attrition_cleaned
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT 
     ROUND(
          (SUM(Attrition_Flag) / COUNT(*)) * 100, 2) AS Attrition_Rate_Percentage
FROM hr_employee_attrition_cleaned;

-- Average Monthly Income 
SELECT 
     ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM hr_employee_attrition_cleaned;

-- Average Employee Age
SELECT
     ROUND(AVG(Age), 1) AS Average_Age
FROM hr_employee_attrition_cleaned;

-- Department Analysis
-- Employee Count By Department 
SELECT
     Department,
     COUNT(*) AS Employee_Count 
FROM hr_employee_attrition_cleaned
GROUP BY Department 
ORDER BY Employee_Count DESC;

-- Average Salary by Department 
SELECT 
     Department,
     ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM hr_employee_attrition_cleaned
GROUP BY Department
ORDER BY Average_Salary DESC;

-- Attrition Rate by Department 
SELECT
     Department,
     COUNT(*) AS Total_Employees,
     SUM(Attrition_Flag) AS Attrition_Count, 
     ROUND(
          (SUM(Attrition_Flag) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Department 
ORDER BY Attrition_Rate DESC;

-- Job Role Analysis
-- Highest Paying Job Roles
SELECT
     Job_Role, 
     ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM hr_employee_attrition_cleaned
GROUP BY Job_Role
ORDER BY Average_Salary DESC;

-- Attrition by Job Role
SELECT 
     Job_Role,
     COUNT(*) AS Employees,
     SUM(Attrition_Flag) AS Attrition_Count,
     ROUND(
          (SUM(Attrition_Flag) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Job_Role
ORDER BY Attrition_Rate DESC;

-- Overtime Analysis
-- Attrition by Overtime 
SELECT 
     Overtime,
     COUNT(*) AS Total_Employees,
     SUM(Attrition_Flag) AS Employees_Left,
     ROUND(
          (SUM(Attrition_Flag) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Overtime;

-- Salary Insights
-- Salary by Education Level
SELECT
     Education_Level,
     ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM hr_employee_attrition_cleaned
GROUP BY Education_Level
ORDER BY Average_Salary DESC;

-- Salary by Gender 
SELECT 
     Gender,
     ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM hr_employee_attrition_cleaned
GROUP BY Gender;

-- Salary by Job Level
SELECT 
     Job_Level,
     ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM hr_employee_attrition_cleaned
GROUP BY Job_Level
ORDER BY Job_Level; 

-- Satisfaction Analysis
-- Job Satisfaction vs Attrition
SELECT 
     Job_Satisfaction, 
     COUNT(*) AS Employees,
     SUM(Attrition_Flag) AS Attrition_Count,
     ROUND(
          (SUM(Attrition_Flag) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Job_Satisfaction
ORDER BY Attrition_Rate DESC;

-- Work Life Balance vs. Attrition
SELECT 
     Work_Life_Balance, 
     COUNT(*) AS Employees,
     SUM(Attrition_Flag) AS Attrition_Count, 
     ROUND(
          (SUM(Attrition_Flag) / COUNT(*)) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Work_Life_Balance 
ORDER BY Attrition_Rate DESC;

-- Environment Satisfaction Analysis 
SELECT 
     Environment_Satisfaction,
     ROUND(AVG(Monthly_Income), 2) AS Avg_Salary,
     ROUND(
         AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Environment_Satisfaction;

-- Experience & Career Growth Analysis 
-- Average Salary by Years at Company
SELECT 
     Years_At_Company,
     ROUND(AVG(Monthly_Income), 2) AS Average_Salary
FROM hr_employee_attrition_cleaned
GROUP BY Years_At_Company
ORDER BY Years_At_Company;

-- Promotion Stagnation Analysis
SELECT 
      Years_Since_Last_Promotion,
      COUNT(*) AS Employee_Count, 
      ROUND(
           AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Years_Since_Last_Promotion
ORDER BY Years_Since_Last_Promotion DESC;

-- Demographic Analysis
-- Attrition by Age Group
SELECT 
     Age_Group,
     COUNT(*) AS Employees, 
     ROUND(
          AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

-- Attrition by Marital Status
SELECT 
     Marital_Status, 
     COUNT(*) AS Employees,
     ROUND(
          AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Marital_Status;

-- Top 10 Highest Paid Employees
SELECT
     Job_Role, 
     Department, 
     Monthly_Income
FROM hr_employee_attrition_cleaned
ORDER BY Monthly_Income DESC
LIMIT 10;

-- Departments With Highest Average Satisfaction
SELECT 
     Department,
     ROUND(AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Department 
ORDER BY Attrition_Rate DESC; 