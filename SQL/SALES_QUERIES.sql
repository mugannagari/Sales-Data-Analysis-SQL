
-------------------------------------------------------------------------------

---SALES_DATA_ANALYSIS_PROJECT
---DEVELOPED BY : -M.SURESH REDDY
---TOOLS :- SQL SERVER , POWER BI

----------------------------------------------------------------------------

CREATE DATABASE SALES_DATA_PROJECT

USE SALES_DATA_PROJECT

SELECT*
FROM SALES_DATA


-------------------------------------------------
--             INTRODUCTION TO PROJECT
-------------------------------------------------

--This project analyzes retail sales data using SQL Server.
--The dataset contains order details, customer information, product categories, sales, discounts, and profits.
--The goal of this project is to identify business trends, customer behavior, profitable categories, and city-wise performance using SQL queries.


------------------------------------------
--CHECKING NULLS
------------------------------------------


SELECT *
FROM sales_data
WHERE SALES IS NULL

SELECT*
FROM sales_data
WHERE PROFIT IS NULL

-------------------------------------------------------------------------------
--                       SOLVING BUSINESS PROBLEMS 
-------------------------------------------------------------------------------

-------------------------------------------------
--                      TIME ANALYSIS
-------------------------------------------------


--YEAR ON SALES

select year(order_date) as year_sales,ROUND(sum(sales),2) as total_sales
from sales_data
group by year(order_date)


--YEAR ON PROFITS

select year(order_date) as year_profits,ROUND(sum(Profit),2) as total_profits
from sales_data
group by year(order_date)

--MONTH ON SALES


select FORMAT(order_date,'MMMM') as month_sales,ROUND(sum(sales),2) as total_sales
from sales_data
group by FORMAT(order_date,'MMMM')


--MONTH ON PROFITS

select YEAR(ORDER_DATE) AS YEAR,
FORMAT(order_date,'MMMM') as month_profits ,
ROUND(sum(profit),2) as total_profits
from sales_data
group by YEAR(ORDER_DATE), FORMAT(order_date,'MMMM')


---------------------------------------------------
--                      SALES ANALYSIS
---------------------------------------------------

--TOTAL REVENUE

select ROUND(sum(sales),2) as total_sales
from sales_data

--TOTAL PROFIT

select ROUND(sum(PROFIT),2) as total_sales
from sales_data

--TOTAL ORDERS

select count(*) as total_orders
from sales_data
 
 -- AVEGRAGE SALES

 SELECT AVG(SALES) AS AVG_SALES
 FROM sales_data

 --AVERAGE PROFIT

 SELECT AVG(PROFIT) AS AVG_PROFIT
 FROM sales_data

 --AVERAGE QUANTITY

 SELECT AVG(QUANTITY) AS AVG_QUANTITY
 FROM sales_data


 --MAXIMUM SALES

 SELECT MAX(SALES) AS MAX_SALES
 FROM sales_data


--MINIMUM SALES

SELECT MIN(SALES) AS MIN_SALES
FROM sales_data

------------------------------------------------------------------
--                     CUSTOMER ANALYSIS
--------------------------------------------------------------------

-- FINDING  TOP 10 CUSTOMER BY REVENUE

SELECT TOP 10 CUSTOMER_NAME, ROUND(SUM(SALES),2) AS TOP_SALES_CUSTOMERS
FROM sales_data
GROUP BY Customer_Name
ORDER BY TOP_SALES_CUSTOMERS DESC


--FINDING TOP 10 CUSTOMERS BY PROFITS

SELECT TOP 10 Customer_Name,ROUND(SUM(PROFIT),2) AS TOP_PROFITS_CUSTOMERS
FROM sales_data
GROUP BY Customer_Name
ORDER BY TOP_PROFITS_CUSTOMERS DESC

--FINDING TOP 10 CUSTOMERS BY LOSSES

SELECT TOP 10 Customer_Name,ROUND(SUM(PROFIT),2) AS TOP_LOSSES_CUSTOMERS
FROM sales_data
GROUP BY Customer_Name
ORDER BY TOP_LOSSES_CUSTOMERS 

--COUNT OF ORDERS BY EACH CUSTOMER

SELECT CUSTOMER_NAME,COUNT(Order_ID) AS NUMBER_OF_ORDERS
FROM sales_data
GROUP BY CUSTOMER_NAME
ORDER BY NUMBER_OF_ORDERS DESC


--SEGMENT WISE CUSTOMER BEHAVIOUR

SELECT SEGMENT,
ROUND(SUM(SALES),2) AS SALES_BY_SEGMENT,
ROUND(SUM(PROFIT),2) AS PROFIT_BY_SEGMENT
FROM sales_data
GROUP BY Segment
ORDER BY SALES_BY_SEGMENT,PROFIT_BY_SEGMENT 

