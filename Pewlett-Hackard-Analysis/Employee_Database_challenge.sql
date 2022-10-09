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

select*from mentorship_eligibilty
ORDER BY emp_no













