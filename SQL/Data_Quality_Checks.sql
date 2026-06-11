-- Row Count Validation
SELECT COUNT(*) AS Total_Rows
FROM hr_employee_attrition_raw;

-- Duplicate Employees
SELECT
     EmployeeNumber,
     COUNT(*) AS Duplicate_Count
FROM hr_employee_attrition_raw
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Overall Null Check
SELECT
     SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Nulls,
     SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Attrition_Nulls,
     SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Department_Nulls,
     SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS Income_Nulls,
     SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS JobRole_Nulls
FROM hr_employee_attrition_raw;

-- Category Consistency Checks
SELECT DISTINCT Attrition
FROM hr_employee_attrition_raw;

SELECT DISTINCT Gender
FROM hr_employee_attrition_raw;

SELECT DISTINCT BusinessTravel
FROM hr_employee_attrition_raw;

SELECT DISTINCT Department
FROM hr_employee_attrition_raw;

-- Impossible Value Checks
SELECT *
FROM hr_employee_attrition_raw
WHERE Age < 18
OR Age > 70;

SELECT *
FROM hr_employee_attrition_raw
WHERE MonthlyIncome < 0;

SELECT *
FROM hr_employee_attrition_raw
WHERE TotalWorkingYears < 0;

SELECT * 
FROM hr_employee_attrition_raw
WHERE DistanceFromHome < 0;

-- Logical Consistency Checks
SELECT *
FROM hr_employee_attrition_raw
WHERE YearsAtCompany > TotalWorkingYears;

SELECT *
FROM hr_employee_attrition_raw
WHERE YearsInCurrentRole > YearsAtCompany;

SELECT *
FROM hr_employee_attrition_raw
WHERE YearsWithCurrManager > YearsAtCompany;

-- Outlier Analysis
-- Salary Distribution Summary
SELECT
     MIN(MonthlyIncome) AS Min_Income,
     MAX(MonthlyIncome) AS Max_Income,
     AVG(MonthlyIncome) AS Avg_Income,
     ROUND(STDDEV(MonthlyIncome), 2) AS Std_Dev_Income
FROM hr_employee_attrition_raw;

-- Extremely High Salaries
SELECT *
FROM hr_employee_attrition_raw
WHERE MonthlyIncome > 30000;

-- Cardinality Exploration
-- Number of Employees Per Department 
SELECT 
      Department,
      COUNT(*) AS Employee_Count
FROM hr_employee_attrition_raw
GROUP BY Department 
ORDER BY Employee_Count DESC;

-- Number of Employees Per Job Role
SELECT
     JobRole,
     COUNT(*) AS Employee_Count
FROM hr_employee_attrition_raw
GROUP BY JobRole
ORDER BY Employee_Count DESC;