------------------------------------------------------------------
--                  ANALYSIS ABOUT PRODUCTS 
-------------------------------------------------------------------


--  PRODUCT WISE TOTAL SALES AND PROFITS

select Product_Name,
ROUND(sum(sales),2) as product_sales
from sales_data
group by Product_Name
ORDER BY product_sales DESC


--TOP 10 PRODUCT SALES AND PROFITS

select TOP 10 Product_Name,
ROUND(sum(sales),2) as TOP_product_sales
from sales_data
group by Product_Name
ORDER BY TOP_product_sales DESC


--TOP 10 PRODUCT PROFITS

select TOP 10 product_name , ROUND(sum(Profit),2) as total_profit
from sales_data
group by Product_Name
ORDER BY total_profit DESC

--TOTAL QUANTITY SOLD BY PRODUCT WISE

select product_name,sum(quantity) as count_quantity
from sales_data
group by Product_Name
order by count_quantity desc


--COUNT PRODUCT WISE ORDERS

select product_name,count(order_id) as number_prod_orders
from sales_data
group by Product_Name
order by number_prod_orders desc


--DISCOUNT ALLOWED BY EACH PRODUCT

SELECT PRODUCT_NAME,ROUND(SUM(DISCOUNT),2) AS DISCOUNT_PRODUCT
FROM sales_data
GROUP BY Product_Name
ORDER BY DISCOUNT_PRODUCT DESC


-----------------------------------------------------
--                   CITY WISE ANALYSIS
-----------------------------------------------------


--CITY WISE TOTAL REVENUE

select city,ROUND(sum(sales),2) as total_sales_city
from sales_data
group by City
order by total_sales_city desc


--CITY WISE TOTAL PROFIT

select city,round(sum(profit),2) as total_profit_city
from sales_data
group by City
order by total_profit_city desc

--CITY WISE QUANTITY SOLD

select city,sum(quantity) as count_quantity_city
from sales_data
group by city
order by count_quantity_city desc


--COUNT CITY WISE ORDERS

SELECT CITY , COUNT(ORDER_ID) AS NUMBER_CITY_ORDERS
FROM sales_data
GROUP BY CITY
ORDER BY NUMBER_CITY_ORDERS DESC


--------------------------------------------------------------------
--                     ANALYSIS THE SEGMENT 
--------------------------------------------------------------------


--TOTAL REVENUE BY SEGMENT

SELECT SEGMENT,ROUND(SUM(SALES),2) AS TOTAL_SEG_REVENUE
FROM sales_data
GROUP BY Segment
ORDER BY TOTAL_SEG_REVENUE DESC

--TOTAL PROFIT BY SEGMENT

SELECT SEGMENT,ROUND(SUM(PROFIT),2) AS TOTAL_SEG_PROFIT
FROM sales_data
GROUP BY Segment
ORDER BY TOTAL_SEG_PROFIT DESC

--TOTAL QUANTITY OF EACH SEGMENT

SELECT SEGMENT,SUM(QUANTITY) AS TOTAL_SEG_QUANTITY
FROM sales_data
GROUP BY Segment
ORDER BY TOTAL_SEG_QUANTITY DESC

--NUMBER OF ORDERS PER EACH SEGMENT

SELECT SEGMENT, COUNT(ORDER_ID)AS NUM_SEG_ORDERS
FROM sales_data
GROUP BY Segment
ORDER BY NUM_SEG_ORDERS DESC


------------------------------------------------------------
--                   ANALYSIS OF CATEGORY
------------------------------------------------------------


--TOTAL CATEGORY REVENUE

SELECT CATEGORY,ROUND(SUM(SALES),2) AS TOTAL_CAT_REVENUE
FROM sales_data
GROUP BY Category
ORDER BY TOTAL_CAT_REVENUE DESC


--TOTAL CATEGORY PROFITS

SELECT CATEGORY,ROUND(SUM(PROFIT),2) AS TOTAL_CAT_PROFITS
FROM sales_data
GROUP BY Category
ORDER BY TOTAL_CAT_PROFITS DESC

--TOTAL CATEGORY QUNTITY

SELECT CATEGORY,SUM(QUANTITY) AS TOTAL_CAT_QUANTITY
FROM sales_data
GROUP BY Category
ORDER BY TOTAL_CAT_QUANTITY DESC


--NUMBER OF CATEGORY ORDERS

SELECT CATEGORY,COUNT(ORDER_ID) AS COUNT_CAT_ORDERS
FROM sales_data
GROUP BY Category
ORDER BY COUNT_CAT_ORDERS DESC

--DISCOUNT ALLOWED BY EACH CATEGORY

SELECT CATEGORY,ROUND(SUM(DISCOUNT),2) AS DISCOUNT_CAT
FROM sales_data
GROUP BY Category
ORDER BY DISCOUNT_CAT


