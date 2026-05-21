SELECT * FROM customer_sales;


SELECT * FROM customer_sales
WHERE "ReferralSource" = 'Instagram'
ORDER BY  "Quantity" 
LIMIT 25;


UPDATE customer_sales
SET "PaymentMethod"='Debit Card'
WHERE "CustomerID" = 'C75739';

SELECT * FROM customer_sales WHERE "CustomerID" = 'C75739';

-- Filtering example

SELECT * FROM  customer_sales WHERE "ReferralSource"='Instagram';

-- Total revenue by product

SELECT "Product", SUM("TotalPrice")  AS "Revenue" FROM customer_sales
GROUP BY "Product"
ORDER BY "Revenue" DESC;

-- calculate Total Orders per payment method

SELECT "PaymentMethod", COUNT(*) AS total_orders
FROM customer_sales
WHERE "TotalPrice" = (SELECT MAX('TotalPrice') FROM customer_sales);
group by "PaymentMethod";


 -- find Highest order in whole dataset

SELECT * FROM customer_sales
WHERE "TotalPrice" = (SELECT MAX("TotalPrice") FROM customer_sales);

-- find Highest order per product

SELECT  * FROM customer_sales  cs
WHERE "TotalPrice" = ( SELECT MAX("TotalPrice") FROM customer_sales
				WHERE "Product" = cs."Product");


-- Customers who spent more than average



SELECT  * FROM customer_sales 
WHERE "TotalPrice" > ( SELECT AVG("TotalPrice") FROM customer_sales );


-- Orders from customers who bought Laptop

SELECT "CustomerID", "Product" FROM customer_sales
WHERE "Product" ='Laptop';

SELECT *
FROM customer_sales
WHERE "CustomerID" IN (
    SELECT "CustomerID"
    FROM customer_sales
    WHERE "Product" = 'Laptop'
);


-- Products with revenue above average


SELECT * FROM  customer_sales
GROUP BY PRODUCT 
HAVING SUM("TotalPrice")
WHERE "TotalPrice" > ( SELECT  AVG("TotalPrice")  FROM customer_sales);