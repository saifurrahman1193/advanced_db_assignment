CREATE OR REPLACE TYPE CustomerName AS OBJECT (
    firstName VARCHAR2(100),
    lastName VARCHAR2(100)
);
/
DESC CustomerName;
/

CREATE OR REPLACE TYPE Address AS OBJECT (
    street VARCHAR2(100),
    city VARCHAR2(100),
    zip VARCHAR2(10) 
);
/
DESC Address;
/

CREATE TABLE customers (
    name CustomerName,
    address Address,
    phoneNumber VARCHAR2(15),
    email VARCHAR2(100)
);
/

desc customers;
/

select c.name.firstName, c.name.lastName, c.address.street, c.address.city, c.address.zip, phoneNumber, email from customers c;
