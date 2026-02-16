# Hospital Readmissions Analysis

## Overview
This project analyzes 100,000+ hospital patient records to identify patterns and risk factors associated with 30-day readmissions. The goal is to provide actionable insights that can help healthcare organizations reduce readmission rates and improve patient outcomes.

## Business Questions Answered
1. What is the overall 30-day readmission rate?
2. Which diagnosis categories have the highest readmission rates?
3. Does length of stay impact readmission likelihood?
4. Are certain age groups more likely to be readmitted?
5. Do the number of prior inpatient visits predict readmission?
6. Which medications are associated with lower readmission rates?
7. Does the number of lab procedures affect readmission?
8. What is the readmission rate by admission type (Emergency vs. Elective)?
9. Are diabetic patients on insulin more or less likely to be readmitted?
10. Which medical specialties have the highest readmission rates?

## Dataset
- **Source:** [UCI Machine Learning Repository / Kaggle](https://www.kaggle.com/datasets/brandao/diabetes)
- **Records:** 101,766 patient encounters
- **Features:** 50 attributes including demographics, diagnoses, medications, and readmission status
- **Time Period:** 1999-2008 across 130 US hospitals

## Tools Used
- **SQL** (PostgreSQL/MySQL) — Data extraction and analysis
- **Python** (Pandas, Matplotlib, Seaborn) — EDA and visualization
- **Jupyter Notebook** — Documentation and analysis

## Key Findings
1. Overall 30-day readmission rate: **11.2%**
2. Patients with 5+ prior inpatient visits are **2.3x more likely** to be readmitted
3. Emergency admissions have **35% higher** readmission rates than elective
4. Longer hospital stays (7+ days) correlate with **18% higher** readmission risk
5. Patients aged 70-80 have the highest readmission rates

## Files
- `sql/readmission_analysis.sql` — All SQL queries used
- `notebooks/hospital_readmissions_eda.ipynb` — Python analysis notebook

## Author
**Snehavardhan Reddy Avuthu**  
Senior Data Analyst | [LinkedIn](https://linkedin.com/in/snehavardhan-reddy-avuthu)
