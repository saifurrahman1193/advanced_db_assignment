-- ===============================Customers===================================
INSERT INTO customers VALUES (1,new CustomerName_O('saifur', 'rahman'), new Address_O('kathalbagan', 'dhaka', '1205'),'01703188752','saifur.rahman1193@gmail.com');
INSERT INTO customers VALUES (2,new CustomerName_O('riaj', 'ahmed'), new Address_O('rampura', 'dhaka', '1215'),'01703188753','riaj.adhmed@gmail.com');
INSERT INTO customers VALUES (3,new CustomerName_O('rakib', 'ahmed'), new Address_O('tongi', 'dhaka', '1225'),'01703188754','rakib.adhmed@gmail.com');
INSERT INTO customers VALUES (4,new CustomerName_O('rahmatullah', 'ahmed'), new Address_O('tongi', 'dhaka', '1225'),'01703188755','rahmatullah.adhmed@gmail.com');
INSERT INTO customers VALUES (5,new CustomerName_O('tonmoy', 'ahmed'), new Address_O('gazipur', 'dhaka', '1325'),'01703188755','tonmoy.adhmed@gmail.com');
select customer_id, concat(t.name.firstName, t.name.lastName) name, t.address.street street, t.address.city city, t.address.zip zip, phoneNumber, email from customers t;
-- ===============================Restaurants===================================
INSERT INTO restaurants VALUES (1,'Chillox', new Address_O('panthapath', 'dhaka', '1205'),4.5);
INSERT INTO restaurants VALUES (2,'Burger king',new Address_O('panthapath', 'dhaka', '1205'),4.8);
INSERT INTO restaurants VALUES (3,'Burger express',new Address_O('panthapath', 'dhaka', '1205'),4.2);
INSERT INTO restaurants VALUES (4,'Pizza Express',new Address_O('panthapath', 'dhaka', '1205'),4.7);
INSERT INTO restaurants VALUES (5,'Star Khabab',new Address_O('panthapath', 'dhaka', '1205'),4.9);
select restaurant_id, name, t.address.street street, t.address.city city, t.address.zip zip, rating from restaurants t;
-- ===============================Food Items===================================
INSERT INTO food_items VALUES (1,'Pizza', 9.99, 1);
INSERT INTO food_items VALUES (2,'Cashew Nut Salad', 10.99, 1);
INSERT INTO food_items VALUES (3,'Kacchi',7.49,1);
INSERT INTO food_items VALUES (4,'Biriyani',12.99,2);
INSERT INTO food_items VALUES (5,'Jorda',12.99,2);
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
-- ===============================Delivery Personnel===================================
INSERT INTO delivery_personnel VALUES (1,'salam','01703188752');
INSERT INTO delivery_personnel VALUES (2,'kashem','01703188753');
INSERT INTO delivery_personnel VALUES (3,'khairul','01703188754');
INSERT INTO delivery_personnel VALUES (4,'kalam','01703188755');
INSERT INTO delivery_personnel VALUES (5,'arman','01703188756');
SELECT * FROM delivery_personnel;
-- ===============================Combo Offers===================================
INSERT INTO combo_offers VALUES (1, 15.00, '15% off on all pizzas', 1 );
INSERT INTO combo_offers VALUES (2, 20.00, '20% off on combo meals', 1 );
INSERT INTO combo_offers VALUES (3, 5.00, '5% off on weekend specials', 1 );
INSERT INTO combo_offers VALUES (4, 25.00, '25% off on family meals', 2 );
INSERT INTO combo_offers VALUES (5, 20.00, '20% off on lunch meals', 2 );

SELECT 
    co.offer_id,
    co.discount_percentage,
    co.offer_description,
    r.name AS restaurant_name
FROM 
    combo_offers co
JOIN 
    restaurants r ON co.restaurant_id = r.restaurant_id;
-- ===============================Orders===================================
INSERT INTO orders VALUES (1, '01-oct-2024', 1, 1);
INSERT INTO orders VALUES (2, '02-oct-2024', 2, 2);
INSERT INTO orders VALUES (3, '03-oct-2024', 3, 3);
INSERT INTO orders VALUES (4, '04-oct-2024', 4, 4);
INSERT INTO orders VALUES (5, '05-oct-2024', 5, 5);
SELECT * FROM orders;
-- ===============================Order-Food Items Mapping===================================
INSERT INTO order_food_items VALUES (1, 1); 
INSERT INTO order_food_items VALUES (1, 2);
INSERT INTO order_food_items VALUES (2, 3);
INSERT INTO order_food_items VALUES (3, 4);  
INSERT INTO order_food_items VALUES (3, 5); 
INSERT INTO order_food_items VALUES (4, 1); 
INSERT INTO order_food_items VALUES (5, 4); 

SELECT 
    o.order_id,
    o.order_date,
    f.name AS food_item_name,
    f.price,
    c.name.firstName AS customer_first_name,
    c.name.lastName AS customer_last_name,
    d.name AS delivery_personnel_name
FROM 
    orders o
JOIN 
    order_food_items ofi ON o.order_id = ofi.order_id
JOIN 
    food_items f ON ofi.food_item_id = f.food_item_id
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    delivery_personnel d ON o.delivery_personnel_id = d.delivery_personnel_id;
-- ===============================Payments===================================
INSERT INTO payments  VALUES (1,'Credit Card', 19.98, 1);
INSERT INTO payments  VALUES (2,'Cash', 7.49, 2);
INSERT INTO payments  VALUES (3,'Credit Card', 20.48, 3);
INSERT INTO payments  VALUES (4,'Cash', 9.99, 4);
INSERT INTO payments  VALUES (5,'Credit Card', 12.99, 5);

SELECT 
    p.payment_id,
    p.payment_method,
    p.payment_amount,
    o.order_id,
    o.order_date
FROM 
    payments p
JOIN 
    orders o ON p.order_id = o.order_id;
