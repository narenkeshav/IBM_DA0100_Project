/* queries to understand the data */

-- Module(s)
--@object  
SELECT * FROM sales_numbers;
--------------------------------------
--- Identifiable timeline 
SELECT Month_Year_of_Purchase, 

CASE (Month_Year_of_Purchase)

WHEN 'Jan-Mar 2018' THEN 'Q1-2018'
WHEN 'Apr-Jun 2018' THEN 'Q2-2018'
WHEN 'Jul-Sep 2018' THEN 'Q3-2018'
WHEN 'Oct-Dec 2018' THEN 'Q4-2018'

WHEN 'Jan-Mar 2019' THEN 'Q1-2019'
WHEN 'Apr-Jun 2019' THEN 'Q2-2019'
WHEN 'Jul-Sep 2019' THEN 'Q3-2019'
WHEN 'Oct-Dec 2019' THEN 'Q4-2019'

END Quater

FROM sales_numbers;
---------------------------------------
--- Order by targeted Campaign
SELECT CASE (Month_Year_of_Purchase)

WHEN 'Jan-Mar 2018' THEN 'Q1-2018'
WHEN 'Apr-Jun 2018' THEN 'Q2-2018'
WHEN 'Jul-Sep 2018' THEN 'Q3-2018'
WHEN 'Oct-Dec 2018' THEN 'Q4-2018'

WHEN 'Jan-Mar 2019' THEN 'Q1-2019'
WHEN 'Apr-Jun 2019' THEN 'Q2-2019'
WHEN 'Jul-Sep 2019' THEN 'Q3-2019'
WHEN 'Oct-Dec 2019' THEN 'Q4-2019'

END Quater, Targeted_Campaign FROM sales_numbers
ORDER BY Targeted_Campaign DESC;

---------------------------------------
--- Order by Customer Rating
SELECT CASE (Month_Year_of_Purchase)

WHEN 'Jan-Mar 2018' THEN 'Q1-2018'
WHEN 'Apr-Jun 2018' THEN 'Q2-2018'
WHEN 'Jul-Sep 2018' THEN 'Q3-2018'
WHEN 'Oct-Dec 2018' THEN 'Q4-2018'

WHEN 'Jan-Mar 2019' THEN 'Q1-2019'
WHEN 'Apr-Jun 2019' THEN 'Q2-2019'
WHEN 'Jul-Sep 2019' THEN 'Q3-2019'
WHEN 'Oct-Dec 2019' THEN 'Q4-2019'

END Quater, Customer_Ratings FROM sales_numbers
ORDER BY Customer_Ratings DESC;

---------------------------------------

--- Discount ordering
SELECT Month_Year_of_Purchase, Units_Sold, Product_Category
FROM sales_numbers
ORDER BY Product_Category, Units_Sold DESC

---------------------------------------

--- Defects Defects_Reported
SELECT Month_Year_of_Purchase, Units_Sold, Defects_Reported FROM sales_numbers
ORDER BY Defects_Reported DESC

---------------------------------------

--- CREATE a query to have a counter. 
SELECT * FROM sales_numbers;

----------

SET @var2 = 1
SELECT Targeted_Campaign FROM sales_numbers;

----
