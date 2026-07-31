/*
============================================================
SECTION A : SALES OVERVIEW
============================================================
*/

------------------------------------------------------------
-- BUSINESS PROBLEM 1
-- Total Revenue
------------------------------------------------------------

SELECT
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Products AS p
    ON s.product_key = p.product_key;

------------------------------------------------------------
-- BUSINESS PROBLEM 2
-- Revenue by Year
------------------------------------------------------------

SELECT
    EXTRACT(YEAR FROM s.order_date) AS order_year,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY order_year
ORDER BY order_year;

------------------------------------------------------------
-- BUSINESS PROBLEM 3
-- Revenue by Product Category
------------------------------------------------------------

SELECT
    p.category,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;


/*
============================================================
SECTION B : PRODUCT ANALYSIS
============================================================
*/

------------------------------------------------------------
-- BUSINESS PROBLEM 4
-- Top 10 Products by Revenue
------------------------------------------------------------

SELECT
    p.product_name,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

------------------------------------------------------------
-- BUSINESS PROBLEM 5
-- Top 10 Products by Quantity Sold
------------------------------------------------------------

SELECT
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM Sales AS s
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;

------------------------------------------------------------
-- BUSINESS PROBLEM 6
-- Brand-wise Revenue
------------------------------------------------------------

SELECT
    p.brand,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY p.brand
ORDER BY total_revenue DESC;


/*
============================================================
SECTION C : CUSTOMER ANALYSIS
============================================================
*/

------------------------------------------------------------
-- BUSINESS PROBLEM 7
-- Top 10 Customers by Spending
------------------------------------------------------------

SELECT
    c.customer_key,
    c.name,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_spent
FROM Sales AS s
INNER JOIN Customers AS c
    ON s.customer_key = c.customer_key
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY
    c.customer_key,
    c.name
ORDER BY total_spent DESC
LIMIT 10;

------------------------------------------------------------
-- BUSINESS PROBLEM 8
-- Revenue by Country
------------------------------------------------------------

SELECT
    c.country,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Customers AS c
    ON s.customer_key = c.customer_key
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY c.country
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- BUSINESS PROBLEM 9
-- Customer Distribution by Continent
------------------------------------------------------------

SELECT
    continent,
    COUNT(customer_key) AS total_customers
FROM Customers
GROUP BY continent
ORDER BY total_customers DESC;


/*
============================================================
SECTION D : STORE ANALYSIS
============================================================
*/

------------------------------------------------------------
-- BUSINESS PROBLEM 10
-- Top Performing Stores
------------------------------------------------------------

SELECT
    st.store_key,
    st.country,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Stores AS st
    ON s.store_key = st.store_key
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY
    st.store_key,
    st.country
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- BUSINESS PROBLEM 11
-- Online vs Physical Store Performance
------------------------------------------------------------

SELECT
    CASE
        WHEN st.country = 'Online' THEN 'Online'
        ELSE 'Physical'
    END AS store_type,
    ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue
FROM Sales AS s
INNER JOIN Stores AS st
    ON s.store_key = st.store_key
INNER JOIN Products AS p
    ON s.product_key = p.product_key
GROUP BY store_type
ORDER BY total_revenue DESC;


/*
============================================================
SECTION E : ADVANCED SQL
============================================================
*/

------------------------------------------------------------
-- BUSINESS PROBLEM 12
-- Top 5 Products within Each Category
------------------------------------------------------------

WITH ranked_products AS
(
    SELECT
        p.category,
        p.product_name,
        ROUND(SUM(s.quantity * p.unit_price_usd), 2) AS total_revenue,
        ROW_NUMBER() OVER
        (
            PARTITION BY p.category
            ORDER BY SUM(s.quantity * p.unit_price_usd) DESC
        ) AS product_rank
    FROM Sales AS s
    INNER JOIN Products AS p
        ON s.product_key = p.product_key
    GROUP BY
        p.category,
        p.product_name
)
SELECT
    category,
    product_name,
    total_revenue,
    product_rank
FROM ranked_products
WHERE product_rank <= 5
ORDER BY
    category,
    product_rank;
