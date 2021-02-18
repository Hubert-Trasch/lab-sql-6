-- Drop column picture from staff.

alter table staff
drop column picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from customer
where first_name='TAMMY' and last_name='SANDERS';

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active,username, password)
VALUES (3, 'Tammy', 'Sanders',79, 'tammy.sanders@sakilastaff.com', 2,1,'Tammy', 'password');

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:




SELECT * 
FROM film;

SELECT *
FROM customer
WHERE first_name = 'Charlotte' and last_name = 'Hunter';

SELECT * 
FROM rental
WHERE inventory_id BETWEEN 1 AND 4;

INSERT INTO rental(inventory_id, customer_id, return_date, staff_id)
VALUES (1, 130, '2021-02-12', 1);

-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer


select * from customer
where active=0;



alter table deleted_users
drop column date;


CREATE TABLE deleted_users2 AS
    SELECT customer_id, email
    FROM customer
    WHERE active = '0';

Alter Table deleted_users2
Add date date;

UPDATE deleted_users2 set date ='2021-02-09';

select * from deleted_users2;

drop table deleted_users;

drop table deleted_users1;


delete from customer
where active=0;

-- delete does not work


drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


-- rating with type enum does not work


UPDATE films_2020 set rental_duration =3;
UPDATE films_2020 set replacement_cost=8.99;

select * from films_2020;


alter table films_2020
rename column rental_rate to offer_price;
UPDATE films_2020 set offer_price=2.99;
