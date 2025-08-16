use ironman;


Drop TABLE if EXISTS Company_Information;

CREATE TABLE Company_Information (
    Company_id INT PRIMARY KEY,
    Company_Name VARCHAR(255),
    Q1_Result INT,
    Q2_Result INT,
    Q3_Result INT,
    Q4_Result INT,
    Company_Size_id INT,
    Sector INT,
    Estimated_Growth DECIMAL(3,1),
    Last_Year_Growth DECIMAL(3,1),
    Company_HQ_id INT,
    Growth_Percent DECIMAL(3,1)
);


INSERT INTO Company_Information VALUES
(1, 'Infosys', 9800, 7506, 8802, 5076, 5, 1, 6.9, 8.1, 1, -1.2),
(2, 'Wipro', 5080, 6210, 4500, 4230, 5, 1, 6.1, 7.3, 1, -1.2),
(3, 'Kaven Seed', 507, 602, 582, 650, 3, 7, 7.1, 6.9, 1, 0.2),
(4, 'Alfie', 1055, 950, 990, 910, 3, 8, 5.2, 5.7, 5, -0.5),
(5, 'GHCL', 210, 280, 250, 295, 2, 9, 5.7, 5.5, 1, 0.2),
(6, 'Hindustan Aeron', 1050, 1890, 1280, 1350, 3, 10, 4.9, 5.8, 1, -0.9),
(7, 'Atul', 750, 450, 875, 756, 3, 9, 6.1, 6.1, 1, 0.0),
(8, 'Apollo Hospital', 1508, 1026, 1210, 1209, 3, 11, 5.8, 5.5, 1, 0.3),
(9, 'Chegg', 75, 90, 56, 50, 1, 2, 3.5, 4.1, 2, -0.6),
(10, 'Himalaya Food', 365, 453, 560, 360, 2, 7, 5.6, 5.05, 1, 0.55),
(11, 'Info Edge', 750, 950, 800, 760, 3, 8, 5.2, 5.5, 1, -0.3),
(12, 'DIC India', 670, 560, 752, 560, 3, 9, 5.6, 5.12, 1, 0.48),
(13, 'Bharat Dynamics', 1505, 1800, 1200, 1650, 4, 10, 6.2, 5.7, 1, 0.5),
(14, 'Aster DM', 250, 350, 310, 280, 2, 11, 5.3, 4.95, 6, 0.35),
(15, 'First Republic', 1280, 1500, 350, 380, 3, 5, 2.1, 5.8, 2, -3.7),
(16, 'Unacademy', 2010, 1800, 1950, 1875, 3, 2, 5.6, 6.07, 1, -0.47),
(17, 'Reliance', 10080, 9850, 10100, 1100, 5, 3, 7.2, 6.5, 1, 0.7),
(18, 'Adani', 8550, 9550, 8560, 9840, 5, 3, 7.0, 5.2, 1, 1.8),
(19, 'Capgemini', 3650, 3255, 3120, 3080, 5, 1, 5.2, 6.0, 4, -0.8),
(20, 'Byjus', 1200, 1150, 900, 759, 4, 2, 4.2, 5.7, 1, -1.5),
(21, 'Cognizant', 8500, 900, 7568, 7050, 5, 1, 5.4, 6.5, 2, -1.1),
(22, 'Snapcolve', 50, 30, 35, 20, 1, 2, 2.3, 4.0, 3, -1.7),
(23, 'TVS motor', 10520, 15200, 12000, 11005, 5, 4, 7.01, 6.7, 1, 0.31),
(24, 'Tata Motor', 5500, 10500, 11050, 10590, 5, 4, 6.5, 6.2, 1, 0.3),
(25, 'Jet Airways', 2560, 3500, 3610, 2850, 4, 6, 5.9, 5.9, 1, 0.0),
(26, 'Signature bank', 10260, 10200, 6500, 4520, 3, 5, 3.2, 5.0, 2, -1.8),
(27, 'Sillicon Valley', 2560, 1250, 1050, 750, 3, 5, 2.5, 5.2, 2, -2.7),
(28, 'Spicejet', 8560, 7500, 8500, 7890, 4, 6, 6.3, 6.1, 1, 0.2);

Drop TABLE if EXISTS Company_Sector;

