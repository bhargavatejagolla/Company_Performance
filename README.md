# Company Performance & Risk Analysis SQL Project

## Project Overview

**Project Title**: Company Performance & Risk Analysis  
**Level**: Beginner to Intermediate  
**Database**: `ironman`

This project is designed to demonstrate SQL skills to explore, analyze, and interpret company performance data. It includes setup of a relational schema and writing business-focused SQL queries to classify risk, measure growth, and evaluate economic impact.

## Objectives

1. **Set up a company analysis database**: Create and populate a relational schema.
2. **Data Analysis**: Explore performance, growth, sector impact, and macroeconomic indicators.
3. **Business Insight Generation**: Use SQL to identify growth trends and high-risk sectors.

## Project Structure

### 1. Database Setup

```sql
USE ironman;

-- Drop and create main data tables
DROP TABLE IF EXISTS Company_Information;
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

-- Insert sample data (partial rows shown)
INSERT INTO Company_Information VALUES
(1, 'Infosys', 9800, 7506, 8802, 5076, 5, 1, 6.9, 8.1, 1, -1.2),
(2, 'Wipro', 5080, 6210, 4500, 4230, 5, 1, 6.1, 7.3, 1, -1.2);
```

```sql
-- Sectors
DROP TABLE IF EXISTS Company_Sector;
CREATE TABLE Company_Sector (
    Sector_ID INT PRIMARY KEY,
    Sector_Name VARCHAR(255),
    Performance_ID INT,
    Effect_of_Covid VARCHAR(3),
    Effect_of_CrudePrice VARCHAR(3)
);
INSERT INTO Company_Sector VALUES
(1, 'IT', 2, 'YES', 'NO');
```

```sql
-- Performance Grades
DROP TABLE IF EXISTS Company_Performance;
CREATE TABLE Company_Performance (
    Performance_id INT PRIMARY KEY,
    Performance_Grade VARCHAR(10)
);
INSERT INTO Company_Performance VALUES (1, 'Poor'), (2, 'Good');
```

```sql
-- Workforce Data
DROP TABLE IF EXISTS Company_Workforce;
CREATE TABLE Company_Workforce (
    Company_id INT PRIMARY KEY,
    Company_Size VARCHAR(20),
    Workforce_Strength VARCHAR(50),
    Male_per INT,
    Female_per INT
);
INSERT INTO Company_Workforce VALUES
(1, 'Very Small', '< 200', 40, 60);
```

```sql
-- Headquarters
DROP TABLE IF EXISTS Company_HeadQuarter;
CREATE TABLE Company_HeadQuarter (
    Nation_id INT PRIMARY KEY,
    HeadQuarters VARCHAR(50),
    Inflation DECIMAL(4,2)
);
INSERT INTO Company_HeadQuarter VALUES (1, 'India', 5.56);
```

### 2. Business Analysis Queries

#### Identify high-risk vs low-risk companies
```sql
SELECT Company_Name,
  CASE
    WHEN Growth_Percent < 0 THEN 'High Risk'
    ELSE 'Low Risk'
  END AS Risk_Category
FROM Company_Information;
```

#### Sectors with recession-free companies
```sql
SELECT Sector, COUNT(*) AS Recession_Free_Companies
FROM Company_Information
WHERE Growth_Percent >= 0
GROUP BY Sector;
```

#### Companies with Q4 earnings < average of all quarters
```sql
SELECT Company_Name, Sector,
       ((Q1_Result + Q2_Result + Q3_Result + Q4_Result) / 4) AS Average
FROM Company_Information
WHERE ((Q1_Result + Q2_Result + Q3_Result + Q4_Result) / 4) > Q4_Result;
```

#### Highest estimated growth per sector
```sql
SELECT Sector, MAX(Estimated_Growth) AS Highest_Estimated_Growth
FROM Company_Information
GROUP BY Sector
ORDER BY Highest_Estimated_Growth DESC;
```

#### Sector growth summary
```sql
SELECT cs.Sector_Name, SUM(ci.Growth_Percent) AS Total_Growth
FROM Company_Information ci
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
GROUP BY cs.Sector_Name
ORDER BY Total_Growth DESC;
```

