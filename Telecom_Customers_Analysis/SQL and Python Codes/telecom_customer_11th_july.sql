with cte as(select city,sum(total_revenue) as total_revenue,rank() over(order by sum(total_revenue) desc) as rnk
from telecom_customer_churn_Cleaned group by city)
select city,total_revenue from cte where rnk<=5 order by rnk;

select Internet_type,count(distinct Customer_ID) as Customer_count,
(count(distinct Customer_ID)*100.0)/(select COUNT(distinct Customer_ID) from telecom_customer_churn_Cleaned where Internet_Service=1) 
as Overall_Contribution
from telecom_customer_churn_Cleaned group by Internet_Type;

select Contract,COUNT(distinct Customer_ID) as Customer_count from telecom_customer_churn_Cleaned
group by Contract;

select Internet_Type,AVG(Avg_Monthly_GB_Download) as Avg_Usage from telecom_customer_churn_Cleaned where internet_type<>'Not Opted'
group by Internet_Type;

Select Customer_Status,COUNT(distinct Customer_ID) as Customer_count,
(COUNT(distinct Customer_ID)*100.0)/(select COUNT(distinct Customer_ID) from telecom_customer_churn_Cleaned) as Overall_Percent_ 
from telecom_customer_churn_Cleaned
group by Customer_Status;

select Churn_Category,COUNT(distinct Customer_ID) as Customer_Count,
(COUNT(distinct Customer_ID)*100.0)/(select COUNT(distinct Customer_ID) from telecom_customer_churn_Cleaned where Customer_Status='Churned') 
as Overall_Percent
from telecom_customer_churn_Cleaned where Customer_Status='Churned' group by Churn_Category;