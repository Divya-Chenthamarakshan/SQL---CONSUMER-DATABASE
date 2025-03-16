CREATE TABLE new_shopping_behavior (
    Customer_ID TEXT,
    Age INTEGER,
    Gender TEXT,
    Item_Purchased TEXT,
    Category TEXT,
    Purchase_Amount_USD REAL,
    Location TEXT,
    Size TEXT,
    Color TEXT,
    Season TEXT,
    Review_Rating INTEGER,
    Subscription_Status TEXT,
    Shipping_Type TEXT,
    Discount_Applied BOOLEAN,
    Promo_Code_Used TEXT,
    Previous_Purchases INTEGER,
    Payment_Method TEXT,
    Frequency_of_Purchases TEXT
);

#------INSERT INTO new_shopping_behavior (
#------Customer_ID, Age, Gender, Item_Purchased, Category, Purchase_Amount_USD, Location, Size, Color, Season, Review_Rating, Subscription_Status, Shipping_Type, Discount_Applied, Promo_Code_Used, Previous_Purchases, Payment_Method, Frequency_of_Purchases
#-------)
#------SELECT 
 #--------field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13, field14, field15, field16, field17, field18
#----------FROM shopping_behavior1;
#---------DROP TABLE shopping_behavior1;
#----------DROP TABLE shopping_behavior_updated;

#--------ALTER TABLE new_shopping_behavior RENAME TO shopping_behavior1;

#-------Customer Satisfaction (CSAT) Score
	
SELECT
  SUM("Review_Rating") AS "Total Review Rating",
 AVG("Review_Rating") AS "Average CSAT Score"
FROM
  shopping_behavior1;

#------- Sales Performance
SELECT 
    "Shipping_Type", 
    COUNT(*) AS "Orders Count", 
    SUM("Purchase_Amount_USD") AS "Total Sales",
    COUNT(CASE WHEN "Discount_Applied" = 'Yes' THEN 1 END) AS "Discounted Sales",
    COUNT(CASE WHEN "Promo_Code_Used" = 'Yes' THEN 1 END) AS "Promo Code Usage"
FROM shopping_behavior1
GROUP BY "Shipping_Type";


#-------- Product Profit Margin

SELECT 
    "Item_Purchased", 
    ROUND(AVG("Review_Rating"), 2) AS "Average Review Rating", 
    SUM("Purchase_Amount_USD") AS "Total Revenue",
    ROUND(SUM("Purchase_Amount_USD") * 0.3, 2) AS "Estimated Profit" -- Assuming a 30% margin
FROM shopping_behavior1
GROUP BY "Item_Purchased"
ORDER BY "Total Revenue" DESC;


#-------------------Customer Lifetime Value (CLTV)

SELECT 
    "Customer_ID", 
    SUM("Purchase_Amount_USD") AS "Lifetime Value"
FROM shopping_behavior1
GROUP BY "Customer_ID"
ORDER BY "Lifetime Value" DESC;


#-----------------Average Purchase Value (APV)

SELECT 
    ROUND(AVG("Purchase_Amount_USD"), 2) AS "Average Purchase Value"
FROM shopping_behavior1;


#----------------Seasonal Purchase Patterns
SELECT 
    "Season", 
    COUNT(*) AS "Total Purchases", 
    SUM("Purchase_Amount_USD") AS "Total Sales"
FROM shopping_behavior
GROUP BY "Season"
ORDER BY "Total Sales" DESC;

#---------Review Rating Distribution

SELECT 
    "Review_Rating", 
    COUNT(*) AS "Number of Reviews"
FROM shopping_behavior
GROUP BY "Review_Rating"
ORDER BY "Review_Rating";


