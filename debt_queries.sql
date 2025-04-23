select * from dataanalytics.international_debt_with_missing_values;

select count (*) from dataanalytics.international_debt_with_missing_values;


--  What is the total amount of debt owed by all countries in the dataset?

select sum(debt) as total_debt
from dataanalytics.international_debt_with_missing_values;


-- How many distinct countries are recorded in the dataset?

select distinct country_name 
from dataanalytics.international_debt_with_missing_values;


 -- What are the distinct types of debt indicators, and what do they represent?

select distinct indicator_name, indicator_code
from dataanalytics.international_debt_with_missing_values;

--Which country has the highest total debt, and how much does it owe?


select country_name,debt
from dataanalytics.international_debt_with_missing_values
where 
debt =(select max(debt)
from dataanalytics.international_debt_with_missing_values);


-- What is the average debt across different debt indicators?

select indicator_name, 
  AVG(debt) as average_debt
from
  dataanalytics.international_debt_with_missing_values
group by
  indicator_name;

--Which country has made the highest amount of principal repayments?


select country_name, debt
from
  dataanalytics.international_debt_with_missing_values
where
  indicator_name like'%AMT, current US$%'
group by 
  country_name, debt
order by
  debt desc
limit 1;

-- What is the most common debt indicator across all countries?

select 
  indicator_name,
  count(*) as most_common
from
  dataanalytics.international_debt_with_missing_values
group by
  indicator_name
order by
  most_common
LIMIT 1;


--  Identify any other key debt trends and summarize your findings

select * from dataanalytics.international_debt_with_missing_values;


--  Top 5 countries with the highest total debt 

select
  country_name, sum(debt) as total_debt
  from dataanalytics.international_debt_with_missing_values
group by
  country_name
order by 
  total_debt desc
limit 5;

-- top 5 countries with the least total debt

select
  country_name, sum(debt) as total_debt
  from dataanalytics.international_debt_with_missing_values
group by
  country_name
order by 
  total_debt asc
limit 5;



-- Top countries borrowing the most (bilateral only)

select country_name, sum(debt) as total_bilateral
  from dataanalytics.international_debt_with_missing_values
where
  indicator_name like'%bilateral%'
group by
  country_name
order by
  total_bilateral desc
  limit 5;



