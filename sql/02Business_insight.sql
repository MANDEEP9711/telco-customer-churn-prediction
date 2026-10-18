USE customer_churn
--create new churn table for reuse
with churn_table as(
    select churn,count(*) as count_churn
    FROM customers
    group by Churn
)
select * from churn_table

--does senior citizen diff churn rate
SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY SeniorCitizen
ORDER BY SeniorCitizen;

--does gender have diff churn rate
SELECT
   gender,
   count(*) as total_customers,
   SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY gender;

--does internet service relate to churn
SELECT InternetService,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY InternetService
ORDER BY churn_rate DESC;

--does high monthycharge relate with churn

SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM customers
GROUP BY Churn;

--customers pay more then average

SELECT
    customerID,
    MonthlyCharges,
    Contract,
    Churn
FROM customers
WHERE MonthlyCharges > (
    SELECT AVG(MonthlyCharges)
    FROM customers
)
ORDER BY MonthlyCharges DESC

--churn customer based on payment method
SELECT
    PaymentMethod,
    COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;
