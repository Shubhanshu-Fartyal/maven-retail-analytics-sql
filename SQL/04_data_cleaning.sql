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
