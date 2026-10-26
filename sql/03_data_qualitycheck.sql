use customer_churn

-- 1. Check total number of records
SELECT COUNT(*) AS total_rows
FROM customers;

-- 2. Check duplicate customer IDs
SELECT
    customerID,
    COUNT(*) AS id_count
FROM customers
GROUP BY customerID
HAVING COUNT(*) > 1;

-- 3. Check NULL values in important columns
SELECT
    SUM(customerID IS NULL) AS missing_customer_id,
    SUM(tenure IS NULL) AS missing_tenure,
    SUM(MonthlyCharges IS NULL) AS missing_monthly_charges,
    SUM(TotalCharges IS NULL) AS missing_total_charges,
    SUM(Churn IS NULL) AS missing_churn
FROM customers;

-- Check tenure range
SELECT
    MIN(tenure) AS minimum_tenure,
    MAX(tenure) AS maximum_tenure
FROM customers;

-- Check monthly charge range
SELECT
    MIN(MonthlyCharges) AS minimum_monthly_charge,
    MAX(MonthlyCharges) AS maximum_monthly_charge
FROM customers;

-- check total charge range
SELECT
    MIN(TotalCharges) as minimum_totalcharge,
    MAX(TotalCharges) as maximum_totalcharge
FROM customers;