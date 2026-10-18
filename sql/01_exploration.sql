
SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS customer_churn;
USE customer_churn;
CREATE TABLE raw_data(
    customerID VARCHAR(30),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(30),
    Churn VARCHAR(10)
);

--Number of rows
SELECT count(*) FROM customers

--view first 10 row
select * FROM customers
LIMIT 10;

/*count distinct values */
select SeniorCitizen, count(*) as total
from customers
GROUP BY SeniorCitizen

--check customer churn count
select churn, count(*) as count
from customers
GROUP BY churn

--check duplicate customer_id
select customerID
from customers
GROUP BY customerID
having count(*)>1

--highest churn contract type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;

--creates four tenure groups and calculates the churn rate within each group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    SUM(
        CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END
        ) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY tenure_group
ORDER BY MIN(tenure);

 --check churn rate
 select ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    )
    from
    customers
--Business interpretation: Approximately 27 out of every 100 customers left the company