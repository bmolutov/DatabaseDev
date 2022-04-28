create database online_store;
drop database online_store;

create table customer (
    id serial primary key,
    name varchar (255),
    phone varchar (50),
    email varchar (255),
    is_premium boolean
);

create table supplier (
    id serial primary key,
    name varchar (255),
    country varchar (50)
);

create table product (
    id serial primary key,
    supplier_id integer references supplier (id),
    name varchar (255),
    brand_name varchar (50),
    price integer,
    UPC_code varchar (50),
    category varchar (50),
    subcategory varchar (50),
    description text
);

create table product_photo (
    id serial primary key,
    product_id integer references product (id),
    URL varchar (255),
    format varchar (50)
);

create table shop_cart (
    id serial primary key,
    customer_id integer references customer (id)
);

create table shop_cart_details (
    shop_cart_id integer references shop_cart (id),
    product_id integer references product (id)
);


-- adding suppliers:
insert into supplier (name, country) values ('Samsung', 'South Korea');                 -- 1
insert into supplier (name, country) values ('Sony', 'Japan');                          -- 2
insert into supplier (name, country) values ('Apple', 'United States of America');      -- 3
insert into supplier (name, country) values ('IBM', 'United States of America');        -- 4
insert into supplier (name, country) values ('Bosch', 'Germany');                       -- 5
insert into supplier (name, country) values ('Huawei', 'China');                        -- 6
insert into supplier (name, country) values ('Xiaomi', 'China');                        -- 7
insert into supplier (name, country) values ('LG Group', 'South Korea');                -- 8
insert into supplier (name, country) values ('Haier', 'China');                         -- 9
insert into supplier (name, country) values ('Midea', 'China');                         -- 10
insert into supplier (name, country) values ('Nokia', 'Finland');                       -- 11
insert into supplier (name, country) values ('Artel', 'Uzbekistan');                    -- 12
insert into supplier (name, country) values ('Redmond', 'Russia');                      -- 13
insert into supplier (name, country) values ('Panasonic', 'Japan');                     -- 14
insert into supplier (name, country) values ('Philips', 'Netherlands');                 -- 15


