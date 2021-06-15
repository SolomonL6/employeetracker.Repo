-- Drops the employeetracker_db if it exists currently --
DROP DATABASE IF EXISTS employeetracker_db;
-- Creates the "employeetracker_db" database --
CREATE DATABASE  employeetracker_db;

-- Makes it so all of the following code will affect employeetracker_db --
USE  employeetracker_db;

-- Creates the table "department" within employeetracker_db --
CREATE TABLE department (
  -- Creates a numeric column called "id" which will automatically increment its default value as we create new rows --
  id INT NOT NULL AUTO_INCREMENT,
  -- Makes a string column called "name" which cannot contain null --
  name VARCHAR(30) NOT NULL,
  
  -- Sets id as this table's primary key which means all data contained within it will be unique --
  PRIMARY KEY (id)
);

CREATE TABLE roles (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  roles_id INT NOT NULL,
  manager_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (roles_id) REFERENCES roles(id) ON DELETE CASCADE
  FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE CASCADE
);