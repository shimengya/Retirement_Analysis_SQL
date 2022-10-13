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
    - There are 72,458 employees meet the retirement requirements.
    - Using count function and group by function, we got the table as below which shows the titles for retiring employees. Per the table, there are around 25,916 Senior Engineer and 24,926 Senior Staff out of the total title. It's understandable that most of the employees were promoted as senior before retirement.

|count|title             |
|-----|------------------|
|25916|Senior Engineer   |
|24926|Senior Staff      |
|9285 |Engineer          |
|7636 |Staff             |
|3603 |Technique Leader  |
|1090 |Assistant Engineer|
|2    |Manager           |


[retiring_titles](Pewlett-Hackard-Analysis/retiring_titles.csv)

### The Employees Eligible for the Mentorship Program
- Filtered employees with birth date between 1965/1/1 and 1965/12/31 who is currently hiring.
- Analysis:
    - There are 1,549 employees meet the mentorship participation requirements.
    - Per the table, there are around 528 Senior Engineer and 577 Staff out of the total title. 

[mentorship_eligibilty](Pewlett-Hackard-Analysis/mentorship_eligibilty.csv)


## Summary - The summary addresses the two questions and contains two additional queries or tables that may provide more insight. 

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    - Per the analysis above, if eligible employees got retired, more than 72,000 employees would leaving Pewlett Hachard which is a significate large amount.

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    - The firm could widen the range of birth date to increase mentorship eligible employees. It would drmatically help Pewlett Hackard to better manage its retiring employees.
    - However, to build the reputation, Pewlett Hackard can't increase huge amount of mentorship eligible employees.
    - The number of mentorship eligible participants is drmatically less than retiring employees.

### Two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
- Query to calculate the percentage for retiring titles and percentage for eligible mentorship.
    - There are around 35% Senior Engineer and 34% Senior Staff out of the total title meet the requirements for retirement.
    - There are around 34% Senior Engineer and 37% Staff out of the total title for the eligible mentorship.

[retiring_titles_percentage](Pewlett-Hackard-Analysis/retiring_titles_percentage.csv)

[mentorship_eligibilty_percentage](Pewlett-Hackard-Analysis/mentorship_eligibilty_percentage.csv)

- Query to calculate the gender percentage for eligible mentorship. It is interesting that there are more male than female met the requirements for mentorship.
    - There are around 58% male and 41% female eligible for mentorship.

[mentorship_eligibilty_gender_percentage](Pewlett-Hackard-Analysis/mentorship_eligibilty_gender_percentage.csv)
