# Company Performance & Risk Analysis SQL Project

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

  
