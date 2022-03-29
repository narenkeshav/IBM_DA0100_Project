/*
Naren Keshav
--- Attempts to clean data & understand data
*/

-- Display whole TABLE
SELECT * FROM sales_numbers;
------------------------------------

-- Checking for any null values
-- Checking columns having null value
SELECT * FROM sales_numbers
WHERE coalesce (Month_Year_of_Purchase, Product_Category, Units_Sold, Discount, Targeted_Campaign, Customer_Ratings, Defects_Reported) is NULL;

-- Checking for any row to have null value
SELECT * FROM sales_numbers
WHERE Month_Year_of_Purchase is NULL or Product_Category is NULL or Units_Sold is NULL or Discount is NULL or Targeted_Campaign is NULL or Customer_Ratings is null or Defects_Reported is NULL;

/* INFERENCE
No null values. */
------------------------------------

------------- DISCOUNT property relation -----------------
--- Max & min value of DISCOUNT COLUMN
SELECT Discount, COUNT(DISCOUNT) FROM sales_numbers
GROUP BY Discount
ORDER BY Discount DESC;
/*INFERENCE
- The range is between 0, 0.1 ... 0.3
- The most common discount is 0.2
- Mean of discount (excluding zero) 18% (0.3 + 0.25 + 1(0.2*5) + 0.15 + 0.1)/10 = 1.8 
- 
*/



--- Discount across Product_Category
SELECT Month_Year_of_Purchase, Discount, Product_Category FROM sales_numbers
ORDER BY Discount DESC;
/* INFERENCE
- Discounts above and equal to 0.2 happened only during festival season of Q4 of 2018 & 2019
- Discounts were made only to (3) primary product categories
- 
*/

--- Find the range for Customer_Ratings 
SELECT COUNT(Customer_Ratings), Customer_Ratings FROM sales_numbers
GROUP BY (Customer_Ratings);
/* INFERENCE
- range is between 7.1 ... 9.6 ADD
- mean is 
*/

SELECT AVG(Customer_Ratings), COUNT(Customer_Ratings) FROM sales_numbers
GROUP BY (Customer_Ratings);
/* INFERENCE
- 
*/

SELECT CAST(Customer_Ratings as INT) as round_value, COUNT(CAST(Customer_Ratings as INT)) as ratings FROM sales_numbers
GROUP BY round_value;
/* INFERENCE
- Ratings have been above seven with highs in 8 and 9. 
- Irrespective of the product_category, people are happy about it. 
*/

--- Find the range for Defects_Reported
SELECT Customer_Ratings, Product_Category, Defects_Reported FROM sales_numbers
ORDER BY Customer_Ratings DESC, Defects_Reported DESC;

--- Display all distinct product categories
SELECT DISTINCT(Product_Category) FROM sales_numbers;
/* INFERENCE
Total a 4 categories.
*/
------------------------------------

--- Display product categories with count on their occurences
SELECT Product_Category, COUNT(Product_Category) as 'Product Total' FROM sales_numbers
GROUP BY Product_Category
ORDER BY COUNT(Product_Category) DESC;
/* INFERENCE
The primary categories are 3. 
1. Fitness Gadgets
2. Travel Accessories
3. Designer Clothes
*/


SELECT Month_Year_of_Purchase,COUNT(Month_Year_of_Purchase) FROM sales_numbers
GROUP BY Month_Year_of_Purchase
ORDER BY COUNT(Month_Year_of_Purchase)


----------- DUPLICATES --------
-- Find duplicates
/* Criteria to find duplicate DATA

There is no UNIQUE VALUES
Duplicate that table & delete the duplicate VALUES



1. Need to find them 
2. Have to display them
3. Remove those duplicate record
*/


--- Shows the row that has duplicate. 
SELECT *, COUNT(*) as TOTAL FROM sales_numbers a
GROUP BY a.Month_Year_of_Purchase, a.Product_Category, a.Units_Sold, Discount, a.Targeted_Campaign, a.Customer_Ratings, a.Defects_Reported
HAVING Total > 1;

--- 
SELECT a.*, COUNT(*) FROM sales_numbers a
JOIN sales_numbers b on 
    a.Month_Year_of_Purchase = b.Month_Year_of_Purchase AND 
    a.Product_Category = b.Product_Category AND
    a.Discount = b.Discount AND
    a.Units_Sold = b.Units_Sold AND
    a.Targeted_Campaign = b.Targeted_Campaign AND
    a.Customer_Ratings = b.Customer_Ratings AND
    a.Defects_Reported = b.Defects_Reported 

-- ISSUE is it a self-join and compares values within two tables & hence you've four duplicate rows. Does not work




-- OBJECTIVE -> 
-- Display the rows with all duplicates when the count is greater 1. 
-- 

SELECT a.*, COUNT(a.*) as aTOTAL FROM sales_numbers a, sales_numbers b
WHERE a.Month_Year_of_Purchase = b.Month_Year_of_Purchase AND 
    a.Product_Category = b.Product_Category AND
    a.Discount = b.Discount AND
    a.Units_Sold = b.Units_Sold AND
    a.Targeted_Campaign = b.Targeted_Campaign AND
    a.Customer_Ratings = b.Customer_Ratings AND
    a.Defects_Reported = b.Defects_Reported
GROUP BY aTOTAL
HAVING aTOTAL > 1;

-- Need to identify the exact row 
-- (probably) display the exact rows ADD
-- delete the rows

SELECT * FROM sales_numbers a
JOIN
( 
    SELECT *, COUNT(*) Total FROM sales_numbers b
    GROUP BY b.Month_Year_of_Purchase, b.Product_Category, b.Units_Sold, b.Discount, b.Targeted_Campaign, b.Customer_Ratings, b.Defects_Reported
    HAVING Total > 1
) c
ON
(
    a.Month_Year_of_Purchase = c.Month_Year_of_Purchase AND 
    a.Product_Category = c.Product_Category AND
    a.Discount = c.Discount AND
    a.Units_Sold = c.Units_Sold AND
    a.Targeted_Campaign = c.Targeted_Campaign AND
    a.Customer_Ratings = c.Customer_Ratings AND
    a.Defects_Reported = c.Defects_Reported
);
-- When I run the above, Count is being display from the JOIN clause. Why is it so? Shouldn't display columns from the first select ('a' clause)

-- TO Duplicate the table. 
CREATE TABLE sales_numbers_cleaned AS SELECT * FROM sales_numbers;

