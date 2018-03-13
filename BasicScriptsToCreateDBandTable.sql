/* To show the the data bases*/
SHOW DATABASES;

/*To Create a database*/
CREATE DATABASE coffee_store;

/*To Use a particular database*/
USE coffee_store;

/*To see all the tables in a database*/
SHOW TABLES;

/*To create table in a database with column names and types*/
create table products(
	id INT auto_increment primary key,
    name varchar(30),
    price decimal(3,2)
);

create table customers(
	id INT auto_increment primary key,
    first_name varchar(30),
    last_name varchar(30),
    gender enum('M', 'F'),
    phone_number varchar(11)
);

/*Creating a table but adding the foreign keys by referencing other tables*/
create table orders(
	id int auto_increment primary key,
    product_id int,
    customer_id int,
    order_time datetime,
    foreign key (product_id) references products(id),
    foreign key (customer_id) references customers(id)
);

/*To see the data inside the tables*/
select * from products;

/*To inser new column into the table alterning the table information*/
alter table products
add column coffee_origin varchar(30);

/*Inserting a single row into the table*/
insert into products(name, price, coffee_origin)
values ('Espresso', 2.50, 'Brazil');

/*Insearting the mutliple rows of data into the table*/
insert into products(name, price, coffee_origin)
values ('Macchiato', 3.00, 'Brazil'), ('Cappuccino', 3.50, 'Costa Rica');

insert into products(name, price, coffee_origin)
values ('Latte', 3.50, 'Indonesia'), ('Americano', 3.00, 'Brazil'),('Flat White', 3.50, 'Indonesia'), ('Filter', 3.50, 'India');

/*To Update a particular column data*/
update products
set price = 3.00
where id = 7;

/*To Update the multiple columns data*/
update products
set price = 3.25, coffee_origin = 'Ethiopia'
where id = 5;

/*To enable and disable the safe update*/
set sql_safe_updates = 0;

/*To update to rows same time*/
update products
set coffee_origin = 'Columbia'
where coffee_origin = 'Brazil';


select * from customers;

select * from orders;

/* select querying examples*/
select first_name from customers;

select first_name, last_name, gender from customers;

/* Where class to select statements*/

select * from products
where coffee_origin = 'Columbia';

/*To user multiple where classes*/
select * from products
where price = 3.00
and coffee_origin = 'Columbia';

/*In equlaity conditions like
> greather than
>= greather than or equal to
< less than
<= less than or equals to
*/

select * from products
where price > 2.50;

select * from products
where price >= 2.50;

select * from products
where price < 3.00;

select * from products
where price <= 3.00;

/*Null values and deal with null values*/
select * from customers
where phone_number is null;

select * from customers
where phone_number is not null;


/* Excersise 1*/

/*Problem 1:*/

select first_name, phone_number  from customers
where gender = 'F'
and last_name = 'Bluth';

/*Problem 2*/
select name from products
where price > 3.00
or coffee_origin = 'india';

/* Problem 3*/
select * from customers
where gender = 'M'
and phone_number is null;


/*If there are any similar values in the columns, if want to see only distinct values, we use this 
distinct keyword like below*/
/*we can also combine this with where class*/

select distinct coffee_origin from products;

select distinct customer_id, product_id from orders
where order_time between '2017-02-01' and '2017-02-28';

/*
LIMIT : limiting the number of rows that is coming from the select statement
1) it displays first five rows
2) If we don't want to display first 5 but want to display from 6 to 10
3) just using orderby lastname to see another way.
*/
select * from customers
limit 5;

select * from customers
limit 10 offset 5;

select * from customers
order by last_name
limit 10;


/*
Column name Alias: rename our columns name on our results sets. it will not change the column name in data base
it will change only in the results sets.
1) changing the column name coffe_name to coffee and coffee_origin to country
*/

select id, name as coffee, price, coffee_origin as country  from products;


/*
Excerise 3:
1) from the customers table, select distinct last names and order alphabetically from A-Z;
2) From the orders table, select the first 3 orders placed by customer with id 1, in february 2017
3) From the products table, select the name, price and coffee origin but rename the price to retail_price in the results set.
*/

select distinct last_name from customers
order by last_name ASC;

select * from orders
where order_time between '2017-02-01' and '2017-02-28'
and customer_id = 1
order by order_time
limit 3;


select name, price as retail_price, coffee_origin from products;














