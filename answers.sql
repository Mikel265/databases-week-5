-- answers.sql
-- Assignment: Advanced SQL Queries and Aggregations

-- Question 1
-- Show the total payment amount for each payment date (latest 5 dates only)
SELECT TOP 5 paymentDate, total_amount
FROM (
    SELECT paymentDate, SUM(amount) AS total_amount
    FROM payments
    GROUP BY paymentDate
) AS daily_totals
ORDER BY paymentDate DESC;

-- Question 2
-- Find the average credit limit of each active customer (only those with orders)
SELECT c.customerName, c.country, AVG(c.creditLimit) AS average_credit_limit
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerName, c.country;

-- Question 3
-- Find the total price of products ordered
-- (using JOIN to also show product name for clarity)
SELECT od.productCode, p.productName, od.quantityOrdered, 
       (od.quantityOrdered * od.priceEach) AS total_price
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
GROUP BY od.productCode, p.productName, od.quantityOrdered, od.priceEach;

-- Question 4
-- Find the highest payment amount for each check number
SELECT checkNumber, MAX(amount) AS highest_amount
FROM payments
GROUP BY checkNumber;
