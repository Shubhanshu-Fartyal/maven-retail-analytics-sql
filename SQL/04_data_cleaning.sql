UPDATE Products
SET
    unit_cost_usd = TRIM(REPLACE(unit_cost_usd, ',', '')),
    unit_price_usd = TRIM(REPLACE(unit_price_usd, ',', ''));



ALTER TABLE Products
ALTER COLUMN unit_cost_usd TYPE NUMERIC(10,2)
USING unit_cost_usd::NUMERIC;

ALTER TABLE Products
ALTER COLUMN unit_price_usd TYPE NUMERIC(10,2)
USING unit_price_usd::NUMERIC;



ALTER TABLE Customers
ALTER COLUMN birthday TYPE DATE
USING TO_DATE(birthday, 'MM/DD/YYYY');

ALTER TABLE Stores
ALTER COLUMN open_date TYPE DATE
USING TO_DATE(open_date, 'MM/DD/YYYY');

ALTER TABLE Exchange_Rates
ALTER COLUMN date TYPE DATE
USING TO_DATE(date, 'MM/DD/YYYY');

ALTER TABLE Sales
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date, 'MM/DD/YYYY');

ALTER TABLE sales
ALTER COLUMN delivery_date TYPE DATE
USING CASE
    WHEN delivery_date IS NULL OR TRIM(delivery_date) = '' THEN NULL
    ELSE TO_DATE(delivery_date, 'MM/DD/YYYY')
END;



ALTER TABLE Sales
ADD CONSTRAINT fk_sales_exchange_rate
FOREIGN KEY (order_date, currency_code)
REFERENCES Exchange_Rates(date, currency);
