use syntaxhrm_mysql;

-- inner join
-- display emp fname, lname, emp status

SELECT emp_firstname, emp_lastname, name
FROM hs_hr_employees INNER JOIN ohrm_employment_status
ON hs_hr_employees.emp_status = ohrm_employment_status.id;

SELECT emp_firstname, emp_lastname, name
FROM hs_hr_employees emp INNER JOIN ohrm_employment_status stat
ON emp.emp_status = stat.id;

-- we want to see emp fnmae lname that works in smart office

SELECT emp_firstname, emp_lastname, name, city, province
FROM hs_hr_employees JOIN hs_hr_emp_locations
ON hs_hr_employees.emp_number = hs_hr_emp_locations.emp_number
JOIN ohrm_location
ON hs_hr_emp_locations.location_id = ohrm_location.id
WHERE name = 'Smart Office';

-- return matching and non matching data 
-- display all emlployee with job titles or without

SELECT emp_number, emp_firstname, emp_lastname, job_title
FROM hs_hr_employees LEFT JOIN ohrm_job_title
ON hs_hr_employees.job_title_code = ohrm_job_title.id
ORDER BY job_title;

-- retrieve emp number fname, lname, nationality
-- display records even if no emp assign to any nationality

SELECT emp_number, emp_firstname, emp_lastname, name
FROM hs_hr_employees RIGHT JOIN ohrm_nationality
ON hs_hr_employees.nation_code = ohrm_nationality.id
ORDER BY name;

-- display employees who were hired on the same date 

SELECT e1.emp_firstname, e1.emp_lastname, e1.joined_date,
		e2.emp_firstname, e2.emp_lastname
FROM hs_hr_employees  e1 JOIN hs_hr_employees e2
ON e1.joined_date = e2.joined_date;     

-- retrieve employees and their supervisors
-- both stores in one tables
SELECT emp.emp_firstname, emp.erep_sup_emp_number, sup.emp_firstname
FROM hs_hr_employees emp JOIN hs_hr_employees sup
ON emp.erep_sup_emp_number = sup.emp_number;

--   UNION cobines data from two or more tables
-- UNION ALL cobnine all data, with duplicate, do not sort a result
-- UNION combine data, remove the duplicate and sort the result
SELECT emp_firstname FROM hs_hr_employees
UNION ALL
SELECT emp_lastname FROM hs_hr_employees

-- INTERSECT
