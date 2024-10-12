INSERT INTO customers (name, address, phoneNumber, email) VALUES (
    new CustomerName('saifur', 'rahman'), 
    new Address('kathalbagan', 'dhaka', '1205'), 
    '01703188752', 
    'saifur.rahman1193@gmail.com'
);

INSERT INTO customers (name, address, phoneNumber, email) VALUES (
    new CustomerName('riaj', 'ahmed'), 
    new Address('rampura', 'dhaka', '1215'), 
    '01703188753', 
    'riaj.adhmed@gmail.com'
);

INSERT INTO customers (name, address, phoneNumber, email) VALUES (
    new CustomerName('rakib', 'ahmed'), 
    new Address('tongi', 'dhaka', '1225'), 
    '01703188754', 
    'rakib.adhmed@gmail.com'
);

INSERT INTO customers (name, address, phoneNumber, email) VALUES (
    new CustomerName('rahmatullah', 'ahmed'), 
    new Address('tongi', 'dhaka', '1225'), 
    '01703188755', 
    'rahmatullah.adhmed@gmail.com'
);

INSERT INTO customers (name, address, phoneNumber, email) VALUES (
    new CustomerName('tonmoy', 'ahmed'), 
    new Address('gazipur', 'dhaka', '1325'), 
    '01703188755', 
    'tonmoy.adhmed@gmail.com'
);

select c.name.firstName, c.address.city, phoneNumber, email from customers c;