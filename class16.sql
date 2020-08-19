# 1 The email field can't be null due to a constrait on the field.

# 2
-- This query runs with no problems
UPDATE employees SET employeeNumber = employeeNumber - 20;

select * from employees e ;
-- This query doesn't work because the when updating the second row,
-- the primary key "employee_number" is the same that the third row's primary key.
UPDATE employees SET employeeNumber = employeeNumber + 20;




# 3 
 ALTER TABLE employees ADD age int not null check(age >= 16 && age <= 70) default 18;
	
-- this insert doesn't work because the "age" field is smaller than 16

 insert
	into
	employees (lastName, firstName, employeeNumber, extension, email, officeCode, jobTitle, age)
values ("Ruiz", "María", 1,"x4040", "asdf", 1, "alguien", 1)

# 4
-- Film and Actor are tables which have a primary key.
-- film_actor is a table which stores references to these two tables' primary keys through a foreign key field.
-- Multiple entries from film_actor can reference the same entry from film or actor, 
-- but there can not be two entries referencing the same pair of actor and film entries.

# 5 
alter table employees add lastUpdate date;
update employees set firstName = "xd";
CREATE TRIGGER before_employee_update1 BEFORE
UPDATE
	ON
	employees FOR EACH ROW 
BEGIN
	update employees 
		set lastUpdate = CURRENT_DATE
	where employeeNumber = OLD.employeeNumber;
END