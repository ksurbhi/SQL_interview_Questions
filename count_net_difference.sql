-- You are given a table of product launches by company by year. Write a query to count the net difference 
-- between the number of products companies launched in 2020 with the number of products companies 
-- launched in the previous year. Output the name of the companies and a net difference of net
-- products released for 2020 compared to the previous year.

-- 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:
CREATE TABLE car_launches(year int, company_name varchar(15), product_name varchar(30));

INSERT INTO car_launches VALUES(2019,'Toyota','Avalon'),(2019,'Toyota','Camry'),
(2020,'Toyota','Corolla'),(2019,'Honda','Accord'),(2019,'Honda','Passport'),
(2019,'Honda','CR-V'),(2020,'Honda','Pilot'),(2019,'Honda','Civic'),
(2020,'Chevrolet','Trailblazer'),(2020,'Chevrolet','Trax'),(2019,'Chevrolet','Traverse'),
(2020,'Chevrolet','Blazer'),(2019,'Ford','Figo'),(2020,'Ford','Aspire'),(2019,'Ford','Endeavour'),
(2020,'Jeep','Wrangler');
SELECT * FROM car_launches;

-- # We have to be specific to Year 2020 and 2019 because, We can have values for other years as well
WITH CTE AS(
  SELECT
  company_name,
  SUM(CASE WHEN year = 2019 THEN 0 ELSE 1 END) AS 'Prod_count_2020',
  SUM(CASE WHEN year = 2020 THEN 0 ELSE 1 END) AS 'Prod_count_2019'
  FROM car_launches
  Group BY company_name
)
SELECT 
  company_name,
  (Prod_count_2020 - Prod_count_2019) As 'net_difference'
FROM CTE
ORDER BY net_difference DESC;
