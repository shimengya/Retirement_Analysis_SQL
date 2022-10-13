# Retirement_Analysis_SQL

## Overview of the analysis:
At present, big data is getting more and more popular and it requires us to learn more tools to better analysis big data to meet the business requirements. During this analysis, we will use SQL which is currently the most well-known database analysis tool. We learnt how to import the raw database and use many SQL functions to select dataset as required. 

## The purpose of the new analysis is well defined. 
AS SQL is powerful data analysis tool/database. This challange is utilize the SQL to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. To better understand how SQL works, it's curcial to understand the "relationship" among different tables and we use primary key and foreign key to build up the links. As the picture shows below, all of these primary key and foreign are signigiciantly important bridge between each two tables. Also, as we learnt before, we could use join to merge different tables per the key.

![QuickDBD-export](QuickDBD-export.png)

### The Number of Retiring Employees by Title 
- Filter all employees who were born between 1952 and 1955.
[retirement_titles](Pewlett-Hackard-Analysis/retirement_titles.csv)

- Once we meet the age requirement, we need to select the last position held for all current employees who is eligible for retirement.
[unique_titles](Pewlett-Hackard-Analysis/unique_titles.csv)

- Analysis:
    - There are 72,458 employees meet the mentorship participation requirements.
    - Using count function and group by function, we got the table as below which shows the titles for retiring employees. Per the table, there are around 25,916 Senior Engineer and 24,926 Senior Staff out of the total title. It's understandable that most of the employees were promoted as senior before retirement.
[retiring_titles](Pewlett-Hackard-Analysis/retiring_titles.csv)

### The Employees Eligible for the Mentorship Program
- Filtered employees with birth date between 1965/1/1 and 1965/12/31 who is currently hiring
- Analysis:
    - There are 1,549 employees meet the mentorship participation requirements.
    - Per the table, there are around 528 Senior Engineer and 577 Staff out of the total title. 

[mentorship_eligibilty](Pewlett-Hackard-Analysis/mentorship_eligibilty.csv)


## Summary - The summary addresses the two questions and contains two additional queries or tables that may provide more insight. 
- There are around 35% Senior Engineer and 34% Senior Staff out of the total title. 
  - 
  - QUERIES:
    SELECT title, retiring_titles.count,
    ROUND(retiring_titles.count*100/(select sum(retiring_titles.count)), 2) as "percentage_of_total_title"
    From retiring_titles 
 - There are around 35% Senior Engineer and 34% Senior Staff out of the total title. 
  -
  - QUERIES:
    select mentorship_eligibilty_count.title, mentorship_eligibilty_count.count,
    round(mentorship_eligibilty_count.count*100/select sum(mentorship_eligibilty_count.count) as "total_title_memtorship",2) as "percentage_of_total_title"
    INTO mentorship_eligibilty_percentage
    from mentorship_eligibilty_count
