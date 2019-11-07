CREATE DATABASE Umuzi

CREATE TABLE Customer(customerID serial PRIMARY KEY, 
firstname VARCHAR (50), 
lastname VARCHAR (50), 
Gender VARCHAR, 
address VARCHAR(100), 
phone INTEGER, 
email VARCHAR(100), 
city VARCHAR(20), 
country VARCHAR(50));

 CREATE TABLE Employees(EmployeeID serial PRIMARY KEY,
  firstname VARCHAR (50),
  lastname VARCHAR (50), 
  email VARCHAR(100), 
  jobTittle VARCHAR(20));

  CREATE TABLE Products(ProductID serial PRIMARY KEY, 
  productName VARCHAR (100), 
  Describtion VARCHAR (300), 
  Buyprice DECIMAL);

CREATE TABLE Payments(CustomerID INTEGER REFERENCES Customer(customerid), 
PaymentID serial PRIMARY KEY, 
Paymentstime TIMESTAMP, 
Amount NUMERIC);

CREATE TABLE orders(OrderID serial PRIMARY KEY, 
ProductID INTEGER REFERENCES Products(Productid), 
PaymentID INTEGER REFERENCES Payments(Paymentid) , 
FulfilledemployeeID INTEGER REFERENCES Employees(Employeeid), 
Daterequired TIMESTAMP, 
DateShipped TIMESTAMP, 
status VARCHAR(20));

INSERT INTO customer VALUES(1, 'John', 'Hibert', 'Male', '284 chaucer st', 084789657, 'john@gmail.com', 'Johannesburg', 'South Africa');

