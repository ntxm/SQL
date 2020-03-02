-- Find out those employees who belong to a department including the employees
-- who do not belong to any department.
SELECT HR.EMPLOYEES.*, HR.DEPARTMENTS.department_name
FROM HR.EMPLOYEES
LEFT OUTER JOIN HR.DEPARTMENTS
ON HR.EMPLOYEES.department_id = HR.DEPARTMENTS.department_id;


-- Verify department id, department name, state province for all 
-- state provinces even where no department is located.
SELECT HR.DEPARTMENTS.department_id, HR.DEPARTMENTS.department_name, HR.LOCATIONS.state_province
FROM HR.DEPARTMENTS
RIGHT OUTER JOIN HR.LOCATIONS
ON HR.DEPARTMENTS.location_id = HR.LOCATIONS.location_id
WHERE state_province IS NOT NULL;


-- How can we display all employees  ids with their first name, last name and salary, 
-- all department names, cities and all country names
SELECT employee_id, first_name, last_name, salary, department_name, city, country_name
FROM HR.EMPLOYEES
FULL OUTER JOIN HR.DEPARTMENTS
ON HR.EMPLOYEES.department_id = HR.DEPARTMENTS.department_id
FULL OUTER JOIN HR.LOCATIONS
ON HR.DEPARTMENTS.location_id = HR.LOCATIONS.location_id
FULL OUTER JOIN HR.COUNTRIES
ON HR.LOCATIONS.country_id = HR.COUNTRIES.country_id;


-- How can we display departments that have employees assigned 
-- along with those that do not have any employees.
SELECT department_name
FROM HR.DEPARTMENTS
FULL OUTER JOIN HR.EMPLOYEES
ON HR.DEPARTMENTS.department_id = HR.EMPLOYEES.department_id
WHERE HR.DEPARTMENTS.department_id IS NULL 
OR HR.EMPLOYEES.department_id IS NULL


-- get locations
SELECT * FROM HR.LOCATIONS;

-- copy table with  data from HR.LOCATIONS to NEW_LOCATIONS
CREATE TABLE NEW_LOCATIONS 
AS 
SELECT * FROM HR.LOCATIONS;

-- get locations from new table
SELECT * FROM NEW_LOCATIONS;

-- add new row into NEW_LOCATIONS
INSERT INTO NEW_LOCATIONS(LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID)
                    VALUES(3300, 'Father Capadano 409', 11302, 'Staten Island', 'NY', 'US');  
                    
                    
-- get locations from new table
SELECT * FROM NEW_LOCATIONS;

-- check whether 2 given tables are identical or not
    -- way 1
SELECT * FROM HR.LOCATIONS
UNION
SELECT * FROM NEW_LOCATIONS;

    -- way 2 (works for MySQL)
CHECKSUM TABLE HR.LOCATIONS, NEW_LOCATIONS;    
