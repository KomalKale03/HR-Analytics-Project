-- Total Employees
SELECT 
	COUNT(*) as total_employees 
FROM hr_data;

--Attrition Rate
SELECT
	ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2)
	as attriton_rate_percentage
FROM hr_data;

--Department Wise Employee Count
SELECT 
	department,
	COUNT(*)as employee_count
FROM hr_data
GROUP BY department
ORDER BY employee_count DESC;

--Average Salary by Department
SELECT 
	department,
	AVG(monthlyincome) as avg_salary
FROM hr_data
GROUP BY department;
-- ORDER BY avg_salary DESC;

--Overtime vs Attrition
SELECT 
	overtime,
	attrition,
	COUNT(*)as total
FROM hr_data
GROUP BY overtime, attrition;

--Top 5 Highest Paid Employees
SELECT 
	employeeid,
	monthlyincome
FROM hr_data
ORDER BY monthlyincome
LIMIT 5;

--Avg Performance by Department
SELECT 
	department,
	AVG(performancerating)as avg_performance
FROM hr_data
GROUP BY department;

--Employees Eligible for Promotion (3+ years no promotion)
SELECT * FROM hr_data
WHERE yearssincelastpromotion >=3;

--Attrition by Job Role
SELECT 
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
	jobrole
FROM hr_data
GROUP BY jobrole;

--KPI Query Dashboard Summary
SELECT
COUNT(*)as total_employees,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)AS TotalAttrition,
AVG(monthlyincome)as AvgSalary,
AVG(jobsatisfaction) AS AvgJobSatisfaction,
AVG(performancerating) AS AvgPerformance
FROM hr_data;

	