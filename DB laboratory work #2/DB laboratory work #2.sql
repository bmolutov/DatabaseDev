/*
#1

What is the difference between DDL and DML?

DDL stands for Data Definition Language.
DDL statements are used to create database, schema, constraints, users, tables etc.

DML stands for Data Manipulation Language.
DML statements are used to insert, update or delete the records.

Examples of DDL commands:
create database database_name;
create table table_name (
    id integer primary key,
    name varchar (10),
    salary integer,
    constraint valid_salary check (salary > 0)
);

Examples of DML commands:
insert into table_name (id, name, salary) values (117, 'Steve', 1000);
insert into table_name (id, name, salary) values (118, 'Daniel', 1300);
update table_name set name = 'John' where name = 'Steve';
delete from table_name where name = 'John';
*/

/*
#2
*/

create database business;

create table customers (
    id integer primary key,
    full_name varchar (50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);

create table orders (
    code integer primary key,
    customer_id integer references customers (id),
    total_sum double precision not null,
    is_paid boolean not null
);

create table products (
    id varchar primary key,
    name varchar unique not null,
    description text,
    price double precision not null
);

create table order_items (
    order_code integer references orders (code),
    product_id varchar references products (id),
    quantity integer not null
);

drop table customers;
drop table orders;
drop table products;
drop table order_items;

/*
#3a
*/

create table students (
    id serial primary key,
    first_name varchar (50) not null,
    second_name varchar (50) not null,
    age integer check (age > 18),
    birth_year integer check (birth_year > 2000),
    birth_month integer check (birth_month >= 1 and birth_month <= 12),
    birth_day integer check (birth_day >= 1 and birth_day <= 31),
    gender varchar (20) not null,
    gpa double precision check (gpa > 3.0),
    personal_info text,
    house_info text,
    additional_info text
);

/*
#3b
*/

create table instructors (
    id integer primary key,
    first_name varchar (50),
    second_name varchar (50),
    work_experience text,
    having_remote_lessons boolean
);

create table instructors_speaking_languages (
    id integer references instructors (id),
    language_name varchar (20)
);

/*
#3c
*/

create table lesson_participants (
    id integer primary key,
    lesson_title text,
    instructor_id integer references instructors,
    room_number integer
);

create table students_attendance (
    id integer references lesson_participants (id),
    student_id integer
);

/*
#4
*/

insert into customers (id, full_name, timestamp, delivery_address) values (12, 'Bekzat Molutov', '2016-06-22 19:10:25-07', 'Almaty');
insert into customers (id, full_name, timestamp, delivery_address) values (13, 'Ikram Ismailov', '2012-06-22 19:10:25-07', 'Talgar');
insert into customers (id, full_name, timestamp, delivery_address) values (14, 'Daniar Absatov', '2019-06-22 19:10:25-07', 'Astana');

insert into products (id, name, description, price) values (31, 'A1', 'random stuff 1', 109);
insert into products (id, name, description, price) values (32, 'A2', 'random stuff 2', 202);
insert into products (id, name, description, price) values (37, 'A3', 'random stuff 3', 676);

insert into orders (code, customer_id, total_sum, is_paid) values (3823, 12, 109, True);
insert into orders (code, customer_id, total_sum, is_paid) values (3848, 12, 202, True);
insert into orders (code, customer_id, total_sum, is_paid) values (4823, 13, 202, False);

insert into order_items (order_code, product_id, quantity) values (3823, 31, 1);
insert into order_items (order_code, product_id, quantity) values (3848, 32, 1);
insert into order_items (order_code, product_id, quantity) values (4823, 32, 1);

select * from customers;
select * from products;
select * from orders;
select * from order_items;