-- adding products with photo
insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Smartphone', 'Samsung', 100000, 'xxxx', 'phones and gadgets', 'smartphones', 'good smartphone'); -- 1
insert into product_photo (product_id, URL, format) values (1, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Smartwatch', 'Samsung', 10000, 'xxxx', 'phones and gadgets', 'smartwatches', 'good smartwatch'); -- 2
insert into product_photo (product_id, URL, format) values (2, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Headphones', 'Samsung', 50000, 'xxxx', 'phones and gadgets', 'gadgets', 'good headphones'); -- 3
insert into product_photo (product_id, URL, format) values (3, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Voice assistant', 'Samsung', 200000, 'xxxx', 'phones and gadgets', 'voice assistants', 'good voice assistant'); -- 4
insert into product_photo (product_id, URL, format) values (4, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Electric kettle', 'Samsung', 150000, 'xxxx', 'appliances', 'kitchen appliances', 'good electric kettle'); -- 5
insert into product_photo (product_id, URL, format) values (5, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Fridge', 'Samsung', 350000, 'xxxx', 'appliances', 'kitchen appliances', 'good fridge'); -- 6
insert into product_photo (product_id, URL, format) values (6, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Vacuum cleaner', 'Samsung', 250000, 'xxxx', 'appliances', 'home appliances', 'good vacuum cleaner'); -- 7
insert into product_photo (product_id, URL, format) values (7, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Laptop', 'Samsung', 200000, 'xxxx', 'computers', 'laptops', 'good laptop'); -- 8
insert into product_photo (product_id, URL, format) values (8, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Washing machine', 'Samsung', 150000, 'xxxx', 'appliances', 'home appliances', 'good washing machine'); -- 9
insert into product_photo (product_id, URL, format) values (9, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (1, 'Video camera', 'Samsung', 250000, 'xxxx', 'video and audio', 'video', 'good video camera'); -- 10
insert into product_photo (product_id, URL, format) values (10, 'xxxx', 'jpeg');
-- separator
insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Smartphone', 'Sony', 100030, 'xxxx', 'phones and gadgets', 'smartphones', 'good smartphone'); -- 11
insert into product_photo (product_id, URL, format) values (11, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Smartwatch', 'Sony', 14000, 'xxxx', 'phones and gadgets', 'smartwatches', 'good smartwatch'); -- 12
insert into product_photo (product_id, URL, format) values (12, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Headphones', 'Sony', 50000, 'xxxx', 'phones and gadgets', 'gadgets', 'good headphones'); -- 13
insert into product_photo (product_id, URL, format) values (13, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Voice assistant', 'Sony', 200000, 'xxxx', 'phones and gadgets', 'voice assistants', 'good voice assistant'); -- 14
insert into product_photo (product_id, URL, format) values (14, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Electric kettle', 'Sony', 154000, 'xxxx', 'appliances', 'kitchen appliances', 'good electric kettle'); -- 15
insert into product_photo (product_id, URL, format) values (15, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Fridge', 'Sony', 350400, 'xxxx', 'appliances', 'kitchen appliances', 'good fridge'); -- 16
insert into product_photo (product_id, URL, format) values (16, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Vacuum cleaner', 'Sony', 250000, 'xxxx', 'appliances', 'home appliances', 'good vacuum cleaner'); -- 17
insert into product_photo (product_id, URL, format) values (17, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Laptop', 'Sony', 200020, 'xxxx', 'computers', 'laptops', 'good laptop'); -- 18
insert into product_photo (product_id, URL, format) values (18, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Washing machine', 'Sony', 150300, 'xxxx', 'appliances', 'home appliances', 'good washing machine'); -- 19
insert into product_photo (product_id, URL, format) values (19, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (2, 'Video camera', 'Sony', 250300, 'xxxx', 'video and audio', 'video', 'good video camera'); -- 20
insert into product_photo (product_id, URL, format) values (20, 'xxxx', 'jpeg');
-- separator
insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Smartphone', 'Apple', 190030, 'xxxx', 'phones and gadgets', 'smartphones', 'good smartphone'); -- 21
insert into product_photo (product_id, URL, format) values (21, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Smartwatch', 'Apple', 19000, 'xxxx', 'phones and gadgets', 'smartwatches', 'good smartwatch'); -- 22
insert into product_photo (product_id, URL, format) values (22, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Headphones', 'Apple', 90000, 'xxxx', 'phones and gadgets', 'gadgets', 'good headphones'); -- 23
insert into product_photo (product_id, URL, format) values (23, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Voice assistant', 'Apple', 900000, 'xxxx', 'phones and gadgets', 'voice assistants', 'good voice assistant'); -- 24
insert into product_photo (product_id, URL, format) values (24, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Electric kettle', 'Apple', 154000, 'xxxx', 'appliances', 'kitchen appliances', 'good electric kettle'); -- 25
insert into product_photo (product_id, URL, format) values (25, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Fridge', 'Apple', 350400, 'xxxx', 'appliances', 'kitchen appliances', 'good fridge'); -- 26
insert into product_photo (product_id, URL, format) values (26, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Vacuum cleaner', 'Apple', 950000, 'xxxx', 'appliances', 'home appliances', 'good vacuum cleaner'); -- 27
insert into product_photo (product_id, URL, format) values (27, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Laptop', 'Apple', 900020, 'xxxx', 'computers', 'laptops', 'good laptop'); -- 28
insert into product_photo (product_id, URL, format) values (28, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Washing machine', 'Apple', 950300, 'xxxx', 'appliances', 'home appliances', 'good washing machine'); -- 29
insert into product_photo (product_id, URL, format) values (29, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (3, 'Video camera', 'Apple', 250300, 'xxxx', 'video and audio', 'video', 'good video camera'); -- 30
insert into product_photo (product_id, URL, format) values (30, 'xxxx', 'jpeg');
-- separator
insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (4, 'Laptop', 'IBM', 400020, 'xxxx', 'computers', 'laptops', 'good laptop'); -- 31
insert into product_photo (product_id, URL, format) values (31, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (5, 'Washing machine', 'Bosch', 550300, 'xxxx', 'appliances', 'home appliances', 'good washing machine'); -- 32
insert into product_photo (product_id, URL, format) values (32, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (6, 'Smartphone', 'Huawei', 200000, 'xxxx', 'phones and gadgets', 'smartphones', 'good smartphone'); -- 33
insert into product_photo (product_id, URL, format) values (33, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (7, 'Smartphone', 'Xiaomi', 100000, 'xxxx', 'phones and gadgets', 'smartphones', 'good smartphone'); -- 33
insert into product_photo (product_id, URL, format) values (33, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (8, 'Washing machine', 'LG Group', 450300, 'xxxx', 'appliances', 'home appliances', 'good washing machine'); -- 34
insert into product_photo (product_id, URL, format) values (34, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (9, 'Fridge', 'Haier', 150400, 'xxxx', 'appliances', 'kitchen appliances', 'good fridge'); -- 35
insert into product_photo (product_id, URL, format) values (35, 'xxxx', 'jpeg');

insert into product (supplier_id, name, brand_name, price, UPC_code, category, subcategory, description)
    values (10, 'Fridge', 'Midea', 152400, 'xxxx', 'appliances', 'kitchen appliances', 'good fridge'); -- 36
insert into product_photo (product_id, URL, format) values (36, 'xxxx', 'jpeg');


-- checking point:
select * from product;
select * from product_photo;


-- adding customers:
insert into customer (name, phone, email, is_premium) values ('Bekzat', '+7 777 77 77 777', 'mail1@mail.kz', true);
insert into customer (name, phone, email, is_premium) values ('Nurbol', '+7 777 77 77 776', 'mail2@mail.kz', true);
insert into customer (name, phone, email, is_premium) values ('Nurlan', '+7 777 77 77 775', 'mail3@mail.kz', false);
insert into customer (name, phone, email, is_premium) values ('Bekzhan', '+7 777 77 77 774', 'mail4@mail.kz', false);
insert into customer (name, phone, email, is_premium) values ('Zhandos', '+7 777 77 77 773', 'mail5@mail.kz', false);
insert into customer (name, phone, email, is_premium) values ('Alexander', '+7 777 77 77 772', 'mail6@mail.kz', true);
insert into customer (name, phone, email, is_premium) values ('Kristina', '+7 777 77 77 771', 'mail7@mail.kz', true);

-- adding shop_cart:
insert into shop_cart (customer_id) values (1);
insert into shop_cart (customer_id) values (2);
insert into shop_cart (customer_id) values (3);
insert into shop_cart (customer_id) values (4);
insert into shop_cart (customer_id) values (5);
insert into shop_cart (customer_id) values (6);
insert into shop_cart (customer_id) values (7);


-- adding shop_car_details:
insert into shop_cart_details (shop_cart_id, product_id) values (1, 10);
insert into shop_cart_details (shop_cart_id, product_id) values (1, 11);
insert into shop_cart_details (shop_cart_id, product_id) values (1, 12);
insert into shop_cart_details (shop_cart_id, product_id) values (2, 13);
insert into shop_cart_details (shop_cart_id, product_id) values (2, 14);
insert into shop_cart_details (shop_cart_id, product_id) values (2, 15);
insert into shop_cart_details (shop_cart_id, product_id) values (3, 16);
insert into shop_cart_details (shop_cart_id, product_id) values (3, 17);
insert into shop_cart_details (shop_cart_id, product_id) values (3, 18);
insert into shop_cart_details (shop_cart_id, product_id) values (4, 19);
insert into shop_cart_details (shop_cart_id, product_id) values (4, 20);
insert into shop_cart_details (shop_cart_id, product_id) values (4, 21);
insert into shop_cart_details (shop_cart_id, product_id) values (5, 22);
insert into shop_cart_details (shop_cart_id, product_id) values (6, 23);
insert into shop_cart_details (shop_cart_id, product_id) values (7, 24);


-- checking:
select * from customer;
select * from shop_cart;
select * from shop_cart_details;