#### Sector performance without crude impact
```sql
SELECT cs.Sector_Name, cp.Performance_Grade
FROM Company_Sector cs
JOIN Company_Performance cp ON cs.Performance_Id = cp.Performance_id
WHERE cs.Effect_of_CrudePrice = 'NO';
```

#### Companies in low-inflation countries with positive growth
```sql
SELECT ci.Company_Name, cs.Sector_Name
FROM Company_Information ci
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
JOIN Company_HeadQuarter ch ON ci.Company_HQ_Id = ch.Nation_id
WHERE ch.Inflation < (SELECT AVG(Inflation) FROM Company_HeadQuarter)
  AND ci.Growth_Percent >= 0;
```

#### Sector inflation comparison
```sql
SELECT cs.Sector_Name,
       CASE 
           WHEN SUM(CASE WHEN ch.Inflation > 3 THEN 1 ELSE 0 END) > SUM(CASE WHEN ch.Inflation <= 3 THEN 1 ELSE 0 END)
           THEN 'Greater inflation'
           ELSE 'Lesser inflation'
       END AS Inflation_Comparison
FROM Company_HeadQuarter ch
JOIN Company_Information ci ON ch.Nation_id = ci.Company_HQ_Id
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
GROUP BY cs.Sector_Name
ORDER BY cs.Sector_Name;
```

#### High-growth IT & Defence companies
```sql
SELECT ci.Company_Name, cs.Sector_Name, ci.Growth_percent, cp.Performance_Grade, cs.Effect_of_covid, cs.Effect_of_Crudeprice
FROM Company_Information ci
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
JOIN Company_Performance cp ON cs.Performance_Id = cp.Performance_id
WHERE cs.Sector_Name IN ('Defence', 'IT') AND ci.Estimated_Growth > 5
ORDER BY cs.Sector_Name ASC, ci.Estimated_Growth DESC;
```

## Findings

- **Growth Risk**: Several companies are categorized as high risk due to negative growth.
- **Sector Insights**: IT and Defence sectors show resilient companies with high estimated growth.
- **Inflation Trends**: Sectors are affected differently by inflation; some thrive in low-inflation environments.
- **Performance Ratings**: Sector-wide performance linked with crude oil and COVID impact gives meaningful insights.

## Reports

- **Risk Classification Report**
- **Recession-Free Sector Summary**
- **Top Sector by Growth**
- **Inflation Impact Analysis**
- **Company Highlights in IT & Defence**

## Conclusion

This SQL project simulates real-world corporate analysis using a relational database and advanced SQL techniques. It classifies risk levels, measures growth, correlates sector attributes with macroeconomic factors, and highlights top-performing companies.

## Author

**Golla Bhargava Teja**  
This project is part of my SQL learning and business analytics journey.

**Project Title**: Company Performance & Risk Analysis  
**Level**: Beginner to Intermediate  
**Database**: `ironman`

This project simulates a real-world scenario where data analysts work with interrelated company data such as performance results, sector effects, workforce demographics, and macroeconomic indicators. It involves creating a relational database, writing complex SQL queries, and deriving insights that support business intelligence and economic strategy.

---

##  Objectives

1. **Database Setup**: Create and populate normalized tables to store company information, sector attributes, workforce stats, performance grading, and headquarters data.
2. **Data Analysis**: Use advanced SQL queries (JOINs, CTEs, aggregates, conditional logic) to analyze company growth and risk.
3. **Business Insight Generation**: Identify high-growth sectors, low-risk companies, and evaluate the effects of external economic factors.

---

##  Project Structure

### 1. Database Schema

The project creates the following tables:
- `Company_Information`: Core company metrics including quarterly results and growth.
- `Company_Sector`: Sector names, performance IDs, and economic impact indicators.
- `Company_Performance`: Performance ratings.
- `Company_Workforce`: Workforce size and gender ratios.
- `Company_HeadQuarter`: Headquarter countries and inflation rates.

### 2. Key SQL Operations

- Counting companies by sector with negative growth.
- Aggregating company counts by headquarter country.
- Identifying companies with positive growth in "Very Large" size.
- Assigning risk categories based on growth percent.
- Ranking sectors by estimated growth.
- Tagging sectors by inflation impact.
- Filtering IT/Defence companies by estimated growth.
- Correlating performance with COVID/crude oil effects.

---

##  Sample Analysis Queries

