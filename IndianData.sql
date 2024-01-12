--Viewing Data
select * From ECommercedata_india..List_of_Orders_NEW

select * From ECommercedata_india..Order_Details_New

--total profits by category
select 
sum(profit) as Total_Profit,
category
from ECommercedata_india..Order_Details_New
group by category
order by total_profit desc

--joining tables by ID
Select *
from list_of_Orders_NEW l
JOIN Order_Details_New d
ON l.order_ID = d.order_ID

--joining tables and taking important information for Visualization
select
l.Order_ID,
Order_date,
State,
City,
Profit,
Category,
Sub_Category
from list_of_Orders_NEW l
JOIN Order_Details_New d
ON l.order_ID = d.order_ID;

select
l.Order_ID,
Order_date,
Case
	When MONTH(order_date) in (12,1,2) then 'Winter'
	When month(order_date) in (3,4,5) then 'Spring'
	When Month(order_date) in (6,7,8) then 'Summer'
	When month(order_date) in (9,10,11) then 'Fall'
End as season,
State,
City,
Profit,
Category,
Sub_Category
from list_of_Orders_NEW l
JOIN Order_Details_New d
ON l.order_ID = d.order_ID;

SELECT
    l.Order_ID,
    Order_date,
    State,
    City,
    SUM(Profit) as total_profit,
    Category,
    Sub_Category
FROM
    list_of_Orders_NEW l
JOIN
    Order_Details_New d ON l.order_ID = d.order_ID
GROUP BY
    l.Order_ID,
    Order_date,
    State,
    City,
    Category,
    Sub_Category;

--what states create the most profit
select
	l.State,
	sum(d.profit) as total_profit
from 
	List_of_Orders_NEW l
Join 
	Order_Details_New d on l.order_ID = d.order_ID
group by
	l.state
Order by 
	total_profit desc;


	--running total CTE
With OrderDetailsWithTotal (Order_date, running_total) as(
	Select
	Order_date,
	Sum(d.Profit) OVER (order by order_date) as running_total
From List_of_Orders_NEW l
Join Order_Details_new d on l.order_ID = d.order_ID)
Select 
	Order_date,
	Running_total
from orderdetailswithtotal


