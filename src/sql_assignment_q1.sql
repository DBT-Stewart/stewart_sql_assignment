CREATE DATABASE ecommerce;
USE ecommerce;

create table gold_member_users(
user_id int primary key,
user_name varchar(20),
sign_up_date date
);

create table users(
user_id int primary key,
user_name varchar(20),
sign_up_date date
);


create table sales(
user_id int,
user_name varchar(20),
created_datre date,
product_id int,
foreign key (product_id) references product (product_id)
);

create table product(
product_id int primary key,
product_name varchar(20),
price int
);

insert into gold_member_users values
( 1,'John','09-22-2017'), ( 2,'Mary','04-21-2017')
;

insert into users values 
(1,'John','09-02-2014'), (2,'Michel','01-15-2015'), (3,'Mary','04-11-2014') 
;

insert into sales values
(1,'John','04-19-2017',2), (3,'Mary','12-18-2019',1), (2,'Michel','07-20-2020',3), (1,'John','10-23-2019',2), (1,'John','03-19-2018',3), (3,'Mary','12-20-2016',2), (1,'John','11-09-2016',1), (1,'John','05-20-2016',3), (2,'Michel','09-24-2017',1), (1,'John','03-11-2017',2), (1,'John','03-11-2016',1), (3,'Mary','11-10-2016',1), (3,'Mary','12-07-2017',2) 
;

 insert into product values
 (1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330) 
 ;

 -- To show only table names in the current database:
SELECT name 
FROM sys.tables;

-- Bonus: See All Objects
SELECT * 
FROM sys.tables
WHERE type_desc = 'USER_TABLE';

-- to view all tables
select * from gold_member_users;
select * from users;
select * from sales;
select * from product;

--5. Count all the records of all four tables using single query 
select count(*) from gold_member_users
union all
select count(*) from users
union all
select count(*) from sales
union all
select count(*) from product;

--6. What is the total amount each customer spent on ecommerce company
select users.user_name,sum(price) as total_sum
from users
join sales on users.user_id = sales.user_id
join product on sales.product_id = product.product_id
group by users.user_name;

--7. Find the distinct dates of each customer visited the website: output should have 2 columns date and customer name 
select distinct created_datre,users.user_name 
from users
join sales on users.user_id = sales.user_id
--order by user_name;
group by created_datre,users.user_name;

--8. Find the first product purchased by each customer using 3 tables(users, sales, product) 
select distinct u.user_name,s.created_datre,p.product_name
from(select *, row_number() over(partition by 
user_id order by created_datre) 
as row_num from sales)s 
inner join users u on s.user_id=u.user_id
inner join product p on s.product_id = p.product_id
where s.row_num=1;

select * from sales;

--9. What is the most purchased item of each customer and how many times the customer has purchased it: output should have 2 columns count of the items as item_count and customer name
select count(*) as item_count,product.product_name, sales.user_name
from users
join sales on users.user_id=sales.user_id
join product on product.product_id=sales.product_id
group by sales.user_name,product.product_name
order by sales.user_name;

--10. Find out the customer who is not the gold_member_user
select users.user_name 
from gold_member_users g
right join users on g.user_name = users.user_name
where g.sign_up_date IS NULL;

--11.What is the amount spent by each customer when he was the gold_member order by  user
SELECT g.user_id,g.user_name,SUM(p.price) AS total_amount_spent
FROM sales s
JOIN product p ON s.product_id = p.product_id
JOIN gold_member_users g ON s.user_id = g.user_id
WHERE s.created_datre >= g.sign_up_date
GROUP BY g.user_id, g.user_name
ORDER BY g.user_id;

--12.Find the Customers names whose name starts with M
SELECT user_name
FROM users
WHERE user_name LIKE 'M%';

--13.Find the Distinct customer Id of each customer
SELECT DISTINCT user_id 
FROM sales;

--14.Change the Column name from product table as price_value from price
EXEC sp_rename 'product.price', 'price_value', 'COLUMN';

--15.Change the Column value product_name – Ipad to Iphone from product table
UPDATE product
SET product_name = 'Iphone'
WHERE product_name = 'Ipad';

--16.Change the table name of gold_member_users to gold_membership_users
EXEC sp_rename 'gold_member_users', 'gold_membership_users';

--17.Create a new column  as Status in the table crate above gold_membership_users  the Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No.
--Step 1: Add the New Column to users Table
ALTER TABLE users
ADD Status VARCHAR(5);
--ALTER TABLE users
--Drop column Status ;
--Step 2: Update Status Based on Gold Membership
UPDATE users
SET Status = 'Yes'
WHERE users.user_name IN (
    SELECT gold_member_users.user_name FROM gold_member_users
);
--Step 3: Set Remaining Users' Status to 'No'
UPDATE users
SET Status = 'No'
WHERE Status IS NULL;

--18.Delete the users_ids 1,2 from users table and roll the back changes once both the rows are deleted one by one mention the result when performed roll back
BEGIN TRANSACTION;
-- Step 1: Delete user_id 1
DELETE FROM users WHERE user_id = 1;
-- Step 2: Delete user_id 2
DELETE FROM users WHERE user_id = 2;
-- Step 3: Check current state (these two users are now deleted temporarily)
SELECT * FROM users;
--Rollback
ROLLBACK;
SELECT * FROM users;

--19.Insert one more record as same (3,'Laptop',330) as product table
INSERT INTO product (product_id, product_name, price)
VALUES (4, 'Laptop', 330);

--20.Write a query to find the duplicates in product table
SELECT product_name, price, COUNT(*) AS duplicate_count
FROM product
GROUP BY product_name, price
HAVING COUNT(*) > 1;