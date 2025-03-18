USE amazon;


CREATE TABLE Amazon_sales 
(
		invoice_id VARCHAR(50) PRIMARY KEY NOT NULL,
		branch VARCHAR(5) NOT NULL,
        city VARCHAR(30) NOT NULL,
        customer_type VARCHAR(30) NOT NULL,
        gender VARCHAR(10) NOT NULL,
        product_line VARCHAR(100) NOT NULL,
        unit_price DECIMAL(10, 2) NOT NULL,
        quantity INT NOT NULL,
        VAT FLOAT(6, 4) NOT NULL,
        total DECIMAL(10, 2) NOT NULL,
        date_rec DATE NOT NULL,
        time_rec TIME NOT NULL,
        payment_method VARCHAR(100) NOT NULL,
        cogs DECIMAL(10, 2) NOT NULL,
        gross_margin_percentage FLOAT(10, 2) NOT NULL,
        gross_income DECIMAL(10, 2) NOT NULL,
        rating FLOAT(2, 1) NOT NULL
);        

Select * From amazon.amazon_sales;
        
ALTER TABLE amazon_sales
Add Column timeofday VARCHAR (10);

SET sql_safe_updates = 0;

UPDATE amazon.amazon_sales
SET timeofday = CASE
	WHEN TIME(time) BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
    WHEN TIME(time) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
    ELSE 'Evening'
END;

ALTER TABLE amazon.amazon_sales
ADD Column Dayname VARCHAR(10);

UPDATE amazon.amazon_sales
SET Dayname = CASE
    WHEN DAYNAME(Date) = 'Monday' THEN 'Mon'
    WHEN DAYNAME(Date) = 'Tuesday' THEN 'Tue'
    WHEN DAYNAME(Date) = 'Wednesday' THEN 'Wed'
    WHEN DAYNAME(Date) = 'Thursday' THEN 'Thu'
    WHEN DAYNAME(Date) = 'Friday' THEN 'Fri'
    WHEN DAYNAME(Date) = 'Saturday' THEN 'Sat'
    WHEN DAYNAME(Date) = 'Sunday' THEN 'Sun'
END;

ALTER TABLE amazon.amazon_sales
ADD COLUMN monthname VARCHAR(10);


UPDATE amazon.amazon_sales
SET Monthname = CASE
    WHEN MONTHNAME(Date) = 'January' THEN 'Jan'
    WHEN MONTHNAME(Date) = 'February' THEN 'Feb'
    WHEN MONTHNAME(Date) = 'March' THEN 'Mar'
    WHEN MONTHNAME(Date) = 'April' THEN 'Apr'
    WHEN MONTHNAME(Date) = 'May' THEN 'May'
    WHEN MONTHNAME(Date) = 'June' THEN 'Jun'
    WHEN MONTHNAME(Date) = 'July' THEN 'Jul'
    WHEN MONTHNAME(Date) = 'August' THEN 'Aug'
    WHEN MONTHNAME(Date) = 'September' THEN 'Sep'
    WHEN MONTHNAME(Date) = 'October' THEN 'Oct'
    WHEN MONTHNAME(Date) = 'November' THEN 'Nov'
    WHEN MONTHNAME(Date) = 'December' THEN 'Dec'
END;

        
        /* Setting the 'Safe Update mode to 'OFF' */
        
        USE Amazon;
        
        SET SQL_SAFE_UPDATES = 0;
        
        
        Business Questions and Answers:
        
        USE Amazon;
        
-- 1. What is the count of distinct cities in the dataset?
        
   Select Count(Distinct city) 
   AS distinct_city_count
   From amazon_sales;
          
-- 2. For each branch, what is the corresponding city?       

   Select Branch, City
   From amazon_sales
   Group By Branch, City;
   
-- 3. What is the count of distinct product lines in the dataset?

   Select Count(Distinct product_line)
   AS distinct_product_line_count
   From amazon_sales;
    
-- 4. Which payment method occurs most frequently?

   SELECT payment_method, Count(payment_method)
   AS Frequency 
   From amazon_sales
   Group by payment_method
   Order by Frequency;
   
   
   
   
   
   -- 5. Which product line has the highest sales?
   
   SELECT product_line, sum(quantity) AS Higest_sales
   FROM amazon_sales
   GROUP BY product_line
   ORDER BY  Higest_sales DESC
   Limit 1;
   
   -- 6. How much revenue is generated each month?
   

   
   
   
   
   
   -- 7. In which month did the cost of goods sold reach its peak?
 







-- 8. Which product line generated the highest revenue?


SELECT product_line, SUM(total) AS Total_Sales
FROM amazon_sales
GROUP BY product_line
ORDER BY Total_Sales DESC
Limit 1;




   
   

   
   
   
   
   
   






     

        
        
   
          
        
        
         


