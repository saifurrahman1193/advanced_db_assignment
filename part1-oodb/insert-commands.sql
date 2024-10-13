-- ===============================Customers===================================
INSERT INTO customers (customer_id, name, address, phoneNumber, email) VALUES (
    1, 
    new CustomerName_O('saifur', 'rahman'), 
    new Address_O('kathalbagan', 'dhaka', '1205'), 
    '01703188752', 
    'saifur.rahman1193@gmail.com'
);
INSERT INTO customers (customer_id, name, address, phoneNumber, email) VALUES (
    2, 
    new CustomerName_O('riaj', 'ahmed'), 
    new Address_O('rampura', 'dhaka', '1215'), 
    '01703188753', 
    'riaj.adhmed@gmail.com'
);
INSERT INTO customers (customer_id, name, address, phoneNumber, email) VALUES (
    3, 
    new CustomerName_O('rakib', 'ahmed'), 
    new Address_O('tongi', 'dhaka', '1225'), 
    '01703188754', 
    'rakib.adhmed@gmail.com'
);
INSERT INTO customers (customer_id, name, address, phoneNumber, email) VALUES (
    4, 
    new CustomerName_O('rahmatullah', 'ahmed'), 
    new Address_O('tongi', 'dhaka', '1225'), 
    '01703188755', 
    'rahmatullah.adhmed@gmail.com'
);
INSERT INTO customers (customer_id, name, address, phoneNumber, email) VALUES (
    5, 
    new CustomerName_O('tonmoy', 'ahmed'), 
    new Address_O('gazipur', 'dhaka', '1325'), 
    '01703188755', 
    'tonmoy.adhmed@gmail.com'
);
select customer_id, concat(t.name.firstName, t.name.lastName) name, t.address.street street, t.address.city city, t.address.zip zip, phoneNumber, email from customers t;
-- ===============================Restaurants===================================
INSERT INTO restaurants (restaurant_id, name, address, rating) VALUES (
    1,
    'Chillox', 
    new Address_O('panthapath', 'dhaka', '1205'), 
    4.5
);
INSERT INTO restaurants (restaurant_id, name, address, rating) VALUES (
    2,
    'Burger king', 
    new Address_O('panthapath', 'dhaka', '1205'), 
    4.8
);
INSERT INTO restaurants (restaurant_id, name, address, rating) VALUES (
    3,
    'Burger express', 
    new Address_O('panthapath', 'dhaka', '1205'), 
    4.2
);
INSERT INTO restaurants (restaurant_id, name, address, rating) VALUES (
    4,
    'Pizza Express', 
    new Address_O('panthapath', 'dhaka', '1205'), 
    4.7
);
INSERT INTO restaurants (restaurant_id, name, address, rating) VALUES (
    5,
    'Star Khabab', 
    new Address_O('panthapath', 'dhaka', '1205'), 
    4.9
);
select restaurant_id, name, t.address.street street, t.address.city city, t.address.zip zip, rating from restaurants t;
-- ===============================Food Items===================================
INSERT INTO food_items (food_item_id, name, price, restaurant_id) VALUES (
    1, 
    'Pizza', 
    9.99, 
    1
);
INSERT INTO food_items (food_item_id, name, price, restaurant_id) VALUES (
    2, 
    'Cashew Nut Salad', 
    10.99, 
    1
);
INSERT INTO food_items (food_item_id, name, price, restaurant_id) VALUES (
    3, 
    'Kacchi', 
    7.49, 
    1
);
INSERT INTO food_items (food_item_id, name, price, restaurant_id) VALUES (
    4, 
    'Biriyani', 
    12.99, 
    2
);
INSERT INTO food_items (food_item_id, name, price, restaurant_id) VALUES (
    5, 
    'Jorda', 
    12.99, 
    2
);
SELECT 
    f.food_item_id,
    f.name AS food_item_name,
    f.price,
    r.name AS restaurant_name,
    r.address.street AS street,
    r.address.city AS city,
    r.address.zip AS zip,
    r.rating
FROM 
    food_items f
LEFT JOIN restaurants r ON r.restaurant_id = f.restaurant_id;


