select * from telecom_customer_churn_Cleaned;

select gender,count(distinct customer_Id) as customer_count from telecom_customer_churn_Cleaned group by gender;

with cte as(select *,case when age>=18 and age<=30 then '18 to 30'
when age>=31 and age<=40 then '31 to 40'
when age>=41 and age<=60 then '41 to 60'
when age>=60 then '60+'
end as age_category
from telecom_customer_churn_cleaned)
select age_category, COUNT(customer_id) as cust_count from cte group by age_category order by age_category;

select max(age) from telecom_customer_churn_Cleaned;