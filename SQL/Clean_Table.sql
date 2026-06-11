CREATE TABLE HR_Employee_Attrition_Cleaned AS 
SELECT 

      -- Basic Demographics 
      Age,
      Gender,
      MaritalStatus AS Marital_Status,
      
      -- Attrition
      Attrition,
      
      CASE
          WHEN Attrition = 'Yes' THEN 1
          ELSE 0
	  END AS Attrition_Flag,
      
      -- Travel/Department 
      BusinessTravel AS Business_Travel,
      Department,
      
      -- Education 
      CASE
          WHEN Education = 1 THEN 'Below College'
          WHEN Education = 2 THEN 'College'
          WHEN Education = 3 THEN 'Bachelor'
          WHEN Education = 4 THEN 'Master'
          WHEN Education = 5 THEN 'Doctor'
	  END AS Education_Level,
      
      EducationField AS Education_Field,
      
      -- Compensation 
      DailyRate AS Daily_Rate,
      HourlyRate AS Hourly_Rate,
      MonthlyIncome AS Monthly_Income,
      MonthlyRate AS Monthly_Rate,
      PercentSalaryHike AS Percent_Salary_Hike,
      StockOptionLevel AS Stock_Option_Level,
      
      -- Job Information 
      JobRole AS Job_Role,
      JobLevel AS Job_Level, 
      
      CASE 
         WHEN JobInvolvement = 1 THEN 'Low'
         WHEN JobInvolvement = 2 THEN 'Medium'
         WHEN JobInvolvement = 3 THEN 'High'
         WHEN JobInvolvement = 4 THEN 'Very High'
	  END AS Job_Involvement, 
      
      OverTime AS Overtime, 
      
      -- Satisfaction Metrics 
      CASE 
          WHEN EnvironmentSatisfaction = 1 THEN 'Low'
          WHEN EnvironmentSatisfaction = 2 THEN 'Medium'
          WHEN EnvironmentSatisfaction = 3 THEN 'High'
          WHEN EnvironmentSatisfaction = 4 THEN 'Very High'
	  END AS Environment_Satisfaction, 
      
      CASE
          WHEN JobSatisfaction = 1 THEN 'Low'
          WHEN JobSatisfaction = 2 THEN 'Medium'
          WHEN JobSatisfaction = 3 THEN 'High'
          WHEN JobSatisfaction = 4 THEN 'Very High'
	  END AS Job_Satisfaction, 
      
      CASE
          WHEN RelationshipSatisfaction = 1 THEN 'Low'
          WHEN RelationshipSatisfaction = 2 THEN 'Medium'
          WHEN RelationshipSatisfaction = 3 THEN 'High'
          WHEN RelationshipSatisfaction = 4 THEN 'Very High'
	  END AS Relationship_Satisfaction, 
      
      CASE
          WHEN WorkLifeBalance = 1 THEN 'Bad'
          WHEN WorkLifeBalance = 2 THEN 'Good'
          WHEN WorkLifeBalance = 3 THEN 'Better'
          WHEN WorkLifeBalance = 4 THEN 'Best'
	  END AS Work_Life_Balance, 
      
      -- Performance 
      CASE 
          WHEN PerformanceRating = 3 THEN 'Excellent'
          WHEN PerformanceRating = 4 THEN 'Outstanding' 
	  END AS Performance_Rating, 
      
      -- Experience 
      TotalWorkingYears AS Total_Working_Years,
      NumCompaniesWorked AS Num_Companies_Worked,
      TrainingTimesLastYear AS Training_Times_Last_Year,
      
      YearsAtCompany AS Years_At_Company,
      YearsInCurrentRole AS Years_In_Current_Role,
      YearsSinceLastPromotion AS Years_Since_Last_Promotion, 
      YearsWithCurrManager AS Years_With_Current_Manager,
      
      DistanceFromHome AS Distance_From_Home,
      
      -- Age Groups 
      CASE
          WHEN Age BETWEEN 18 AND 25 THEN 'Young Adult'
          WHEN Age BETWEEN 26 AND 35 THEN 'Early Career'
          WHEN Age BETWEEN 36 AND 45 THEN 'Mid Career'
          ELSE 'Senior Employee'
	  END AS Age_Group,
      
      -- Income Brackets 
      CASE
          WHEN MonthlyIncome < 3000 THEN 'Low Income'
          WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Mid Income'
          ELSE 'High Income'
	  END AS Income_Bracket,
      
      -- Tenure Groups 
      CASE 
          WHEN YearsAtCompany BETWEEN 0 AND 2 THEN 'New Employee'
          WHEN YearsAtCompany BETWEEN 3 AND 5 THEN 'Early Tenure'
          WHEN YearsAtCompany BETWEEN 6 AND 10 THEN 'Experienced'
          ELSE 'Veteran'
	  END AS Tenure_Group 
      
FROM HR_Employee_Attrition_Raw;

-- Verifying New Table 
SELECT *
FROM HR_Employee_Attrition_Cleaned 
LIMIT 10;

-- Check Row Count 
SELECT COUNT(*)
FROM HR_Employee_Attrition_Cleaned;