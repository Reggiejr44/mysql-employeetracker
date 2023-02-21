INSERT INTO department(department_name)
VALUES ("Sales"),
       ("Technology"),
       ("Account"),
       ("Legal");

INSERT INTO role (title, salary, department_id)
VALUES  ("Sales Lead", 150000, 1),
        ("Salesperson", 10000, 1),
        ("Technology Director", 190000, 2),
        ("Software Engineer", 120000, 2),
        ("Account Manager", 130000, 3),
        ("Accountant", 100000, 3),
        ("Legal Team Lead", 150000, 4),
        ("Lawyer", 100000, 4);

INSERT INTO employee(first_name, last_name, role_id, manager_id)
VALUES  ("Tiera", "Prince", 1, NULL),
        ("Terrell", "Prince", 2, 1),
        ("LaQuanda", "Prince", 3, NULL),
        ("Reginald", "Prince", 4, 3),
        ("Nico", "Welch", 5, NULL),
        ("Brielle", "Willingham", 6, 5),
        ("LaShaunda", "White", 7, NULL),
        ("Larry", "White", 8, 7);