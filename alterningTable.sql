
/* Creating the test database*/
create database test;

/* Using the creted test database*/
use test;

/*Creating the addresses table and adding columns with datatypes*/
create table addresses(
   id INT,
   house_number INT,
   city VARCHAR(20),
   postcode VARCHAR(9)
);

/*Creating the people table and adding columns with datatypes*/
create table people(
  id INT,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  address_id INT
);

/*Creating the pets table and adding columns with datatypes*/
create table pets(
   id INT,
   name VARCHAR(20),
   species VARCHAR(20),
   owner_id INT
);

/*making sure that table are created.*/
show tables;

/*To see the table columns and its types, keys and extra*/
describe addresses;
describe people;

/* code to add a primary key to a table*/
alter table addresses
add PRIMARY KEY(id);

alter table people
add PRIMARY KEY(id);

/*To remove the primary key from table*/
/*when we remove the primary key, it will not remove the acceptance of null constraint*/
alter table addresses
drop PRIMARY KEY;


/*Code to add foreign keys to a table*/

alter table people
add constraint FK_people_address
foreign key (address_id) references addresses (id);


/*Remove the foreign key*/
alter table people
drop foreign key FK_people_address;


select * from pets;

describe pets;

/*Adding a unique constraint:  unique constraint column won't accept duplicated value*/

alter table pets
add constraint u_species unique(species);


/*It doesn't make sense to have unique constriant on species column so removie it*/
alter table pets
drop index u_species;

/*Renaming the column*/
alter table pets change `species` `animal_type` varchar(20);
alter table pets change `animal_type` `species` varchar(20);

/*Change columns data type*/
alter table pets modify name INT;
alter table pets modify name VARCHAR(20);

