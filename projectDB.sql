# Salam - DDL Create 
create database store;
# DDL countries
use store;
create table countries (
  code int primary key ,
  name varchar(20) unique,
  continent_name varchar(20) not null
);
# DDL users
create table users (
   id int primary key ,
   full_name varchar(20) ,
   email varchar(20) unique,
   gender char(1) check(gender= 'm' or gender= 'f'),
   date_of_birth varchar(15) ,
   created_at datetime default current_timestamp on update current_timestamp ,
   country_code int ,
   foreign key(country_code) references countries(code)
);
# DDL orders 
create table orders (
  id int primary key ,
  user_id int ,
  foreign key(user_id) references users(id) ,
  status varchar(6) check(status= 'start' or status= 'finish'),
  created_at datetime default current_timestamp on update current_timestamp
);
# DDL products 
create table products (
 id int primary key ,
 name varchar(10) not null,
 price int default 0,
 status varchar(10) check(status= 'valid' or status= 'expired'),
 created_at datetime default current_timestamp on update current_timestamp
);
# DDL order_products 
create table order_products (
  order_id int ,
  foreign key(order_id) references orders(id) ,
  product_id int , 
  foreign key(product_id) references products(id) ,
  quantity int default 0
);
# DML insert - countries
insert into countries values (1 , 'saudi', 'vana');
# DML insert - users
insert into users values (1 , 'khaled', 'alanziq00@gmail.com', 'm', 1996-12-06, '2022-04-17 01:17:00', 1);
# DML insert - orders
insert into orders values (1 , 1, 'start', '2022-04-17 01:17:00');
# DML insert - products
insert into products values (1 ,'note', 5,'valid','2022-04-17 01:22:00');
# DML insert - order_products 
insert into order_products values (1 ,1, 1);
# DML Update - countries
update countries set name='saudi arabia' where code='1';
# DML Delete - order_products and products
delete from order_products where order_id='1';
delete from products where id='1';
# DQL Select 
select * from users;
select * from countries;
select * from orders;
select * from order_products;
select * from products;
# DML Update - users
update users set date_of_birth='1996' where id='1';



