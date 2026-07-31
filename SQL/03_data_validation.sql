SELECT COUNT(*) AS total_customers FROM Customers;

SELECT COUNT(*) AS total_products FROM Products;

SELECT COUNT(*) AS total_stores FROM Stores;

SELECT COUNT(*) AS total_exchange_rates FROM Exchange_Rates;

SELECT COUNT(*) AS total_sales FROM Sales;



SELECT
    customer_key,
    COUNT(*) AS duplicate_count
FROM Customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM Products
GROUP BY product_key
HAVING COUNT(*) > 1;

SELECT
    store_key,
    COUNT(*) AS duplicate_count
FROM Stores
GROUP BY store_key
HAVING COUNT(*) > 1;

SELECT
    store_key,
    COUNT(*) AS duplicate_count
FROM Stores
GROUP BY store_key
HAVING COUNT(*) > 1;

SELECT
    order_number,
    line_item,
    COUNT(*) AS duplicate_count
FROM Sales
GROUP BY
    order_number,
    line_item
HAVING COUNT(*) > 1;

SELECT
    date,
    currency,
    COUNT(*) AS duplicate_count
FROM Exchange_Rates
GROUP BY
    date,
    currency
HAVING COUNT(*) > 1;



SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_key) AS customer_key,
    COUNT(gender) AS gender,
    COUNT(name) AS name,
    COUNT(city) AS city,
    COUNT(state_code) AS state_code,
    COUNT(state) AS state,
    COUNT(zip_code) AS zip_code,
    COUNT(country) AS country,
    COUNT(continent) AS continent,
    COUNT(birthday) AS birthday
FROM Customers;

SELECT
    COUNT(*) AS total_rows,
    COUNT(product_key) AS product_key,
    COUNT(product_name) AS product_name,
    COUNT(brand) AS brand,
    COUNT(color) AS color,
    COUNT(unit_cost_usd) AS unit_cost_usd,
    COUNT(unit_price_usd) AS unit_price_usd,
    COUNT(subcategory_key) AS subcategory_key,
    COUNT(subcategory) AS subcategory,
    COUNT(category_key) AS category_key,
    COUNT(category) AS category
FROM Products;

SELECT
    COUNT(*) AS total_rows,
    COUNT(store_key) AS store_key,
    COUNT(country) AS country,
    COUNT(state) AS state,
    COUNT(square_meters) AS square_meters,
    COUNT(open_date) AS open_date
FROM Stores;

SELECT
    COUNT(*) AS total_rows,
    COUNT(date) AS date,
    COUNT(currency) AS currency,
    COUNT(exchange_rate) AS exchange_rate
FROM Exchange_Rates;

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_number) AS order_number,
    COUNT(line_item) AS line_item,
    COUNT(order_date) AS order_date,
    COUNT(delivery_date) AS delivery_date,
    COUNT(customer_key) AS customer_key,
    COUNT(store_key) AS store_key,
    COUNT(product_key) AS product_key,
    COUNT(quantity) AS quantity,
    COUNT(currency_code) AS currency_code
FROM Sales;



SELECT DISTINCT country
FROM Customers
ORDER BY country;

SELECT DISTINCT country
FROM Stores
ORDER BY country;

SELECT DISTINCT gender
FROM Customers
ORDER BY gender;

SELECT DISTINCT currency_code
FROM Sales
ORDER BY currency_code;

SELECT DISTINCT currency
FROM Exchange_Rates
ORDER BY currency;

SELECT DISTINCT category
FROM Products
ORDER BY category;

SELECT DISTINCT brand
FROM Products
ORDER BY brand;

SELECT DISTINCT color
FROM Products
ORDER BY color;