CREATE TABLE Company_Sector (
    Sector_ID INT PRIMARY KEY,
    Sector_Name VARCHAR(255),
    Performance_ID INT,
    Effect_of_Covid VARCHAR(3),
    Effect_of_CrudePrice VARCHAR(3)
);

INSERT INTO Company_Sector (Sector_ID, Sector_Name, Performance_ID, Effect_of_Covid, Effect_of_CrudePrice)  
VALUES  
    (1, 'IT', 2, 'YES', 'NO'),  
    (2, 'Education', 2, 'YES', 'NO'),  
    (3, 'Commodities', 4, 'YES', 'YES'),  
    (4, 'Automobile', 4, 'YES', 'YES'),  
    (5, 'Bank', 1, 'NO', 'NO'),  
    (6, 'Airline', 3, 'YES', 'YES'),  
    (7, 'Agriculture', 4, 'YES', 'YES'),  
    (8, 'BPO', 2, 'YES', 'NO'),  
    (9, 'Chemicals', 2, 'NO', 'NO'),  
    (10, 'Defence', 4, 'NO', 'NO'),  
    (11, 'Health Care', 4, 'NO', 'NO');  

Drop TABLE if EXISTS Company_Performance;

CREATE TABLE Company_Performance (
    Performance_id INT PRIMARY KEY,
    Performance_Grade VARCHAR(10)
);

INSERT INTO Company_Performance (Performance_id, Performance_Grade) VALUES
(1, 'Poor'),
(2, 'Good'),
(3, 'Average'),
(4, 'Best');

Drop TABLE if EXISTS company_workforce;

CREATE TABLE Company_Workforce (
    Company_id INT PRIMARY KEY,
    Company_Size VARCHAR(20),
    Workforce_Strength VARCHAR(50),
    Male_per INT,
    Female_per INT
);

INSERT INTO Company_Workforce (Company_id, Company_Size, Workforce_Strength, Male_per, Female_per) VALUES
(1, 'Very Small', '< 200', 40, 60),
(2, 'Small', '> 200 and < 500', 65, 35),
(3, 'Medium', '> 500 and < 5000', 60, 40),
(4, 'Large', '> 5000 and < 50000', 70, 30),
(5, 'Very Large', '> 50000', 68, 32);


Drop TABLE if EXISTS Company_HeadQuarter;

CREATE TABLE Company_HeadQuarter (
    Nation_id INT PRIMARY KEY,
    HeadQuarters VARCHAR(50),
    Inflation DECIMAL(4,2)
);

INSERT INTO Company_HeadQuarter (Nation_id, HeadQuarters, Inflation) VALUES
(1, 'India', 5.56),
(2, 'America', 7.12),
(3, 'China', 1.06),
(4, 'France', 1.96),
(5, 'Singapore', 1.56),
(6, 'U.A.E', 2.02);

-- Retrieve the number of companies in each sector that have shown negative growth, 
-- as this will indicate which sectors have been impacted by the economic slowdown.

SELECT Sector, COUNT (*) AS NumCompanies
FROM Company_Information AS ci
WHERE Growth_Percent < 0
GROUP BY Sector;

-- Retrieve the number of companies in each headquarters, 
-- along with their respective headquarters names, and sort the data in descending order based on the total number of companies.

SELECT ch.HeadQuaters, COUNT(ch.Nation_id) AS Companies_Count
FROM Company_Information AS ci
JOIN Company_HeadQuarter AS ch ON ci.Company_HQ_id = ch.Nation_id
GROUP BY ch.HeadQuaters
ORDER BY Companies_Count DESC;

-- List the names of companies that are classified as very large in size, have shown a positive growth percent (earning more than the previous year)
-- , and have made a positive impact on the country's growth.

SELECT ci.Company_Name
FROM Company_Information AS ci
INNER JOIN Company_WorkForce AS cw ON ci.Company_Size_id = cw.Company_id
WHERE cw.Company_size = 'Very Large'
AND ci.Growth_Percent > 0;

SELECT t1.Company_Name, t1.Company_Size_id, t1.Q1_Result
FROM Company_Information AS t1
JOIN (
SELECT Company_Size_id, MAX (Q1_Result) AS Max_Q1_Result FROM
Company_Information AS ci
GROUP BY Company_Size_id) AS t2 ON t1.Company_Size_id = t2.Company_Size_id 
AND t1.Q1_Result = t2.Max_Q1_Result;