###  Identify high-risk vs low-risk companies
```sql
SELECT Company_Name,
  CASE
    WHEN Growth_Percent < 0 THEN 'High Risk'
    ELSE 'Low Risk'
  END AS Risk_Category
FROM Company_Information;
```

 ### Sectors with most recession-free companies
```sql
SELECT Sector, COUNT(*) AS Recession_Free_Companies
FROM Company_Information
WHERE Growth_Percent >= 0
GROUP BY Sector;
```
### Companies with Q4 earnings below average of all quarters
```sql
SELECT Company_Name, Sector,
       ((Q1_Result + Q2_Result + Q3_Result + Q4_Result) / 4) AS Average
FROM Company_Information
WHERE ((Q1_Result + Q2_Result + Q3_Result + Q4_Result) / 4) > Q4_Result;
```
### Sector-wise highest estimated growth
```sql
SELECT Sector, MAX(Estimated_Growth) AS Highest_Estimated_Growth
FROM Company_Information
GROUP BY Sector
ORDER BY Highest_Estimated_Growth DESC;
```
### Sectors with performance and no crude price effect
```sql
SELECT cs.Sector_Name, cp.Performance_Grade
FROM Company_Sector cs
JOIN Company_Performance cp ON cs.Performance_Id = cp.Performance_id
WHERE cs.Effect_of_Crudeprice = 'NO';
```
### Companies outperforming in countries with low inflation
```sql
SELECT ci.Company_Name, cs.Sector_Name
FROM Company_Information ci
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
JOIN Company_HeadQuarter ch ON ci.Company_HQ_Id = ch.Nation_id
WHERE ch.Inflation < (
  SELECT AVG(Inflation) FROM Company_HeadQuarter
) AND ci.Growth_Percent >= 0;
```
### Inflation impact comparison by sector
```sql
SELECT cs.Sector_Name,
       CASE 
           WHEN SUM(CASE WHEN ch.Inflation > 3 THEN 1 ELSE 0 END) >
                SUM(CASE WHEN ch.Inflation <= 3 THEN 1 ELSE 0 END)
           THEN 'Greater inflation'
           ELSE 'Lesser inflation'
       END AS Inflation_Comparison
FROM Company_Information ci
JOIN Company_HeadQuarter ch ON ci.Company_HQ_Id = ch.Nation_id
JOIN Company_Sector cs ON ci.Sector = cs.Sector_id
GROUP BY cs.Sector_Name
ORDER BY cs.Sector_Name;
```
## Findings
- **Growth Insight** Several companies across sectors showed negative growth, often linked to economic factors.

- **Performance Tagging**: Risk classification helps highlight struggling companies.

- **Inflation Impact**: Companies in low-inflation countries generally outperformed others.

- **Sector Evaluation**: IT and Defence sectors saw strong growth among select companies, unaffected by oil price volatility.

##  Reports

- **Risk Classification Report**: Categorizes companies into high-risk or low-risk based on negative or positive growth percentages.
- **Recession-Free Sector Report**: Identifies sectors that remained resilient with companies showing positive growth during downturns.
- **Sector Performance Summary**: Shows total and average growth across sectors along with external impact (COVID, Crude Prices).
- **Inflation Impact Evaluation**: Analyzes how sector performance varies between high and low inflation countries.
- **High-Performing Companies Report**: Highlights companies with strong estimated growth, especially in IT and Defence sectors.

---

##  Conclusion

This SQL project demonstrates how to build and query a multi-table relational database to derive meaningful business insights. By analyzing company growth, sector impacts, workforce trends, and macroeconomic indicators like inflation and crude oil effects, we:

- Classified companies by growth risk.
- Evaluated which sectors and countries are more resilient during economic stress.
- Uncovered top-performing companies and sectors.
- Assessed the impact of external factors like COVID-19 and inflation on different industries.

This project is ideal for learners who want to practice real-world SQL skills while exploring business and economic datasets.

---## How to Use

1. **Clone the Repository**: Download or clone this repo.
2. **Set Up the Database**: Execute the provided SQL scripts in your local MySQL or PostgreSQL environment.
3. **Run the Queries**: Use the analysis queries to generate insights and reports.
4. **Explore and Modify**: Build on top of this foundation to explore more business use cases
   
##  Author - *Golla Bhargava Teja*




