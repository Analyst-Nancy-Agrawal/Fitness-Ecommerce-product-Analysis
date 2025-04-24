create database fitness_product_ecommerce;
select * from fitness_trackers_sql;
SELECT Brand_Name, Device_Type, COUNT(*) AS Total_Devices
FROM fitness_trackers_sql
GROUP BY Brand_Name, Device_Type;
-- This query gets the total number of distinct brands
SELECT COUNT(DISTINCT Brand_Name) AS Distinct_Brands FROM fitness_trackers_sql;
-- This query gets the names of distinct brands
SELECT DISTINCT Brand_Name AS Distinct_Brands FROM fitness_trackers_sql;
-- This query gets the names of distinct brands and total number of devices based on brands
SELECT Brand_Name, COUNT(*) AS Total_Devices FROM fitness_trackers_sql GROUP BY Brand_Name;
-- This query shows different numbers of models
SELECT COUNT(DISTINCT Model_Name) AS Distinct_Models FROM fitness_trackers_sql;
-- Average selling price per brand
SELECT Brand_Name, AVG(Selling_Price) AS Avg_Selling_Price FROM fitness_trackers_sql GROUP BY Brand_Name;
-- Top 3 Model having highest discount
SELECT Model_Name, (Original_Price - Selling_Price) AS Discount 
FROM fitness_trackers_sql
ORDER BY Discount DESC 
LIMIT 3;
-- Top 3 affordable brand on average
SELECT Brand_Name, AVG(Selling_Price) AS Avg_Price 
FROM fitness_trackers_sql
GROUP BY Brand_Name 
ORDER BY Avg_Price ASC 
LIMIT 3;
-- count of models having no discount
SELECT count(Model_Name)
FROM fitness_trackers_sql
WHERE Selling_Price = Original_Price;
-- shows device type
SELECT distinct Device_Type FROM fitness_trackers_sql;
-- Model with the highest rating
SELECT Model_Name, Rating 
FROM fitness_trackers_sql
ORDER BY Rating DESC 
LIMIT 1;
-- shows avg rating per brand 
SELECT Brand_Name, AVG(Rating) AS Avg_Rating 
FROM fitness_trackers_sql
GROUP BY Brand_Name;
-- shows model with longest battery life
SELECT Model_Name, Average_Battery_Life 
FROM fitness_trackers_sql 
ORDER BY Average_Battery_Life DESC 
LIMIT 1;
-- brand with most total review
SELECT Brand_Name, SUM(Reviews) AS Total_Reviews 
FROM fitness_trackers_sql
GROUP BY Brand_Name 
ORDER BY Total_Reviews DESC 
LIMIT 1;
-- Model with most reviews 
SELECT Model_Name, Reviews 
FROM  fitness_trackers_sql
ORDER BY Reviews DESC 
LIMIT 1;
-- Most used strap_Material per brand 
SELECT Brand_Name, Strap_Material, COUNT(*) AS Count_Used
FROM fitness_trackers_sql
GROUP BY Brand_Name, Strap_Material
ORDER BY Brand_Name, Count_Used DESC;
-- shows brand as per device count
SELECT Brand_Name, Device_Type, COUNT(*) AS Count_Device
FROM fitness_trackers_sql
GROUP BY Brand_Name, Device_Type
ORDER BY Brand_Name, Count_Device DESC;
-- shows model having max black color devices 
SELECT Model_Name, COUNT(*) AS Count_Black_Devices
FROM fitness_trackers_sql
WHERE Color = 'Black'
GROUP BY Model_Name
ORDER BY Count_Black_Devices DESC limit 1;
-- shows Brand having LED Display Devices
SELECT Brand_Name,Device_Type,COUNT(*) AS LED_Display_Count
FROM fitness_trackers_sql
WHERE Display = 'LED Display'
GROUP BY Brand_Name, Device_Type
ORDER BY LED_Display_Count DESC;
-- shows Devices That Have the Most Reviews Overall
SELECT Brand_Name, Model_Name, Reviews
FROM fitness_trackers_sql
WHERE Reviews = (
    SELECT MAX(Reviews)
    FROM fitness_trackers_sql
);