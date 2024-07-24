/* . Provide list active employee tenure and determine their current employment status, this should inlude EmployeeID,
Employee Name, Department, Date of Hire,  Employee Status , Tenure and order by higher Tenure 
*/

SELECT *
FROM (
	SELECT 
		EmpID,
		Employee_Name,
		Department, 
		DateofHire,
		CASE
			WHEN DATEOFTermination IS NULL THEN 'Active'
			ELSE 'Inactive' END AS EmployeeStatus,
		CASE 
			WHEN DateofTermination IS NOT NULL THEN DATEDIFF(YEAR, DateofHire, DateofTermination)
			ELSE DATEDIFF(YEAR, DateofHire, GETDATE())
		END AS Tenure
	FROM 
		HRDataset_New) AS EmpTenure 
WHERE EmployeeStatus = 'active' 
order by Tenure desc 