-- Additionally, you are required to categorize the companies as "High Risk"
--  when their Growth_Percent is negative and as "Low Risk" when their Growth_Percent is positive, 
--  assigning the respective category under the column named Risk_Category.

SELECT Company_Name, 
  CASE
    WHEN Growth_Percent < 0 THEN 'High Risk'
    ELSE 'Low Risk'
  END AS Risk_Category
FROM Company_Information;

-- Approach 1: Direct Query with CASE Expression
SELECT Company_Name,
       CASE 
         WHEN Growth_Percent < 0 THEN 'High Risk'
         WHEN Growth_Percent > 0 THEN 'Low Risk'
         ELSE 'Low Risk'
       END AS Risk_Category
FROM Company_Information;

-- Approach 2: Using a Common Table Expression (CTE)
WITH CompanyRisk AS (
  SELECT Company_Name,
         CASE 
           WHEN Growth_Percent < 0 THEN 'High Risk'
           WHEN Growth_Percent > 0 THEN 'Low Risk'
           ELSE 'Low Risk'
         END AS Risk_Category
  FROM Company_Information
)
SELECT Company_Name, Risk_Category
FROM CompanyRisk;

-- You are interested in identifying "Sector" where at least one company showed positive growth.
-- Please determine the number of companies in that category and record it under the column named "Recession_Free_Companies".

SELECT Sector, COUNT(*) AS Recession_Free_Companies
FROM Company_Information
WHERE Growth_Percent >= 0
GROUP BY Sector;
-- Your task is to identify the names of the companies and sectors whose Q4 result earnings are lower than the average of
--  their earnings across all quarters and also determine the average of each company

SELECT Company_Name, Sector,
       ((Q1_Result + Q2_Result + Q3_Result + Q4_Result) / 4) AS Average
FROM Company_Information AS ci
WHERE ((Q1_Result + Q2_Result + Q3_Result + Q4_Result) / 4) > Q4_Result;


-- Your task is to identify the sector and determine the highest estimated growth value within each sector.
-- Afterwards, present the results sorted in descending order based on the sectors with the highest estimated growth.

SELECT Sector, MAX (Estimated_Growth) AS Highest_Estimated_Growth
FROM Company_Information AS ci
GROUP BY Sector
ORDER BY Highest_Estimated_Growth DESC;

-- Your objective is to identify the sector name and calculate the total growth for each sector,
--  sorting the results in descending order based on the total growth of each sector.
-- Approach 1: Using JOIN
SELECT cs.Sector_Name, SUM(ci.Growth_Percent) AS Total_Growth
FROM Company_Information ci
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
GROUP BY cs.Sector_Name
ORDER BY Total_Growth DESC;

-- Approach 2: Using a subquery to fetch Sector_Name for each sector
SELECT 
   (SELECT cs.Sector_Name FROM Company_Sector cs WHERE cs.Sector_id = ci.Sector) AS Sector_Name,
   SUM(ci.Growth_Percent) AS Total_Growth
FROM Company_Information ci
GROUP BY ci.Sector
ORDER BY Total_Growth DESC;

--or
SELECT
  cs.Sector_Name,
  SUM(ci.Growth_Percent) AS Total_Growth
FROM
  Company_Information AS ci
  JOIN Company_Sector AS cs ON ci.Sector = cs.Sector_id
GROUP BY
  cs.Sector_Name
ORDER BY
  Total_Growth DESC;

-- Your task is to retrieve the sector names and their corresponding performance grades where the effect of crude oil prices 
-- is deemed to be "NO," indicating that these sectors are not impacted by the increase in crude oil prices.
-- Approach 1: Using an INNER JOIN

SELECT cs.Sector_Name, cp.Performance_Grade
FROM Company_Sector cs
INNER JOIN Company_Performance cp ON cs.Performance_Id = cp.Performance_id
WHERE cs.Effect_of_Crudeprice = 'NO';

-- Approach 2: Using a Subquery

SELECT Sector_Name, 
       (SELECT Performance_Grade 
        FROM Company_Performance 
        WHERE Performance_id = Company_Sector.Performance_Id) AS Performance_Grade
FROM Company_Sector
WHERE Effect_of_Crudeprice = 'NO';

