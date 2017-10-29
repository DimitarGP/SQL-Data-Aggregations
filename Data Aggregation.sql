-- 01. Records’ Count
SELECT COUNT(wd.Id) AS 'Count'
FROM  WizzardDeposits AS wd

-- 02. Longest Magic Wand
SELECT MAX(wd.MagicWandSize) AS Size
FROM WizzardDeposits AS wd

-- 03. Longest Magic Wand per Deposit Groups 
SELECT	wd.DepositGroup,
		MAX(wd.MagicWandSize) AS LongestMagicWand
 FROM WizzardDeposits AS wd
 GROUP BY wd.DepositGroup

--  04. Smallest Deposit Group per Magic Wand Size
 SELECT TOP(2) DepositGroup
   FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize) DESC

-- 05. Deposits Sum
SELECT  wd.DepositGroup,
		SUM(wd.DepositAmount)
   FROM WizzardDeposits AS wd
GROUP BY DepositGroup

-- 06. Deposits Sum for Ollivander Family
SELECT  wd.DepositGroup, SUM(wd.DepositAmount) AS TotalSum
FROM WizzardDeposits AS wd
WHERE wd.MagicWandCreator = 'Ollivander family'
GROUP BY wd.DepositGroup,wd.MagicWandCreator

-- 07. Deposits Filter
SELECT  wd.DepositGroup, SUM(wd.DepositAmount) AS TotalSum
FROM WizzardDeposits AS wd
WHERE wd.MagicWandCreator = 'Ollivander family'
GROUP BY wd.DepositGroup, wd.MagicWandCreator 
HAVING SUM(wd.DepositAmount) < 150000
ORDER BY wd.DepositGroup DESC

-- 08. Deposit Charge
SELECT  DepositGroup,
		MagicWandCreator,
		MIN(DepositCharge) AS MinDepositCharge
FROM WizzardDeposits
GROUP BY  DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator, DepositGroup 
GO
-- 09. Age Groups
SELECT CASE
				WHEN Age BETWEEN 0 AND 10
			THEN '[0-10]'
				WHEN Age BETWEEN 11 AND 20
			THEN '[11-20]'
				WHEN Age BETWEEN 21 AND 30
			THEN '[21-30]'
				WHEN Age BETWEEN 31 AND 40
			THEN '[31-40]'
				WHEN Age BETWEEN 41 AND 50
			THEN '[41-50]'
				WHEN Age BETWEEN 51 AND 60
			THEN '[51-60]'
				WHEN Age >=61
			THEN '[61+]'
		END,
		COUNT (Age) AS WizardCount 
FROM WizzardDeposits
GROUP BY CASE
				WHEN Age BETWEEN 0 AND 10
			THEN '[0-10]'
				WHEN Age BETWEEN 11 AND 20
			THEN '[11-20]'
				WHEN Age BETWEEN 21 AND 30
			THEN '[21-30]'
				WHEN Age BETWEEN 31 AND 40
			THEN '[31-40]'
				WHEN Age BETWEEN 41 AND 50
			THEN '[41-50]'
				WHEN Age BETWEEN 51 AND 60
			THEN '[51-60]'
				WHEN Age >=61
			THEN '[61+]'
		END

-- 10. First Letter

select * from WizzardDeposits



-- Problem 16
SELECT  DepartmentID,
		MAX(Salary) AS MaxSalary
FROM Employees 
GROUP BY DepartmentID
HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000
GO

