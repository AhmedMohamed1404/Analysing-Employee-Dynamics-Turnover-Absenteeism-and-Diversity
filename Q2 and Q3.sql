

-- Recruitment Sources 
SELECT RecruitmentSource, COUNT(*) AS CNT 
FROM HRDataset_New 
GROUP BY RecruitmentSource ;
-- Gender Diversity 
SELECT RecruitmentSource, 
	COUNT(CASE 
			WHEN GenderID = 1 THEN 1 END) AS MALE,
	COUNT(CASE 
			WHEN GenderID = 0 THEN 1 END) AS FEMALE,
	COUNT(*) AS TOTAL_CNT,
	FORMAT(CAST(COUNT(CASE WHEN GenderID = 1 THEN 1 END) AS float) / COUNT(*) , 'P') AS MalePercentage,
	FORMAT(CAST(COUNT(CASE WHEN GenderID = 0 THEN 1 END) AS float) / COUNT(*) , 'P') AS FemalePercentage
FROM HRDataset_New 
GROUP BY RecruitmentSource ;

-- Racial Diversity 

WITH CTE_RacianDiversity AS(
		SELECT RecruitmentSource, 
				COUNT(CASE WHEN RaceDesc = 'Black or African American' THEN 1  END) AS Black, 
				COUNT(CASE WHEN RaceDesc = 'Asian' THEN 1  END) AS Asian,
				COUNT(CASE WHEN RaceDesc = 'White' THEN 1  END) AS White, 
				COUNT(CASE WHEN RaceDesc = 'Hispanic' THEN 1 END) AS Hispanic,
				COUNT(CASE WHEN RaceDesc = 'American indian or Alaska Native' THEN 1 END) AS Native_Americans,
				COUNT(CASE WHEN RaceDesc = 'Two or more races' THEN 1 END) AS Others,
				COUNT(*) Total_CNT
		
		FROM HRDataset_New 
		GROUP BY RecruitmentSource 
		)
SELECT  RecruitmentSource,
		FORMAT(	CAST(Black AS float) / Total_CNT, 'p') BlackPercentage,
		FORMAT(	CAST(Hispanic AS float) / Total_CNT, 'p') HispanicPercentage,
		FORMAT(	CAST(White AS float) / Total_CNT, 'p') AS WhitePercentage,
		FORMAT(	CAST(Asian AS float) / Total_CNT, 'p') As AsianPercentage,
		FORMAT(	CAST(Native_Americans AS float) / Total_CNT, 'p') AS Native_AmericansPercentage,
		FORMAT(	CAST(Others AS float) / Total_CNT, 'P') AS OthersPercentage 
FROM CTE_RacianDiversity 

