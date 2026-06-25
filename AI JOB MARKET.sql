SELECT
    job_title,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY job_title
ORDER BY avg_salary DESC;

SELECT
    country,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY country
ORDER BY avg_salary DESC;

SELECT
    experience_level,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY experience_level
ORDER BY avg_salary DESC;

SELECT
    education_level,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY education_level
ORDER BY avg_salary DESC;

SELECT
    company_size,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY company_size
ORDER BY avg_salary DESC;

SELECT
    remote_type,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY remote_type
ORDER BY avg_salary DESC;

SELECT
    company_industry,
    COUNT(*) AS total_jobs
FROM ai_jobs
GROUP BY company_industry
ORDER BY total_jobs DESC;

SELECT
    country,
    SUM(job_openings) AS total_openings
FROM ai_jobs
GROUP BY country
ORDER BY total_openings DESC;

SELECT
    hiring_urgency,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY hiring_urgency
ORDER BY avg_salary DESC;

SELECT
    job_title,
    SUM(job_openings) AS total_openings
FROM ai_jobs
GROUP BY job_title
ORDER BY total_openings DESC;

SELECT
    job_title,
    COUNT(*) AS python_jobs
FROM ai_jobs
WHERE skills_python = 1
GROUP BY job_title
ORDER BY python_jobs DESC;

SELECT
    job_title,
    COUNT(*) AS ml_jobs
FROM ai_jobs
WHERE skills_ml = 1
GROUP BY job_title
ORDER BY ml_jobs DESC;

SELECT
    company_industry,
    COUNT(*) AS cloud_jobs
FROM ai_jobs
WHERE skills_cloud = 1
GROUP BY company_industry
ORDER BY cloud_jobs DESC;

SELECT
    job_posting_year,
    COUNT(*) AS total_postings
FROM ai_jobs
GROUP BY job_posting_year
ORDER BY total_postings DESC;

SELECT
    job_posting_month,
    COUNT(*) AS total_jobs
FROM ai_jobs
GROUP BY job_posting_month
ORDER BY total_jobs DESC;

SELECT
    CASE
        WHEN salary < 90000 THEN 'Low'
        WHEN salary BETWEEN 90000 AND 130000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category,
    COUNT(*) AS total_jobs
FROM ai_jobs
GROUP BY salary_category;

SELECT
    job_title,
    salary
FROM ai_jobs
WHERE salary >
(
    SELECT AVG(salary)
    FROM ai_jobs
);

WITH role_salary AS
(
    SELECT
        country,
        job_title,
        AVG(salary) AS avg_salary
    FROM ai_jobs
    GROUP BY country, job_title
)

SELECT *
FROM role_salary
ORDER BY country, avg_salary DESC;

SELECT
    job_title,
    ROUND(AVG(salary),2) AS avg_salary,
    RANK() OVER
    (
        ORDER BY AVG(salary) DESC
    ) AS salary_rank
FROM ai_jobs
GROUP BY job_title;

SELECT
    skills_python,
    skills_sql,
    skills_ml,
    skills_deep_learning,
    skills_cloud,
    ROUND(AVG(salary),2) AS avg_salary
FROM ai_jobs
GROUP BY
    skills_python,
    skills_sql,
    skills_ml,
    skills_deep_learning,
    skills_cloud
ORDER BY avg_salary DESC;