
ALTER TABLE Sales
DROP CONSTRAINT fk_sales_exchange;
--because I had to change datatype of order_date column which was referenced


ALTER TABLE Customers
ALTER COLUMN birthday TYPE TEXT;

ALTER TABLE Stores
ALTER COLUMN open_date TYPE TEXT;

ALTER TABLE Exchange_Rates
ALTER COLUMN date TYPE TEXT;

ALTER TABLE Sales
ALTER COLUMN order_date TYPE TEXT;

ALTER TABLE Sales
ALTER COLUMN delivery_date TYPE TEXT;



ALTER TABLE Products ALTER COLUMN unit_cost_usd TYPE TEXT;
ALTER TABLE Products ALTER COLUMN unit_price_usd TYPE TEXT;



ALTER TABLE Customers 
ALTER COLUMN state_code TYPE VARCHAR(100);
