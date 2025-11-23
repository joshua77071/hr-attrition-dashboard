-- ===========================================
-- HR ATTRITION ANALYSIS QUERIES
-- Dataset: hr_attrition_5000.csv
-- ===========================================

-- 1️⃣ Total Employees
SELECT COUNT(EmployeeID) AS TotalEmployees
FROM hr_attrition;

-- 2️⃣ Total Attrition
SELECT SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS TotalAttrition
FROM hr_attrition;

-- 3️⃣ Attrition Rate
SELECT 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS AttritionRate
FROM hr_attrition;

-- 4️⃣ Gender-wise Attrition
SELECT Gender,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_attrition
GROUP BY Gender;

-- 5️⃣ Department-wise Attrition
SELECT Department,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_attrition
GROUP BY Department
ORDER BY AttritionCount DESC;

-- 6️⃣ Attrition by Job Role
SELECT JobRole,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_attrition
GROUP BY JobRole
ORDER BY AttritionCount DESC;

-- 7️⃣ Attrition by Age Groups
SELECT 
    CASE 
        WHEN Age < 25 THEN '20-24'
        WHEN Age BETWEEN 25 AND 29 THEN '25-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_attrition
GROUP BY AgeGroup
ORDER BY AttritionCount DESC;

-- 8️⃣ Salary Range vs Attrition
SELECT 
    CASE
        WHEN Salary < 30000 THEN '<30K'
        WHEN Salary < 50000 THEN '30K-50K'
        WHEN Salary < 80000 THEN '50K-80K'
        WHEN Salary < 120000 THEN '80K-120K'
        ELSE '120K+'
    END AS SalaryRange,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_attrition
GROUP BY SalaryRange
ORDER BY AttritionCount DESC;

-- 9️⃣ Performance Rating vs Attrition
SELECT PerformanceRating,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_attrition
GROUP BY PerformanceRating
ORDER BY PerformanceRating;

-- 🔟 Tenure vs Attrition (Years At Company)
SELECT YearsAtCompany,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM hr_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;
