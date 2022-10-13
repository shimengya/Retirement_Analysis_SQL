-- CREATE A RETIREMENT EMPLOYEE LIST WITH TITLES
SELECT
	e.emp_no,
    e.first_name,
	e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- select*from retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- retrieve the number of employees by their most recent job title who are about to retire

SELECT COUNT(u.title), u.title
-- INTO retiring_titles
FROM unique_titles AS u
GROUP BY title
ORDER BY COUNT(u.title) DESC


-- Mentorship Eligibility table that holds the employees 
-- 	who are eligible to participate in a mentorship program

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
		e.first_name, 
		e.last_name, 
		e.birth_date, 
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibilty
FROM employees as e
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01');


-- queries for the percentage calculation for titles/mentorship
select sum(m.count) as "total_title_memtorship"
from mentorship_eligibilty_count as m
-- 72458
-- 1549

SELECT title, retiring_titles.count,
ROUND(retiring_titles.count*100/72458, 2) as "percentage_of_total_title"
INTO retiring_titles_percentage
From retiring_titles 
						  
select mentorship_eligibilty_count.title, mentorship_eligibilty_count.count,
round(mentorship_eligibilty_count.count*100/1549,2) as "percentage_of_total_title"
INTO mentorship_eligibilty_percentage
from mentorship_eligibilty_count

-- queries for the mentorship gender
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
		e.gender,
		ti.title
INTO mentorship_eligibilty_gender
FROM employees as e
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01');

select count(gender), gender
-- INTO mentorship_eligibilty_gender_count
from mentorship_eligibilty_gender
GROUP BY gender

-- select*from mentorship_eligibilty_gender_count

select sum(m.count) as "total_title_memtorship"
from mentorship_eligibilty_gender_count as m
-- 1549
						  
select mentorship_eligibilty_gender_count.gender, mentorship_eligibilty_gender_count.count,
round(mentorship_eligibilty_gender_count.count*100/1549,2) as "percentage_of_gender_mentorship"
INTO mentorship_eligibilty_gender_percentage
from mentorship_eligibilty_gender_count
