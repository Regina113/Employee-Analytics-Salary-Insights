-- Window Functions
-- Rank Highest Paid Employees 
SELECT 
     Job_Role, 
     Department, 
     Monthly_Income, 
     RANK() OVER(ORDER BY Monthly_Income DESC) AS Salary_Rank
FROM hr_employee_attrition_cleaned;

-- Dense Rank Salaries Within Department 
SELECT 
     Department,
     Job_Role,
     Monthly_Income,
     DENSE_RANK() OVER(PARTITION BY Department 
                       ORDER BY Monthly_Income DESC) AS Department_Salary_Rank
FROM hr_employee_attrition_cleaned;

-- Running Salary Average 
SELECT 
      Age, 
      Monthly_Income, 
      ROUND(AVG(Monthly_Income) OVER(ORDER BY Age), 2) AS Running_Avg_Salary
FROM hr_employee_attrition_cleaned;

-- Common Table Expressions
-- Departments Above Overall Attrition Average 
WITH Company_Attrition AS (
                          SELECT AVG(Attrition_Flag) * 100 AS Overall_Attrition_Rate
                          FROM hr_employee_attrition_cleaned)
SELECT 
     Department, 
     ROUND(AVG(Attrition_Flag) * 100, 2) AS Department_Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Department 
HAVING Department_Attrition_Rate > (SELECT Overall_Attrition_Rate
									FROM Company_Attrition);
                                    
-- High Risk Employees CTE
WITH High_Risk_Employees AS (SELECT
                                  Age_Group,
                                  Overtime,
                                  Job_Satisfaction,
                                  Work_Life_Balance,
                                  Attrition_Flag
							FROM hr_employee_attrition_cleaned
                            WHERE Overtime = 'Yes'
							AND Job_Satisfaction = 'Low'
                            AND Work_Life_Balance = 'Bad')
SELECT COUNT(*) AS High_Risk_Employee_Count
FROM High_Risk_Employees;

-- Subqueries
-- Employees Earning Above Company Average 
SELECT
      Job_Role,
      Department,
      Monthly_Income
FROM HR_Employee_Attrition_Cleaned
WHERE Monthly_Income > 
(
    SELECT AVG(Monthly_Income)
    FROM hr_employee_attrition_cleaned
)
ORDER BY Monthly_Income DESC;

-- Highest Paying Department 
WITH Department_Salaries AS (
     SELECT 
          Department,
          AVG(Monthly_Income) AS Avg_Salary
	FROM HR_Employee_Attrition_Cleaned 
    GROUP BY Department 
)
SELECT *
FROM Department_Salaries 
WHERE Avg_Salary = 
(
    SELECT MAX(Avg_Salary)
    FROM Department_Salaries
);

-- Advanced Business KPI Queries 
-- Attrition Risk Score 
SELECT 
     Job_Role,
     ROUND(AVG(CASE
                  WHEN Overtime = 'Yes'
                  AND Work_Life_Balance = 'Bad'
                  AND Job_Satisfaction = 'Low'
                  THEN 1
                  ELSE 0
				END ) * 100, 2) AS Attrition_Risk_Score 
FROM HR_Employee_Attrition_Cleaned
GROUP BY Job_Role
ORDER BY Attrition_Risk_Score DESC;

-- Promotion Stagnation KPI
SELECT 
     Department,
     ROUND(AVG(Years_Since_Last_Promotion), 2) AS Avg_Years_Without_Promotion
FROM hr_employee_attrition_cleaned
GROUP BY Department 
ORDER BY Avg_Years_Without_Promotion DESC;

-- Salary Growth Potential 
SELECT
     Job_Level,
     ROUND(AVG(Monthly_Income), 2) AS Avg_Salary,
     ROUND(AVG(Percent_Salary_Hike), 2) AS Avg_Salary_Hike 
FROM HR_Employee_Attrition_Cleaned
GROUP BY Job_Level
ORDER BY Job_Level;

-- VIEWS
-- Attrition Summary View
CREATE VIEW VW_Attrition_Summary AS 
SELECT 
     Department,
     COUNT(*) AS Total_Employees,
     SUM(Attrition_Flag) AS Attrition_Count,
     ROUND(AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Department;

SELECT *
FROM VW_Attrition_Summary;

-- Salary Insights View 
CREATE VIEW VW_Salary_Insights AS
SELECT
     Job_Role,
     ROUND(AVG(Monthly_Income), 2) AS Avg_Salary,
     MIN(Monthly_Income) AS Min_Salary,
     MAX(Monthly_Income) AS Max_Salary
FROM hr_employee_attrition_cleaned
GROUP BY Job_Role;

SELECT *
FROM VW_Salary_Insights;

-- Stored Procedures
-- Department Salary Procedure 
DELIMITER //
CREATE PROCEDURE GetDepartmentSalaryInsights()
BEGIN
     SELECT
          Department,
          ROUND(AVG(Monthly_Income), 2) AS Avg_Salary,
          ROUND(AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
	FROM hr_employee_attrition_cleaned
    GROUP BY Department;
END //
DELIMITER ; 

CALL GetDepartmentSalaryInsights();

-- Case Based Business Analysis 
-- Which Employees Are Most Likely to Leave?
SELECT
     Department,
     Job_Role,
     Overtime,
     Work_Life_Balance,
     Job_Satisfaction,
     ROUND(AVG(Attrition_Flag) * 100, 2) AS Attrition_Rate
FROM HR_Employee_Attrition_Cleaned 
GROUP BY
       Department,
       Job_Role,
       Overtime,
       Work_Life_Balance,
       Job_Satisfaction
ORDER BY Attrition_Rate DESC;

-- Which Departments Have the Best Retention?
SELECT
     Department,
     ROUND((1 - AVG(Attrition_Flag)) * 100, 2) AS Retention_Rate
FROM hr_employee_attrition_cleaned
GROUP BY Department 
ORDER BY Retention_Rate DESC;

-- Which Jobs Roles Are Underpaid Relative to Satisfaction?
SELECT 
     Job_Role,
     ROUND(AVG(Monthly_Income), 2) AS Avg_Salary,
     ROUND(AVG(CASE
                  WHEN Job_Satisfaction = 'Very High' THEN 4
                  WHEN Job_Satisfaction = 'High' THEN 3
                  WHEN Job_Satisfaction = 'Medium' THEN 2
                  ELSE 1
				END ), 2) AS Satisfaction_Score
FROM hr_employee_attrition_cleaned
GROUP BY Job_Role
ORDER BY Avg_Salary ASC, Satisfaction_Score DESC;