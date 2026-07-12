select city,count(distinct Customer_ID) as Customer_count from telecom_customer_churn_Cleaned group by city order by Customer_count ;

select Phone_Service,COUNT(distinct Customer_ID) as Customer_Count,
(COUNT(distinct Customer_ID)*100.0)/(select COUNT(distinct Customer_ID) from telecom_customer_churn_Cleaned) as User_Percent 
from telecom_customer_churn_Cleaned group by Phone_Service order by User_Percent desc;

select Internet_Service,COUNT(distinct Customer_ID) as Customer_Count,
(COUNT(distinct Customer_ID)*100.0)/(select COUNT(distinct Customer_ID) from telecom_customer_churn_Cleaned) as User_Percent 
from telecom_customer_churn_Cleaned group by Internet_Service order by User_Percent desc;

select COUNT(distinct Customer_ID) as Customer_Count,
(COUNT(distinct Customer_ID)*100.0)/(select COUNT(distinct Customer_ID) from telecom_customer_churn_Cleaned) as User_percentage_
from telecom_customer_churn where Phone_Service=1 and Internet_Service=1;

with cte as(select *,case when age>=18 and age<=30 then '18 to 30'
when age>=31 and age<=40 then '31 to 40'
when age>=41 and age<=60 then '41 to 60'
when age>=60 then '60+'
end as age_category
from telecom_customer_churn_cleaned)
select age_category,SUM(case when Phone_Service=1 then 1 else 0 end) as phone_service_users, 
SUM(case when Internet_Service=1 then 1 else 0 end) as Internet_service_users from cte group by age_category order by age_category;

with cte as(select *,case when age>=18 and age<=30 then '18 to 30'
when age>=31 and age<=40 then '31 to 40'
when age>=41 and age<=60 then '41 to 60'
when age>=60 then '60+'
end as age_category
from telecom_customer_churn_cleaned)
select age_category,avg(Tenure_in_Months) as Average_tenure from cte group by age_category order by age_category;