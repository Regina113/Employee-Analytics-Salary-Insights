CREATE TABLE Departments (
       Department_ID INT AUTO_INCREMENT PRIMARY KEY,
       Department_Name VARCHAR(50)
);

INSERT INTO Departments (Department_Name)
SELECT DISTINCT Department 
FROM HR_Employee_Attrition_Raw;

CREATE TABLE Job_Roles (
       Job_Role_ID INT AUTO_INCREMENT PRIMARY KEY,
       Job_Role_Name VARCHAR(100)
);

INSERT INTO Job_Roles (Job_Role_Name)
SELECT DISTINCT JobRole
FROM HR_Employee_Attrition_Raw;

CREATE TABLE Education_Levels (
       Education_Level_ID INT PRIMARY KEY,
       Education_Level_Name VARCHAR(50)
);

INSERT INTO Education_Levels VALUES
(1, 'Below College'),
(2, 'College'),
(3, 'Bachelor'),
(4, 'Master'),
(5, 'Doctor');

CREATE TABLE Satisfaction_Levels (
       Satisfaction_Level_ID INT PRIMARY KEY,
       Satisfaction_Label VARCHAR(20)
);

INSERT INTO Satisfaction_Levels VALUES 
(1, 'Low'),
(2, 'Medium'),
(3, 'High'),
(4, 'Very High');

CREATE TABLE Employees (
       Employee_ID INT PRIMARY KEY,
       
       Age INT,
       Gender VARCHAR(20),
       Marital_Status VARCHAR(20),
       
       Attrition VARCHAR(10),
       
       Department_ID INT,
       Job_Role_ID INT,
       Education_Level_ID INT,
       
       Monthly_Income INT,
       Overtime VARCHAR(10),
       
       Total_Working_Years INT,
       Years_At_Company INT,
       
       FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID), 
       FOREIGN KEY (Job_Role_ID) REFERENCES Job_Roles(Job_Role_ID),
       FOREIGN KEY (Education_Level_ID) REFERENCES Education_Levels(Education_Level_ID)
);

INSERT INTO Employees (
       Employee_ID,
       Age,
       Gender,
       Marital_Status,
       Attrition,
       Department_ID,
       Job_Role_ID, 
       Education_Level_ID,
       Monthly_Income, 
       Overtime,
       Total_Working_Years,
       Years_At_Company
)

SELECT 
      r.EmployeeNumber,
      r.Age,
      r.Gender,
      r.MaritalStatus,
      r.Attrition,
      
      d.Department_ID,
      j.Job_Role_ID,
      r.Education,
      
      r.MonthlyIncome,
      r.OverTime,
      
      r.TotalWorkingYears,
      r.YearsAtCompany
      
FROM HR_Employee_Attrition_Raw r 
JOIN Departments d ON r.Department = d.Department_Name 
JOIN Job_Roles j ON r.JobRole = j.Job_Role_Name;