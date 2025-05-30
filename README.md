# Company Performance and Risk Analysis SQL Project

##  Project Overview

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




