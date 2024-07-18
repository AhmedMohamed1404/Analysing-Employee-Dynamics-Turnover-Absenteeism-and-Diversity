# Analyzing-Employee-Dynamics-Turnover-Absenteeism-and-Diversity


## Table of Contents 
- [Project Overview](project-overview)
- [Data Source](data-source)
- [Tools](tools)
- [Data Cleaning/Preparation](data-cleaning/preparation)
- [Exploratory Data Analysis](exploratory-data-analysis)
- [Data Analysis](data-analysis)
- [Findings](findings)
- [Recommandations](recommandations)
- [Limitations](limitations)


### Project Overview: -
The Project aims to conduct a comprehensive analysis of Human Resource related metrics to gain actionalbe insights into employee turnover, absenteesim trends and diversity profiles within the organisation. 

### Data Source
The Human Resource data set was dowloaded from Kaggle [Dowload here](https://www.kaggle.com/datasets/rhuebner/human-resources-data-set/data)

### Tools 
- SQL Server - Cleaning / Data Analysis 
- Power BI  - Creating Reports

### Data Cleaning / Preparation 
The initial data preparation phase, we performed following tasks 
1. Data Exploration: Understand dataset structure, contents, and potential issues.
2. Data Profiling: Identify data types, distributions, missing values, and anomalies for cleaning or preprocessing.
3. Data Sampling: Extract a representative subset for initial analysis and testing of cleaning procedures.
4. Data Dictionary Review: Review metadata to grasp dataset structure, meaning, and potential quality issues prior to cleaning

### Exploratory Data Analysis
Exploratory Data Analysis (EDA) was applied to the Human Resource data to examine and understand specific questions or issues related to the data

- What are the key factors contributing to employee turnover?
- What are the overal absenteeism across different departments ?  What are the absenteeism rates across different demographic groups (e.g., age, gender)?
- What are our best recruiting sources if we want to ensure a diverse organization?
  
### Data analysis 

``` SQL

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

```

### Findings 


### Recommandations 