-- Your objective is to identify the company names and their corresponding sector where the inflation rate in the country is lower than the average inflation rate across all countries, and at the same time, the growth percent of these companies is positive.
-- These companies have demonstrated outstanding results regardless of their country's economic situation.

SELECT ci.Company_Name, ci.Sector
FROM Company_Information AS ci
JOIN Company_HeadQuarter AS ch ON ci.Company_HQ_Id = ch.Nation_id
WHERE ch.Inflation < (
  SELECT AVG(Inflation)
  FROM Company_HeadQuarter
)
AND ci.Growth_Percent >= 0;

-- Your task is to identify the sector with the highest overall estimated growth, 
-- considering only companies headquartered in countries where the inflation rate is less than 3.
SELECT
  cs.Sector_Name,
  MAX (ci.Estimated_Growth) AS Highest_Estimated_Growth
FROM
  Company_Information AS ci
  JOIN Company_HeadQuarter AS ch ON ci.Company_HQ_id = ch.Nation_id
  JOIN Company_Sector AS cs ON ci.Sector = cs.Sector_id
WHERE
  ch.Inflation <3
GROUP BY
  cs.Sector_Name;

-- Your task is to identify the names of the companies that have shown 'Poor' performance.
-- Approach 1: Using JOINs
SELECT ci.Company_Name
FROM Company_Information AS ci
JOIN Company_Sector AS cs ON ci.Sector = cs.Sector_id
JOIN Company_Performance AS cp ON cs.Performance_Id = cp.Performance_id
WHERE cp.Performance_Grade = 'Poor';

-- Approach 2: Using Subqueries

SELECT Company_Name
FROM Company_Information
WHERE Sector IN (
    SELECT Sector_id
    FROM Company_Sector
    WHERE Performance_Id = (
        SELECT Performance_id
        FROM Company_Performance
        WHERE Performance_Grade = 'Poor'
    )
);

--or
SELECT Company_Name
FROM Company_Information AS ci
WHERE Sector IN (
  SELECT Sector_id
  FROM Company_Sector AS cs
  WHERE Performance_Id IN (
    SELECT Performance_id
    FROM Company_Performance AS cp
    WHERE Performance_Grade = 'Poor'
  )
);

-- Your task is to identify those companies' names, growth_percent and sector name in the IT 
-- sector whose estimated growth is higher than the average estimated growth of the companies in the sector.

-- Approach 1: Subquery Filtering
SELECT CI.Company_Name, CI.Growth_Percent, CS.Sector_Name
FROM Company_Information CI
JOIN Company_Sector CS ON CI.Sector = CS.Sector_id
WHERE CS.Sector_Name = 'IT'
  AND CI.Estimated_Growth > (
      SELECT AVG(Estimated_Growth)
      FROM Company_Information
      WHERE Sector = CI.Sector
  );

-- Approach 2: Using a Common Table Expression (CTE) 
WITH avg_growth AS (
    SELECT Sector, AVG(Estimated_Growth) AS avg_estimated_growth
    FROM Company_Information
    GROUP BY Sector
)
SELECT CI.Company_Name, CI.Growth_Percent, CS.Sector_Name
FROM Company_Information CI
JOIN Company_Sector CS ON CI.Sector = CS.Sector_id
JOIN avg_growth AG ON CI.Sector = AG.Sector
WHERE CS.Sector_Name = 'IT'
  AND CI.Estimated_Growth > AG.avg_estimated_growth;

--or

SELECT
  ci.Company_Name,
  ci.Growth_percent,
  cs.Sector_Name
FROM
  Company_Information AS ci
  JOIN Company_Sector AS cs ON ci.Sector = cs.Sector_id
WHERE
  cs.Sector_Name = 'IT' AND ci.Estimated_Growth > (
    SELECT AVG(ci2.Estimated_Growth)
    FROM Company_Information AS ci2
    JOIN Company_Sector AS cs2 ON ci2.Sector = cs2.Sector_id
    WHERE cs2.Sector_Name = 'IT'
  );

-- You need to determine which sectors have a higher concentration of companies headquartered in countries with inflation greater than 3, compared to countries with inflation less than or equal to 3.
-- If a sector has more companies with inflation greater than 3 than companies with inflation less than or equal to 3, mark that sector as 'Greater inflation.'
-- Otherwise, mark it as 'Lesser inflation'.
-- Record it under the column named "Inflation_Comparison".
-- Additionally, you should sort the Sector_Name in increasing order to show how each sector is affected by inflation.

