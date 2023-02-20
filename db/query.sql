-- view roles join table 
SELECT role.id,title, department.name AS department,salary
FROM role 
LEFT JOIN department 
ON role.department_id = department.id
ORDER BY role.id

-- view employees join table 
SELECT employee.id,employee.first_name,employee.last_name,title,name AS department,salary,
CONCAT(e.first_name," ",e.last_name) AS manager
FROM employee
LEFT JOIN role
ON employee.role_id = role.id
LEFT JOIN department
ON role.department_id = department.id
LEFT JOIN employee e
ON employee.manager_id = e.id
ORDER BY employee.role_id

-- view employee by manager / show table with manager names
SELECT DISTINCT CONCAT(e.first_name," ",e.last_name) AS manager_name
FROM employee
LEFT JOIN employee e
ON employee.manager_id = e.id
WHERE employee.manager_id IS NOT NULL

--return employee information according to user input
SELECT employee.id,employee.first_name,employee.last_name,title,name AS department,salary
FROM employee
LEFT JOIN role
ON employee.role_id = role.id
LEFT JOIN department
ON role.department_id = department.id
LEFT JOIN employee e
ON employee.manager_id = e.id
WHERE CONCAT(e.first_name," ",e.last_name) = manager_name_use_input
ORDER BY employee.role_id

-- view employee by department / show all the department in a table
SELECT DISTINCT name FROM department
-- return employee information acoording to user input
SELECT employee.id,employee.first_name,employee.last_name,title,name AS department,salary,
CONCAT(e.first_name," ",e.last_name) as manager
FROM employee
LEFT JOIN role
ON employee.role_id = role.id
LEFT JOIN department
ON role.department_id = department.id
LEFT JOIN employee e
ON employee.manager_id = e.id
WHERE name = department_name_user_input
ORDER BY employee.role_id

-- show all the department in a table
SELECT DISTINCT name from department
-- return employee information acoording to user input
-- SUM the total salary within a department
SELECT name AS department, SUM(salary) AS utilized_budget
FROM employee
LEFT JOIN role
ON employee.role_id = role.id
LEFT JOIN department
ON role.department_id = department.id
WHERE name = department_name_input
GROUP BY name

-- add department
-- Reset Auto Increment Values
ALTER TABLE department AUTO_INCREMENT = 1
-- insert user input data to table 
INSERT INTO department SET name = user_input
-- show all the data in department
SELECT * FROM department

-- delete department
-- create non-duplicated department lists for users to choose from
SELECT DISTINCT name FROM department
-- temporarily disable a foreign key constraint
SET FOREIGN_KEY_CHECKS=0
-- delete department
DELETE FROM department WHERE name = user_input

-- add role
-- create non-duplicated department lists for users to choose from
SELECT DISTINCT * FROM department
-- Reset Auto Increment Values
ALTER TABLE role AUTO_INCREMENT = 1
-- insert user input role to database
INSERT INTO role SET 
        title = user_input_role
        salary = user_input_salary
        department_id = user_choose_departID
      
-- delete role
-- create non-duplicated role title lists for users to choose from
SELECT DISTINCT title FROM role
-- temporarily disable a foreign key constraint
SET FOREIGN_KEY_CHECKS=0
-- delete user choose role from database
DELETE FROM role WHERE title = user_choose_roleTitle


--add employee
-- create non-duplicated role title lists for users to choose from
SELECT DISTINCT title, id FROM role
-- create non-duplicated all manager lists for users to choose from
SELECT DISTINCT CONCAT(e.first_name," ",e.last_name) AS manager_name,e.id
FROM employee
LEFT JOIN employee e
ON employee.manager_id = e.id
WHERE employee.manager_id IS NOT NULL
-- insert user input to database
INSERT INTO employee SET 
        first_name = user_input_first_name,
        last_name = user_input_last_name,
        role_id = roleID(user_choose_role_id),
        manager_id = managerID(user_choose_manager_id)

-- delete employee
-- create non-duplicated employee name lists for users to choose from
SELECT DISTINCT CONCAT(first_name,' ',last_name) AS full_name FROM employee
--delete employee from database
DELETE FROM employee WHERE CONCAT(first_name,' ',last_name) = user_choose_name
