# Analysing-Employee-Dynamics-Turnover-Absenteeism-and-Diversity


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
The Human Resource data set was dowloaded from Kaggle 

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

#### Turnover  
1. Voluntary Turnover: Top reasons: Better opportunities, dissatisfaction with current role, and better benefits.
2. Involuntary Turnover: Top reasons: Attendance issues, no-call no-show incidents, and criminal background discoveries (e.g., gang affiliation). 
3. Gender-Based Turnover: Female turnover is higher than male turnover, primarily due to voluntary resignations. 

#### Absenteeism 
1. Sales, IT, and production departments have the highest absenteeism among the six departments in the company. 
2. The overall absenteeism rate of females is higher than that of males; however, females have higher overall employee satisfaction.

#### Diversity and Recruitment Source Performance:
1. Indeed, and LinkedIn Attracts candidates from various backgrounds and demographics, ensuring a diverse number of applicants 
2. Diversity Job Fair smaller in application volume than indeed but effective hiring specifically Black and African American minority. 



### Recommandations 

#### Turnover 
1. Career Development Programs: Offer clear career paths and advancement opportunities within the company.
2. Competitive Benefits Packages: Regularly review and improve benefits, including health insurance, retirement plans, and other attractive perks.
3. Role Enrichment and Job Rotation: Provide opportunities for employees to engage in different projects or roles to keep their work interesting and challenging.
4. Competitive Pay Structure: Conduct market salary surveys to ensure the company offers competitive salaries.

   
#### Absenteeism 
1. Implement flexible work arrangements to improve work-life balance.
2. Introduce employee wellness programs to enhance health and job satisfaction.
3. Provide professional development opportunities to keep employees engaged and motivated.


#### Diversity and Recruitment Source Performance:
1. increase the presence of Indeed and LinkedIn with diversity-focused postings,
2. Leverage Diversity Job Fair for target recruitment specifically Black and African American
3. Build a reputation as an employer committed to diversity and equal opportunity.