SELECT*
FROM sales_data

----------------------------------------------------------
--TOP VALUES IN SALES DATA
----------------------------------------------------------


--TOP 3 IN REVENUE

SELECT TOP 3 Sales,CUSTOMER_NAME,Product_Name
FROM sales_data
ORDER BY SALES DESC

--TOP 3 PROFITS

SELECT TOP 3 Profit,CUSTOMER_NAME,Product_Name
FROM sales_data
ORDER BY Profit DESC

--TOP 3 QUNTITY

SELECT TOP 3 Quantity,CUSTOMER_NAME,Product_Name
FROM sales_data
ORDER BY Quantity DESC


--TOP 2 IN EACH CITY SALES


WITH TOP_VALUES AS(
SELECT CITY,ROUND(SALES,2) AS SALES,
RANK() OVER (PARTITION BY CITY ORDER BY SALES DESC) AS CITY_TOP
FROM sales_data
)
SELECT*
FROM TOP_VALUES
WHERE CITY_TOP <=2

--FIND THE 2ND MAXIMUM SALES

SELECT ROUND(MAX(SALES),2) AS SECOND_MAX
FROM sales_data
WHERE SALES <(SELECT MAX(SALES) AS FIRST_MAX
              FROM sales_data);
			  
--GIVING RANKS TO SALES

SELECT CUSTOMER_NAME,SALES,PRODUCT_NAME,
RANK()OVER(ORDER BY SALES DESC) AS RANK_CUSTOMERS
FROM SALES_DATA

-- LOSS IN PROIFTS

SELECT CUSTOMER_NAME,PRODUCT_NAME,PROFIT
FROM sales_data
WHERE PROFIT < 0

--LOSS IN SALES

SELECT CUSTOMER_NAME,PRODUCT_NAME,SALES
FROM sales_data
WHERE SALES < 0


--CREATING NEW COLUMN FOR CONCLUDE PROFIT & LOSSES

SELECT *,
CASE WHEN PROFIT < 0 THEN 'LOSS'
ELSE 'PROFIT'
END  AS PROFIT_LOSS
FROM SALES_DATA


--RUNNING TOTAL REVENUE

SELECT Order_Date, CUSTOMER_NAME,ROUND(SALES,2) AS SALES,
ROUND(SUM(Sales) OVER (ORDER BY ORDER_DATE ),2) AS RUNNGING_TOTAL_SALES
FROM sales_data

--RUNNING TOTAL PROFIT

SELECT CUSTOMER_NAME,Profit,
SUM(Profit) OVER (ORDER BY PROFIT ) AS RUNNGING_TOTAL_PROFIT
FROM sales_data
WHERE PROFIT >0

--RUNNING TOTAL LOSSES

SELECT CUSTOMER_NAME,Profit,
SUM(Profit) OVER (ORDER BY PROFIT ) AS RUNNGING_TOTAL_LOSSES
FROM sales_data
WHERE PROFIT <0


-- FINDING THE REVENUE MORE THEN THE AVERAGE SALES

SELECT*
FROM sales_data
WHERE SALES >(SELECT AVG(SALES) FROM sales_data)
ORDER BY SALES;


-------------------------------------------------------------
--                    KEY INSIGHTS
-------------------------------------------------------------


--PUNE CITY CONTRIBUTED MAXIMUM PROFITS AND HYDERABAD CITY CONTRIBUTED MAXIMUM SALES.

--FURNITURES GENERATED HIGHEST REVENUE AND GROCERYS HAS MAXIMUM PROFITS TO COMPARE OTHER CATEGORY

--CORPORATE CUSTOMERS HAS GENERATED MORE REVENUE AND PROFIT ALSO.

--SOME SALES WAS HIGH BUT GENERATING NEGATIVE PROFITS. IN ANY BUSINESS WE SHOULD BALANCE BOTH REVENUE AND PROFIT


-------------------------------------------------------------
--                 RECOMMENDATIONS
-------------------------------------------------------------


--TO IMPROVE SOME MARKETING STRATEGIES IN TOP SELLING CITY.

--TO PROVIDE PERSONALIZED OFFERS FOR CORPORATE CUSTOMERS TO IMPROVE LONG-TERM RELATIONSHIP. 

--TO INCREASE MORE DISCOUNTS  TO ATTRACT THE CUSTOMERS. PROVIDE SOME OFFERS IN NEGATIVE PROFIT AREAS.

--TO IDENTIFY THE NEGATIVE PROFIT PRODUCT AND INCREASE PRICE AND REDUCE  DISCOUNTS.

--INTRODUCE NEW THINGS LIKE CASHBACKS AND MEMBERSHIP REWARDS TO INCREASE CUSTOMER LONG-TERM RELATIONSHIP.





-------------------------- THE END -------------------------------------------