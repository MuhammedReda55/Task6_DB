CREATE DATABASE Task07
USE Task06
CREATE SCHEMA schema3

-- 1- Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE schema3.Employees(
 ID INT,
 Name VARCHAR,
 Salary DECIMAL
)

-- 2- Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE schema3.Employees
ADD Department VARCHAR(50)

-- 3- Remove the "Salary" column from the "Employees" table.
 ALTER TABLE schema3.Employees
 DROP COLUMN Salary

 -- 4- Rename the "Department" column in the "Employees" table to "DeptName".
 EXEC sp_rename 'schema3.Employees.Department', 'DeptName', 'COLUMN'

 -- 5- Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
  CREATE TABLE schema3.Projects(
  ProjectID INT,
  ProjectName VARCHAR
  )

  -- 6- Add a primary key constraint to the "Employees" table for the "ID" column.
   ALTER TABLE schema3.Employees
   ALTER COLUMN ID INT NOT NULL 

   ALTER TABLE schema3.Employees
   ADD PRIMARY KEY(ID)

   -- 7- Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
   CREATE TABLE schema3.Projects(
  ProjectID INT PRIMARY KEY,
  ProjectName VARCHAR,
  Employees_id INT
   CONSTRAINT Fk_id
  FOREIGN KEY (Employees_id) REFERENCES schema3.Employees(ID)
  )

  -- 8- Remove the foreign key relationship between "Employees" and "Projects."
   ALTER TABLE schema3.Projects
   DROP CONSTRAINT Fk_id

   -- 9- Add a unique constraint to the "Name" column in the "Employees" table.
    ALTER TABLE schema3.Employees
	ADD  UNIQUE(Name)

	-- 10- Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
   CREATE TABLE schema3.Customers(
     CustomerID INT,
	 FirstName VARCHAR,
	 LastName VARCHAR,
	 Email VARCHAR,
	 Status VARCHAR
   )

   -- 11- Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
       ALTER TABLE schema3.Customers
	   ADD  unique_fullname AS('FirstName'+' '+ 'LastName')

	    ALTER TABLE schema3.Customers
		ADD  UNIQUE(unique_fullname)

  -- 12- Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
    
  ALTER TABLE schema3.Customers
  ADD CONSTRAINT dfa_status
  DEFAULT 'Active' FOR Status

   -- 13- Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
    
	CREATE TABLE schema3.Orders(
	 OrderID INT,
	 CustomerID INT,
	 OrderDate DATETIME,
	 TotalAmount DECIMAL(10,2)
	)

	-- 14- Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
	ALTER TABLE schema3.Orders
    ADD	CONSTRAINT done CHECK(TotalAmount > 0)

	-- 15- Create a schema named "Sales" and move the "Orders" table into this schema.
      CREATE SCHEMA  Sales
	  ALTER SCHEMA Sales TRANSFER schema3.Orders

	  -- 16- Rename the "Orders" table to "SalesOrders.
	    EXEC sp_rename 'Sales.Orders', 'SalesOrders'
