/*
Naren Keshav
--- Attempts to clean data
*/
-- Display whole TABLE
SELECT * FROM sales_numbers;

-- Checking for any null values
SELECT * FROM sales_numbers
WHERE coalesce (Month_Year_of_Purchase, Product_Category, Units_Sold, Discount, Targeted_Campaign, Customer_Ratings, Defects_Reported) is NULL;

/* INFERENCE
No null values. */
------------------------------------


--- Display all distinct product categories


--- Figure the max & min value of DISCOUNT COLUMN


--- Find the range for Customer_Ratings ADD

--- Find the range for Defects_Reported
SELECT DISTINCT(Product_Category) FROM sales_numbers;
/* INFERENCE
Total a 4 categories.
*/
------------------------------------

--- Display product categories with count on their occurences
SELECT Product_Category, COUNT(Product_Category) FROM sales_numbers
GROUP BY Product_Category
ORDER BY COUNT(Product_Category) DESC
/* INFERENCE
The primary categories are 3. 
1. Fitness Gadgets
2. Travel Accessories
3. Designer Clothes
*/


SELECT Month_Year_of_Purchase,COUNT(Month_Year_of_Purchase) FROM sales_numbers
GROUP BY Month_Year_of_Purchase
ORDER BY COUNT(Month_Year_of_Purchase)


--- Find duplicates in Month_year