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
-- ===============================Orders===================================
CREATE OR REPLACE TYPE FoodItem_O AS OBJECT(
    id NUMBER,
    name VARCHAR2(100),
    price NUMBER(8,2)
);
/

CREATE OR REPLACE TYPE DeliveryPersonnel_O AS OBJECT(
    id NUMBER,
    name CustomerName_O,
    phoneNumber VARCHAR2(15)
);
/







CREATE OR REPLACE TYPE Orders_O AS OBJECT(
    id NUMBER,
    orderDate DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id));
    foodItems FoodItemList_T,   -- List of food items (to be defined)
    deliveryPersonnel REF DeliveryPersonnel_O -- Delivery personnel relationship
);
/
