# Write your MySQL query statement below
SELECT price.product_id,COALESCE(
round(sum(price.price* unit_sold.units) /
NULLIF(SUM(unit_sold.units), 0),2),0) as average_price 
 
FROM Prices as price LEFT JOIN UnitsSold as unit_sold on 
price.product_id=unit_sold.product_id AND 
 purchase_date BETWEEN start_date AND end_date 
 GROUP BY price.product_id