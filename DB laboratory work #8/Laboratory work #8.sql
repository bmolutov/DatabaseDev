-- Laboratory work #8
create database test;


-- 1. Create a function that:


-- a. Increments given values by 1 and returns it.
create or replace function increment (n int)
returns int
language plpgsql
as
    $$
        declare
        begin
            return n + 1;
        end;
    $$;
-- checking:
select increment (
    n := 5
);
drop function increment;


-- b. Returns sum of 2 numbers.
create or replace function sum (a int, b int)
returns int
language plpgsql
as
    $$
        declare
        begin
            return a + b;
        end;
    $$;
-- checking:
select sum (
    a := 2,
    b := 3
);
drop function sum;


-- c. Returns true or false if numbers are divisible by 2.
create or replace function isEven (n int)
returns boolean
language plpgsql
as
    $$
        declare
            ans boolean;
        begin
            if n % 2 = 0 then
                ans := true;
            else
                ans := false;
            end if;
            return ans;
        end
    $$;
-- checking:
select isEven (
    n := 4
);
drop function isEven;


-- d. Checks some password for validity.
-- my function checks if the length of some password is less than 5
create or replace function checker (password varchar)
returns void
language plpgsql
as
    $$
        declare
        begin
            if length (password) < 5 then
                raise notice 'this password is too short!';
            else
                raise notice 'this password is long enough!';
            end if;
        end;
    $$;
-- checking:
select checker (
    password := 'good_password'
);
drop function checker;


-- e. Returns two outputs, but has one input.
-- if have used special data type names "record"
-- logic: my function returns the previous and next numbers
-- of the given integer
create or replace function prevAndNext (n int)
returns record
language plpgsql
as
    $$
        declare
        begin
            return (n - 1, n + 1);
        end;
    $$;
-- checking:
select prevAndNext (
    n := 2
);
drop function prevAndNext;


-- 2. Create a trigger that:

-- a. Return timestamp of the occurred action within the database.
-- logic: it returns a timestamp if any password in the table is changed
-- creating sample tables:
create table passwords_base (
    id serial primary key,
    password varchar (50) not null
);
create table events (
    id serial primary key,
    password_id integer not null,
    password varchar (50) not null,
    changed_on timestamp (6) not null
);
-- creating a function for the trigger
-- setting the timezone for Almaty region
set timezone = +6;

create or replace function log_password_changes ()
returns trigger
language plpgsql
as
    $$
        begin
            if new.password <> old.password then
                insert into events (password_id, password, changed_on)
                    values (old.id, old.password, now ());
            end if;
            return new;
        end;
    $$;
-- creating the trigger
create trigger password_changes
    before update
    on passwords_base
    for each row
    execute procedure log_password_changes();
-- inserting some data:
insert into passwords_base (password) values ('12345');
insert into passwords_base (password) values ('qwerty');
insert into passwords_base (password) values ('password');
insert into passwords_base (password) values ('test');
-- checking:
select * from passwords_base;

-- let's update some passwords:
update passwords_base
set password = 'test1'
where id = 4;

update passwords_base
set password = '123456'
where id = 1;

select * from events;


-- b. Computes the age of a person when persons’ date of birth is inserted.
-- creating some sample tables:
create table person (
    id serial primary key,
    birth_year integer not null,
    birth_month integer not null,
    birth_day integer not null
);
create table age (
    person_id integer,
    age integer
);
-- creating a function for the trigger
create or replace function log_inserting ()
returns trigger
language plpgsql
as
    $$
        begin
            insert into age (person_id, age)
                values (new.id, date_part ('year', now ()) - new.birth_year);
            return new;
        end;
    $$;
-- creating the trigger
create trigger birth_date_inserts
    after insert
    on person
    for each row
    execute procedure log_inserting();
-- checking:
insert into person (birth_year, birth_month, birth_day) values (2002, 5, 13);
insert into person (birth_year, birth_month, birth_day) values (2003, 3, 12);
insert into person (birth_year, birth_month, birth_day) values (2005, 11, 25);

select * from age;


