-- ===============================Customers===================================
CREATE OR REPLACE TYPE CustomerName_O AS OBJECT (
    firstName VARCHAR2(100),
    lastName VARCHAR2(100)
);
/
DESC CustomerName_O;
/
CREATE OR REPLACE TYPE Address_O AS OBJECT (
    street VARCHAR2(100),
    city VARCHAR2(100),
    zip VARCHAR2(10) 
);
/
DESC Address_O;
/
CREATE OR REPLACE TYPE Customers_O AS OBJECT(
    customer_id NUMBER ,
    name CustomerName_O,
    address Address_O,
    phoneNumber VARCHAR2(15),
    email VARCHAR2(100)
);
/
DESC Customers_O;
/
CREATE TABLE customers OF Customers_O  (
    CONSTRAINT pk_customers PRIMARY KEY (customer_id)
);
/
desc customers;
/
-- ===============================Restaurants===================================
CREATE OR REPLACE TYPE Restaurants_O AS OBJECT(
    restaurant_id NUMBER ,
    name VARCHAR2(100),
    address Address_O,
    rating NUMBER(2,1) 
);
/
DESC Restaurants_O;
/

CREATE TABLE restaurants OF Restaurants_O  (
    CONSTRAINT pk_restaurants PRIMARY KEY (restaurant_id)
);
/
desc restaurants;
/
-- ===============================Food Items===================================
CREATE OR REPLACE TYPE FoodItems_O AS OBJECT(
    food_item_id NUMBER ,
    name VARCHAR2(100),
    price NUMBER(8, 2),
    restaurant_id NUMBER    
);
/
DESC FoodItems_O;
/
CREATE TABLE food_items OF FoodItems_O (
    CONSTRAINT pk_food_items PRIMARY KEY (food_item_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
/
desc food_items;
/
-- ===============================Delivery Personnel===================================
CREATE OR REPLACE TYPE DeliveryPersonnel_O AS OBJECT (
    delivery_personnel_id NUMBER,
    name VARCHAR2(100),
    phone_number VARCHAR2(15)
);
/
DESC DeliveryPersonnel_O;
/
CREATE TABLE delivery_personnel OF DeliveryPersonnel_O (
    CONSTRAINT pk_delivery_personnel PRIMARY KEY (delivery_personnel_id)
);
/
desc delivery_personnel;
/
-- ===============================Combo Offers===================================
CREATE OR REPLACE TYPE ComboOffers_O AS OBJECT (
    offer_id NUMBER,
    discount_percentage NUMBER(5, 2),
    offer_description VARCHAR2(255),
    restaurant_id NUMBER
);
/
DESC ComboOffers_O;
/
CREATE TABLE combo_offers OF ComboOffers_O (
    CONSTRAINT pk_combo_offers PRIMARY KEY (offer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
/
DESC combo_offers;
/

-- ===============================Orders===================================
CREATE OR REPLACE TYPE Orders_O AS OBJECT(
    order_id NUMBER,
    order_date DATE,
    customer_id NUMBER,
    delivery_personnel_id NUMBER
);
/
DESC Orders_O;
/

CREATE TABLE orders OF Orders_O (
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (delivery_personnel_id) REFERENCES delivery_personnel(delivery_personnel_id)
);
/
DESC orders;
/

-- ===============================Order-Food Items Mapping===================================
CREATE TABLE order_food_items (
    order_id NUMBER,
    food_item_id NUMBER,
    PRIMARY KEY (order_id, food_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (food_item_id) REFERENCES food_items(food_item_id)
);
/
DESC order_food_items;
/

-- ===============================Payments===================================
CREATE OR REPLACE TYPE Payments_O AS OBJECT(
    payment_id NUMBER,
    payment_method VARCHAR2(50),
    payment_amount NUMBER(10, 2),
    order_id NUMBER
);
/
DESC Payments_O;
/

CREATE TABLE payments OF Payments_O (
    CONSTRAINT pk_payments PRIMARY KEY (payment_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
/
DESC payments;
/