INSERT INTO customer VALUES( 2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa');

INSERT INTO customer VALUES(3 , 'Leon', 'Glen', 'Male', '81 Everton Rd,Gillits', 0820832830, 'Leon@gmail.com', 'Durban', 'South Africa');


 customerid | firstname | lastname | gender |        address        |    phone     |         email          |     city     |   country    
------------+-----------+----------+--------+-----------------------+--------------+------------------------+--------------+--------------
          1 | John      | Hibert   | Male   | 284 chaucer st        |     84789657 | john@gmail.com         | Johannesburg | South Africa
          2 | Thando    | Sithole  | Female | 240 Sect 1            |    794445584 | thando@gmail.com       | Cape Town    | South Africa
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits |    820832830 | Leon@gmail.com         | Durban       | South Africa
          4 | Charl     | Muller   | Mal    | 290A Dorset Ecke      |  44856872553 | Charl.muller@yahoo.com | Berlin       | Germany
          5 | Julia     | Stein    | Female | 2 Wernerring          | 448672445058 | Js234@yahoo.com        | Frankfurt    | Germany


INSERT INTO employees VALUES(1 , 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');

INSERT INTO employees VALUES(2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');

INSERT INTO employees VALUES(3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

employeeid | firstname | lastname |     email      | jobtittle  
------------+-----------+----------+----------------+------------
          1 | Kani      | Matthew  | mat@gmail.com  | Manager
          2 | Lesly     | Cronje   | LesC@gmail.com | Clerk
          3 | Gideon    | Maduku   | m@gmail.com    | Accountant



INSERT INTO products VALUES(1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75);

INSERT INTO products VALUES(2, 'Classic Car', 'Turnable front wheels, steering function', 550.75);
 
INSERT INTO products VALUES(3, 'Sports car', 'Turnable front wheels, steering function', 700.60);


 productid |       productname       |                                 describtion                                 | buyprice 
-----------+-------------------------+-----------------------------------------------------------------------------+----------
         1 | Harley Davidson Chopper | This replica features working kickstand, front suspension, gear-shift lever |   150.75
         2 | Classic Car             | Turnable front wheels, steering function                                    |   550.75
         3 | Sports car              | Turnable front wheels, steering function                                    |   700.60


INSERT INTO payments VALUES(1, 1, '01-09-2018', 150.75);

INSERT INTO payments VALUES(5, 2, '03-09-2018', 150.75);

INSERT INTO payments VALUES(4, 3, '03-09-2018', 700.60);

 customerid | paymentid |    paymentstime     | amount 
------------+-----------+---------------------+--------
          1 |         1 | 2018-01-09 00:00:00 | 150.75
          5 |         2 | 2018-03-09 00:00:00 | 150.75
          4 |         3 | 2018-03-09 00:00:00 | 700.60



INSERT INTO orders VALUES(1, 1, 1, 2, '05-09-2018', default , 'not shipped');

INSERT INTO orders VALUES(2, 1, 2, 2, '04-09-2018', '03-09-2018', 'Shipped');

INSERT INTO orders VALUES(3, 3, 3, 3, '06-09-2018', default,'Not shipped');

orderid | productid | paymentid | fulfilledemployeeid |    daterequired     |     dateshipped     |   status    
---------+-----------+-----------+---------------------+---------------------+---------------------+-------------
       1 |         1 |         1 |                   2 | 2018-05-09 00:00:00 |                     | not shipped
       2 |         1 |         2 |                   2 | 2018-04-09 00:00:00 | 2018-03-09 00:00:00 | Shipped
       3 |         3 |         3 |                   3 | 2018-06-09 00:00:00 |                     | Not shipped


/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

/*(1) -SELECT ALL records from table Customers.*/ 
      #= SELECT * FROM customer; 

 customerid | firstname | lastname | gender |        address        |    phone     |         email          |     city     |   country    
------------+-----------+----------+--------+-----------------------+--------------+------------------------+--------------+--------------
          1 | John      | Hibert   | Male   | 284 chaucer st        |     84789657 | john@gmail.com         | Johannesburg | South Africa
          2 | Thando    | Sithole  | Female | 240 Sect 1            |    794445584 | thando@gmail.com       | Cape Town    | South Africa
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits |    820832830 | Leon@gmail.com         | Durban       | South Africa
          4 | Charl     | Muller   | Mal    | 290A Dorset Ecke      |  44856872553 | Charl.muller@yahoo.com | Berlin       | Germany
          5 | Julia     | Stein    | Female | 2 Wernerring          | 448672445058 | Js234@yahoo.com        | Frankfurt    | Germany


/*(2) -SELECT records only from the name column in the Customers table.*/
      #= SELECT firstname,lastname  FROM customer; 

      firstname | lastname 
-----------+----------
 John      | Hibert
 Thando    | Sithole
 Leon      | Glen
 Charl     | Muller
 Julia     | Stein

 /*(3) -Show the name of the Customer whose CustomerID is 1 */
       #= SELECT firstname FROM customer WHERE customerid = 1; 

firstname 
-----------
 John

/*(4) -UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”. */
      #=UPDATE customer SET firstname = 'lerato', lastname = 'mabitso' WHERE customerId = 1; 

  customerid | firstname | lastname | gender |    address     |  phone   |     email      |     city     |   country    
------------+-----------+----------+--------+----------------+----------+----------------+--------------+--------------
          1 | lerato    | mabitso  | Male   | 284 chaucer st | 84789657 | john@gmail.com | Johannesburg | South Africa


/*(5) -DELETE the record from the Customers table for customer 2 (CustomerID = 2) */
      #=DELETE FROM customer WHERE customerID = 2; 

 customerid | firstname | lastname | gender |        address        |    phone     |         email          |     city     |   country    
------------+-----------+----------+--------+-----------------------+--------------+------------------------+--------------+--------------
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits |    820832830 | Leon@gmail.com         | Durban       | South Africa
          4 | Charl     | Muller   | Mal    | 290A Dorset Ecke      |  44856872553 | Charl.muller@yahoo.com | Berlin       | Germany
          5 | Julia     | Stein    | Female | 2 Wernerring          | 448672445058 | Js234@yahoo.com        | Frankfurt    | Germany
          1 | lerato    | mabitso  | Male   | 284 chaucer st        |     84789657 | john@gmail.com         | Johannesburg | South Africa

/*(6) -Select all unique statuses from the Orders table and get a count of the number of orders for each unique status */
      #= SELECT DISTINCT status FROM orders;
      #= SELECT COUNT(DISTINCT status) FROM orders; 

        status    
-------------
 Not shipped
 Shipped

 count 
-------
     2



/*(7) -Return the MAXIMUM payment made on the PAYMENTS table. */
      #=  SELECT MAX(amount) FROM payments; 

  max   
--------
 700.60

/*(8) -Select all customers from the “Customers” table, sorted by the “Country” column */
      #= SELECT * FROM customer ORDER BY country; 

       customerid | firstname | lastname | gender |        address        |    phone     |         email          |     city     |   country    
------------+-----------+----------+--------+-----------------------+--------------+------------------------+--------------+--------------
          4 | Charl     | Muller   | Mal    | 290A Dorset Ecke      |  44856872553 | Charl.muller@yahoo.com | Berlin       | Germany
          5 | Julia     | Stein    | Female | 2 Wernerring          | 448672445058 | Js234@yahoo.com        | Frankfurt    | Germany
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits |    820832830 | Leon@gmail.com         | Durban       | South Africa
          1 | lerato    | mabitso  | Male   | 284 chaucer st        |     84789657 | john@gmail.com         | Johannesburg | South Africa


/*(9) -Select all products with a price BETWEEN R100 and R600. */
      #=  SELECT * FROM products WHERE buyprice >= 100 AND buyprice <= 600; 

 productid |       productname       |                                 describtion                                 | buyprice 
-----------+-------------------------+-----------------------------------------------------------------------------+----------
         1 | Harley Davidson Chopper | This replica features working kickstand, front suspension, gear-shift lever |   150.75
         2 | Classic Car             | Turnable front wheels, steering function                                    |   550.75



/*(10) -Select all fields from “Customers” where country is “Germany” AND city is “Berlin” */
      #= SELECT * FROM customer WHERE country = 'Germany' AND city = 'Berlin'; 

       customerid | firstname | lastname | gender |     address      |    phone    |         email          |  city  | country 
------------+-----------+----------+--------+------------------+-------------+------------------------+--------+---------
          4 | Charl     | Muller   | Mal    | 290A Dorset Ecke | 44856872553 | Charl.muller@yahoo.com | Berlin | Germany


/*(11) -Select all fields from “Customers” where city is “Cape Town” OR “Durban”. */
        #= SELECT * FROM customer WHERE city = 'Cape town' OR city = 'Berlin'; 

         customerid | firstname | lastname | gender |     address      |    phone    |         email          |  city  | country 
------------+-----------+----------+--------+------------------+-------------+------------------------+--------+---------
          4 | Charl     | Muller   | Mal    | 290A Dorset Ecke | 44856872553 | Charl.muller@yahoo.com | Berlin | Germany


/*(12) -Select all records from Products where the Price is GREATER than R500. */
       #= SELECT * FROM products WHERE buyprice > 500; 

       productid | productname |               describtion                | buyprice 
-----------+-------------+------------------------------------------+----------
         2 | Classic Car | Turnable front wheels, steering function |   550.75
         3 | Sports car  | Turnable front wheels, steering function |   700.60


/*(13) -Return the sum of the Amounts on the Payments table. */
       #= SELECT SUM(amount) FROM payments; 

   sum   
---------
 1002.10

/*(14) -Count the number of shipped orders in the Orders table. */
       #= SELECT COUNT(status) FROM orders WHERE orderid = 2; 

 count 
-------
     1

/*(15) -Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar). */
       #= SELECT AVG(buyprice) FROM products; 
       #= SELECT AVG(buyprice/12) FROM products; 

      avg          
----------------------
 467.3666666666666667
(1 row)


/*(16) -Using INNER JOIN create a query that selects all 'Payments' with 'Customer information' */
       #= SELECT customer.customerID, customer.firstname, customer.lastname, customer.gender, customer.address, customer.phone, customer.email, customer.country, customer.city 
       FROM customer INNER JOIN payments ON payments.customerid = customer.customerid; 

 customerid | firstname | lastname | gender |     address      |    phone     |         email          |   country    |     city     
------------+-----------+----------+--------+------------------+--------------+------------------------+--------------+--------------
          1 | lerato    | mabitso  | Male   | 284 chaucer st   |     84789657 | john@gmail.com         | South Africa | Johannesburg
          5 | Julia     | Stein    | Female | 2 Wernerring     | 448672445058 | Js234@yahoo.com        | Germany      | Frankfurt
          4 | Charl     | Muller   | Mal    | 290A Dorset Ecke |  44856872553 | Charl.muller@yahoo.com | Germany      | Berlin


/*(17) -Select all products that have turnable front wheels. */
       #= SELECT * FROM products WHERE description > 'Turnable front wheels steering function'; 

        productid | productname |               description                | buyprice 
-----------+-------------+------------------------------------------+----------
         2 | Classic Car | Turnable front wheels, steering function |   550.75
         3 | Sports car  | Turnable front wheels, steering function |   700.60






















/*

Create a database called “Umuzi”.

Create the following tables in the Umuzi database:

Customers
Employees
Orders
Payments
Products
Create a primary key for each table with auto-increment (make sure you correctly specify the data types, e.g. the ID field should be int).

Create foreign keys so that every ID in the order table references an existing ID in the tables referenced (e.g., ProductID, EmployeeID, etc).

INSERT the records in the tables below into the table you created in step 2.

Document what information is stored in your database. Be sure to say what information is kept in what table, and which keys link the records between tables.

*/