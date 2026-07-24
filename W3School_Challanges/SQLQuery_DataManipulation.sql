/* Write SQL that updates the salary column of the employees table 
by increasing each salary by 10% for those employees who have 
department as 'Engineering'.
*/

CREATE TABLE employees(
	id INT Primary Key,
	first_name VARCHAR (50),
	department VARCHAR (50),
	salary DECIMAL                                     
);

INSERT INTO employees
	VALUES 
		(1, 'George', 'Technology', 3180),
		(2, 'Tatiane', 'Financial', 4800),
		(3, 'Benjamin', 'Engineering', 7400),
		(4, 'Thayane', 'Medical', 3700),
		(5, 'Caio', 'Logistics', 2900)

SELECT * FROM employees;

UPDATE employees 
	SET salary = salary + (salary * 0.1) 
WHERE department = 'Engineering';

