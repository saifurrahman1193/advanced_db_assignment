1. A query to retrieve all orders placed by a specific customer.
SELECT 
    o.order_id, 
    o.order_date, 
    d.name AS delivery_personnel_name, 
    d.phone_number
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    delivery_personnel d ON o.delivery_personnel_id = d.delivery_personnel_id
WHERE 
    c.customer_id = 1;


2. A query to list all food items offered by a specific restaurant.
SELECT 
    f.food_item_id, 
    f.name AS food_item_name, 
    f.price, 
    r.name AS restaurant_name, 
    r.address.street AS street, 
    r.address.city AS city, 
    r.address.zip AS zip
FROM 
    food_items f
JOIN 
    restaurants r ON f.restaurant_id = r.restaurant_id
WHERE 
    r.restaurant_id = 1; 


3. A query to show details of combo offers available at a restaurant.
SELECT 
    co.offer_id, 
    co.discount_percentage, 
    co.offer_description, 
    r.name AS restaurant_name
FROM 
    combo_offers co
JOIN 
    restaurants r ON co.restaurant_id = r.restaurant_id
WHERE 
    r.restaurant_id = 1;