SELECT cs.Sector_Name,
       CASE WHEN SUM(CASE WHEN ch.Inflation > 3 THEN 1 ELSE 0 END) > SUM(CASE WHEN ch.Inflation <= 3 THEN 1 ELSE 0 END)
            THEN 'Greater inflation'
            ELSE 'Lesser inflation'
       END AS Inflation_Comparison
FROM Company_HeadQuarter ch
JOIN Company_Information ci ON ch.Nation_id = ci.Company_HQ_Id
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
GROUP BY cs.Sector_Name 
ORDER BY cs.Sector_Name;

--or
WITH InflationCounts AS (
   SELECT cs.Sector_Name,
          SUM(CASE WHEN ch.Inflation > 3 THEN 1 ELSE 0 END) AS high_inflation_count,
          SUM(CASE WHEN ch.Inflation <= 3 THEN 1 ELSE 0 END) AS low_inflation_count
   FROM Company_Information ci
   JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
   JOIN Company_HeadQuarter ch ON ci.Company_HQ_Id = ch.Nation_id
   GROUP BY cs.Sector_Name
)
SELECT Sector_Name,
       CASE 
           WHEN high_inflation_count > low_inflation_count THEN 'Greater inflation'
           ELSE 'Lesser inflation'
       END AS Inflation_Comparison
FROM InflationCounts
ORDER BY Sector_Name;

-- You are interested in identifying the companies within the 'Defence' and 'IT' sectors that have achieved an Estimated Growth above 5.
-- Additionally, you would like to understand how this growth correlates with their performance grade and the impact of COVID-19 and crude oil prices.
-- Furthermore, sorting the results in ascending order of sector name and then in descending order based on estimated growth will allow us to identify the companies with the highest growth rates first.
-- By analyzing the available data, we can examine the relationship between estimated growth, performance grade, and the effects of COVID-19 and crude oil prices for these companies.

SELECT
  ci.Company_Name,
  cs.Sector_Name,
  ci.Growth_percent,
  cp.Performance_Grade,
  cs.Effect_of_covid,
  cs.Effect_of_Crudeprice
FROM
  Company_Information AS ci
  JOIN Company_Sector AS cs ON ci.Sector = cs.Sector_id
  JOIN Company_Performance AS cp ON cs.Performance_Id = cp.Performance_id
WHERE
  cs.Sector_Name IN ('Defence', 'IT')
  AND ci.Estimated_Growth>5 
ORDER BY
  cs.Sector_Name,
  ci.Estimated_Growth DESC;

--or
-- Approach 2: Using a Common Table Expression (CTE)
WITH Combined AS (
    SELECT 
        ci.Company_Name,
        cs.Sector_Name,
        ci.Growth_Percent,
        cp.Performance_Grade,
        cs.Effect_of_Covid,
        cs.Effect_of_Crudeprice,
        ci.Estimated_Growth
    FROM Company_Information ci
    INNER JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
    INNER JOIN Company_Performance cp ON cs.Performance_Id = cp.Performance_id
)
SELECT 
    Company_Name,
    Sector_Name,
    Growth_Percent,
    Performance_Grade,
    Effect_of_Covid,
    Effect_of_Crudeprice
FROM Combined
WHERE Sector_Name IN ('Defence', 'IT')
  AND Estimated_Growth > 5
ORDER BY Sector_Name ASC, Estimated_Growth DESC;

-- Approach 1: Using Direct JOINs
SELECT 
    ci.Company_Name,
    cs.Sector_Name,
    ci.Growth_Percent,
    cp.Performance_Grade,
    cs.Effect_of_Covid,
    cs.Effect_of_Crudeprice
FROM Company_Information AS ci
JOIN Company_Sector AS cs ON ci.Sector = cs.Sector_id
JOIN Company_Performance AS cp ON cs.Performance_Id = cp.Performance_id
WHERE cs.Sector_Name IN ('Defence', 'IT')
  AND ci.Estimated_Growth > 5
ORDER BY cs.Sector_Name ASC, ci.Estimated_Growth DESC;