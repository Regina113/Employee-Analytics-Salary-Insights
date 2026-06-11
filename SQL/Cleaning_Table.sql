SELECT * FROM HR_EMPLOYEE_ATTRITION_RAW
LIMIT 10;

-- Total Row Count
SELECT COUNT(*)
FROM HR_EMPLOYEE_ATTRITION_RAW;

-- NULL Values
SELECT *
FROM HR_EMPLOYEE_ATTRITION_RAW
WHERE 
     Age is NULL
     OR Attrition IS NULL
     OR Department IS NULL
     OR MonthlyIncome IS NULL;

-- Duplicates
SELECT 
     EmployeeNumber, 
     COUNT(*) AS duplicate_count
FROM HR_EMPLOYEE_ATTRITION_RAW
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Attrition Checks
SELECT DISTINCT Attrition
FROM HR_EMPLOYEE_ATTRITION_RAW;

-- Gender Check
SELECT DISTINCT Gender
FROM HR_EMPLOYEE_ATTRITION_RAW;

-- Business Travel Check
SELECT DISTINCT BusinessTravel
FROM HR_EMPLOYEE_ATTRITION_RAW;

-- Negative Income Check
SELECT *
FROM HR_EMPLOYEE_ATTRITION_RAW
WHERE MonthlyIncome < 0;

-- Impossible Ages
SELECT *
FROM HR_EMPLOYEE_ATTRITION_RAW
WHERE Age < 18 OR Age > 70;

-- Negative Working Years
SELECT *
FROM HR_EMPLOYEE_ATTRITION_RAW
WHERE TotalWorkingYears < 0;

-- Quick Summary Statistics
SELECT 
     MIN(MonthlyIncome) AS Min_Income,
     MAX(MonthlyIncome) AS Max_Income,
     AVG(MonthlyIncome) AS Avg_Income
FROM HR_Employee_Attrition_Raw;

SHOW COLUMNS FROM HR_Employee_Attrition_Raw;

ALTER TABLE HR_Employee_Attrition_Raw
RENAME COLUMN ï»¿Age TO Age;
