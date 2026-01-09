-- DDL(DATA DEFINATION LANGUAGE)
USE salesdb;
CREATE TABLE persons(
id INT NOT NULL,
person_name VARCHAR(50),
birth_date DATE,
phone VARCHAR(50) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY 
(id)
);

-- add a new column email...
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;
 
 -- REMOVING COULMN 
 ALTER TABLE  persons
 DROP COLUMN phone;
 
 -- drop your table 
 DROP TABLE persons;