-- c. Adds 12% tax on the price of the inserted item.
-- creating the sample table
create table purchases (
    id serial primary key,
    final_price numeric (10, 2)
);
-- creating a function for the trigger
create or replace function log_converter ()
returns trigger
language plpgsql
as
    $$
        begin
            update purchases
            set final_price = final_price + final_price * 12 / 100
            where id = new.id;
            return new;
        end;
    $$;
-- creating the trigger
create trigger final_cost
    after insert
    on purchases
    for each row
    execute procedure log_converter ();
-- checking:
insert into purchases (final_price) values (1000.0);
insert into purchases (final_price) values (2000.0);

select * from purchases;


-- d. Prevents deletion of any row from only one table
-- create a sample table
create table sample (
    id integer,
    data varchar (50) not null
);
-- creating a function for the trigger
create or replace function log_stop ()
returns trigger
language plpgsql
as
    $$
        begin
            old.status := 1; -- This does the fake deletion
            return null;
        end;
    $$;
-- creating the trigger
create trigger stop_deletion
    before delete
    on sample
    for each row
    execute procedure log_stop ();
-- checking:
insert into sample (id, data) values (1, 'zero');
delete from sample where id = 1; -- it does not work, so everything is OK
select * from sample;


-- e. Launches functions 1.d and 1.e.
-- the trigger will react if some data was inserting into table "sample"
-- creating a function for the trigger
create or replace function log_launcher ()
returns trigger
language plpgsql
as
    $$
        begin
            perform checker (
                password := 'good_password'
            );
--             perform prevAndNext (
--                 n := 2
--             );
            return new;
        end;
    $$;
-- creating the trigger
create trigger launcher
    after insert
    on sample
    for each row
    execute procedure log_launcher ();
-- checking:
insert into sample (id, data) values (2, 'zero');


-- 3.What is the difference between procedure and function?
/*
In Postgres, the main functional difference between a function
and a stored procedure is that a function returns a result, whereas
a stored procedure does not. This is because the intention behind a stored
procedure is to perform some sort of activity and then finish,
which would then return control to the caller.
*/


-- 4.Create procedures that:

-- a) Increases salary by 10% for every 2 years of work experience and provides
-- 10% discount and after 5 years adds 1% to the discount.
-- preparing sample table
create table employee (
    id integer,
    name varchar (50),
    date_of_birth date,
    age integer,
    salary integer,
    work_experience integer,
    discount integer
);
insert into employee (id, name, date_of_birth, age, salary, work_experience, discount)
    values (1, 'Bekzat', '2002-05-13', 19, 1000, 7, 5);
delete from employee where id = 1;

create or replace function raise1 ()
returns void
language plpgsql
as
    $$
        declare
            age int := (select age from employee where id = 1);
            work_experience int := (select work_experience from employee where id = 1);
        begin
            for counter in 1..age loop
                if counter % 5 = 0 then
                    update employee
                    set discount = discount + 1
                    where id = 1;
                end if;
            end loop;
            for counter in 1..work_experience loop
                if counter % 2 = 0 then
                    update employee
                    set salary = salary + salary * 10 / 100
                    where id = 1;
                    update employee
                    set discount = discount + 10
                    where id = 1;
                end if;
            end loop;
        end;
    $$;

select * from employee;
select raise1 ();
select * from employee;


-- b) After reaching 40 years, increase salary by 15%. If work experience is more
-- than 8 years, increase salary for 15% of the already increased value for work
-- experience and provide a constant 20% discount.

create or replace function raise2 ()
returns void
language plpgsql
as
    $$
        declare
            age int := (select age from employee where id = 1);
            work_experience int := (select work_experience from employee where id = 1);
        begin
            if age >= 40 then
                update employee
                set salary = salary + salary * 15 / 100
                where id = 1;
            end if;
            if work_experience > 8 then
                update employee
                set salary = salary + salary * 15 / 100
                where id = 1;
            end if;
            if work_experience > 8 then
                update employee
                set discount = discount + 20
                where id = 1;
            end if;
        end;
    $$;

select * from employee;
select raise2 ();
select * from employee;


-- 5-th task is SKIPPED!
