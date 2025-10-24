create database zomato;
use zomato;
-- ----------
-- USER TABLE
-- ----------

Create table if not exists user(
user_id int primary key,
first_name varchar(255),
last_name varchar(255),
phone_number varchar(15),
email varchar(255)
);

-- insert dummy user values

insert into user values 
(1,'jhon','Doe','121-232-1334','jhon.doe@example.com'),
(2, 'Jane', 'Smith', '987-654-3210', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', '111-222-3333', 'alice.johnson@example.com'),
(4, 'Bob', 'Brown', '444-555-6666', 'bob.brown@example.com'),
(5, 'Gowtham', 'Kumar', '777-888-9999', 'gowtham.kumar@example.com');

-- select * from user;

-- -----
-- ORDERS TABLE
-- -----

create table if not exists orders(
order_id int Auto_increment Primary key,
user_id int,
item_id int,
quantity int not null,
delivery_address varchar(255) not null,
order_date timestamp default current_timestamp
);

-- inserts
INSERT INTO orders (user_id, item_id, quantity, delivery_address) VALUES
(1, 1, 2, '123 Main St'),
(2, 2, 1, '456 Oak Rd'),
(3, 3, 3, '789 Pine Ave');

-- select
/*
select 
u.user_id,
u.first_name,
u.last_name,
u.phone_number,
o.quantity,
o.delivery_address
from user u join orders o on u.user_id=o.user_id
order by quantity desc;
*/

--------------
-- ITEM TABLE 
--------------

create table if not exists items(
item_id int auto_increment primary key,
item_name varchar(255) not null,
price decimal(10,2) not null,
category_id int
);

-- inserts
INSERT INTO items (item_name, price, category_id) VALUES
('Biriyani', 150.00, 2),  -- Non-Vegetarian
('Paneer', 100.00, 1),    -- Vegetarian
('Butter Chicken', 200.00, 2);  -- Non-Vegetarian

-------------
-- ORDER ITEM TABLE
-------------

create table if not exists order_items(
order_item_id int auto_increment primary key,
order_id int,
item_id int,
quantity int not null,
price decimal(10,2),
foreign key (item_id) references items(item_id)
);

-- inserts 
INSERT INTO order_items (order_id, item_id, quantity, price) VALUES
(1, 1, 2, 150.00),
(2, 2, 1, 100.00),
(3, 3, 3, 200.00);

-- -------
-- CATEGORY TABLE 
-- -------
create table if not exists categories(
category_id int auto_increment primary key,
category_name varchar(255) not null
);

-- inserts
INSERT INTO categories (category_name) VALUES
('Vegetarian'),
('Non-Vegetarian'),
('Vegan');


-- create a select to display user details,quantity ,item,price,category

/*
select 
u.first_name,
u.last_name,
o.delivery_address,
o.quantity,
i.item_name,
c.category_name,
(o.quantity*Oi.price) as Amount
from user u join orders o on o.user_id=u.user_id
join items i on o.item_id = i.item_id
join categories c on c.category_id=i.category_id
join order_items Oi on Oi.order_id=o.order_id
order by Amount desc;
*/

-----------
-- PAYMENT TABLE
-----------
create table if not exists payments
(
payment_id int auto_increment primary key,
order_id int,
payment_method varchar(50),
payment_status varchar(50),
amount decimal(10,2),
paid_at timestamp default current_timestamp
);

-- inserts
INSERT INTO payments (order_id, payment_method, payment_status, amount) VALUES
(1, 'Credit Card', 'Paid', 300.00),
(2, 'Debit Card', 'Paid', 100.00),
(3, 'GPay', 'Pending', 600.00);



