-- Laboratory work # 6

/*
    1. Write a SQL query using Joins:
*/

CREATE DATABASE lab6;
SELECT * FROM dealer;
SELECT * FROM client;
SELECT * FROM sell;

-- A. combine each row of dealer table with each row of client table
-- > I am going to use Cartesian Join or Cross Join to do this operation
SELECT * FROM dealer CROSS JOIN client;
-- another way to do this:
SELECT * FROM dealer, client;

-- B. find all dealers along with client name, city, grade, sell number, date, and amount
-- > It is not clear grade == priority of client ???
SELECT
       dealer.name, client.name, client.city, client.priority, sell.id, sell.date, sell.amount
FROM dealer
CROSS JOIN client
CROSS JOIN sell;

-- C. find the dealer and client who belongs to same city
SELECT
       dealer.name, client.name
FROM dealer
INNER JOIN client
ON dealer.location = client.city;

-- D. find sell id, amount, client name, city those sells where sell amount exists between
-- 100 and 500
SELECT
       sell.id, sell.amount, client.name, client.city
FROM sell
INNER JOIN client
ON sell.client_id = client.id AND sell.amount >= 100 AND sell.amount <= 500;

-- E. find dealers who works either for one or more client or not yet join under any of
-- the clients
-- > the statement is not so clear :(
SELECT
       dealer.name, client.name
FROM dealer
INNER JOIN client
ON dealer.id = client.dealer_id;

-- F. find the dealers and the clients he service, return client name, city, dealer name,
-- commission.
-- > It's not clear commission == charge ???
SELECT
        dealer.name, client.name, client.city, dealer.charge
FROM dealer
INNER JOIN client
ON dealer.id = client.dealer_id;

-- G. find client name, client city, dealer, commission those dealers who received a
-- commission from the sell more than 12%
SELECT
    client.name, client.city, dealer.name, dealer.charge
FROM client
INNER JOIN dealer
ON client.dealer_id = dealer.id AND dealer.charge > 0.12;

-- H. make a report with client name, city, sell id, sell date, sell amount, dealer name
-- and commission to find that either any of the existing clients haven’t made a
-- purchase(sell) or made one or more purchase(sell) by their dealer or by own.
-- > This statement is also not so clear :(
SELECT
       client.name, client.city, sell.id, sell.date, sell.amount, dealer.name, dealer.charge
FROM dealer
CROSS JOIN client
CROSS JOIN sell;

-- I. find dealers who either work for one or more clients. The client may have made,
-- either one or more purchases, or purchase amount above 2000 and must have a
-- grade, or he may not have made any purchase to the associated dealer. Print
-- client name, client grade, dealer name, sell id, sell amount
SELECT
        dealer.id, client.name, client.priority, dealer.name, sell.id, sell.amount
FROM client
LEFT JOIN dealer
ON client.dealer_id = dealer.id
INNER JOIN sell
ON client.id = sell.client_id AND sell.amount > 2000;


/*
    2. Create following views:
*/

-- A. count the number of unique clients, compute average and total purchase
-- amount of client orders by each date.
-- 1)
CREATE VIEW V1 AS
SELECT COUNT (id) FROM client;
SELECT * FROM V1;
--2)
CREATE VIEW V2 AS
SELECT AVG (amount) FROM sell;
SELECT * FROM V2;
--3)
CREATE VIEW V3 AS
SELECT SUM (amount) FROM sell;
SELECT * FROM V3;

-- B. find top 5 dates with the greatest total sell amount
CREATE VIEW V4 AS
SELECT date from sell ORDER BY amount DESC LIMIT 5;
SELECT * FROM V4;
-- for checking
SELECT date, amount from sell ORDER BY amount DESC LIMIT 5;

-- C. count the number of sales, compute average and total amount of all
-- sales of each dealer
CREATE VIEW V5 AS
SELECT dealer.name, COUNT (sell.id), AVG (amount), SUM (amount)
FROM dealer
INNER JOIN sell
ON dealer.id = sell.dealer_id
GROUP BY dealer.id;
SELECT * FROM V5;

-- D. compute how much all dealers earned from charge(total sell amount * charge) in each location
-- NO SOLUTION

-- E. compute number of sales, average and total amount of all sales dealers
-- made in each location
CREATE VIEW V6 AS
SELECT dealer.location, COUNT (sell.id), AVG (amount), SUM (amount)
FROM dealer
INNER JOIN sell
ON dealer.id = sell.dealer_id
GROUP BY dealer.location;
SELECT * FROM V6;

-- F. compute number of sales, average and total amount of expenses in
-- each city clients made.
CREATE VIEW V7 AS
SELECT client.city, COUNT (sell.id), AVG (amount), SUM (amount)
FROM client
INNER JOIN sell
ON client.id = sell.client_id
GROUP BY client.city;
SELECT * FROM V7;

-- G. find cities where total expenses more than total amount of sales in
-- locations
-- NO SOLUTION
