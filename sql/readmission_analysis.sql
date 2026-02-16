-- Hospital Readmissions Analysis
-- Author: Snehavardhan Reddy Avuthu

-- 1. Overall Readmission Rate
SELECT 
    readmitted,
    COUNT(*) AS patient_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM diabetic_data
GROUP BY readmitted;

-- 2. Readmission Rate by Age Group
SELECT 
    age,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmitted_30_days,
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM diabetic_data
GROUP BY age
ORDER BY readmission_rate DESC;

-- 3. Readmission by Length of Stay
SELECT 
    CASE 
        WHEN time_in_hospital <= 3 THEN '1-3 days'
        WHEN time_in_hospital <= 7 THEN '4-7 days'
        ELSE '7+ days'
    END AS stay_category,
    COUNT(*) AS total_patients,
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM diabetic_data
GROUP BY stay_category;

-- 4. Readmission by Prior Inpatient Visits
SELECT 
    CASE 
        WHEN number_inpatient = 0 THEN '0 prior visits'
        WHEN number_inpatient BETWEEN 1 AND 2 THEN '1-2 prior visits'
        ELSE '3+ prior visits'
    END AS prior_visits,
    COUNT(*) AS total_patients,
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM diabetic_data
GROUP BY prior_visits;

-- 5. Readmission by Admission Type
SELECT 
    admission_type_id,
    COUNT(*) AS total_patients,
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM diabetic_data
GROUP BY admission_type_id
ORDER BY readmission_rate DESC;

-- 6. Top Medical Specialties by Readmission Rate
SELECT 
    medical_specialty,
    COUNT(*) AS total_patients,
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM diabetic_data
WHERE medical_specialty != '?'
GROUP BY medical_specialty
HAVING COUNT(*) > 500
ORDER BY readmission_rate DESC
LIMIT 10;

-- 7. Impact of Insulin on Readmission
SELECT 
    insulin,
    COUNT(*) AS total_patients,
    ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM diabetic_data
GROUP BY insulin;

-- 8. High-Risk Patient Profile
SELECT 
    age,
    ROUND(AVG(time_in_hospital), 1) AS avg_stay,
    ROUND(AVG(num_medications), 1) AS avg_medications,
    ROUND(AVG(number_inpatient), 1) AS avg_prior_visits,
    COUNT(*) AS patient_count
FROM diabetic_data
WHERE readmitted = '<30'
GROUP BY age
ORDER BY patient_count DESC;
