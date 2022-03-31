create database Sales
use Sales 
create table salesman(Salesman_id int,Name varchar(30),City varchar(20),Commission decimal)
insert into salesman values(5001,'James Hoog','New York',0.15)
insert into salesman values(5002,'Nail Knite','Paris',0.13)
insert into salesman values(5005,'Pit Alex','London',0.11)
insert into salesman values(5006,'Mc Lyon','Paris',0.14)
insert into salesman values(5007,'Paul Adam','Rome',0.13)
insert into salesman values(5003,'Lauson Hen','San Jose',0.12)
--orders
use Sales
create table orders(ord_no int,purch_amt decimal,ord_date date,customer_id int,salesman_id int)
insert into orders values(70001,150.5,'2012-10-05',3005,5002)
insert into orders values(70009,270.65,'2012-09-10',3001,5005)
insert into orders values(70002,65.26,'2012-10-05',3002,5001)
insert into orders values(70004,110.5,'2012-08-17',3009,5003)
insert into orders values(70007,948.5,'2012-09-10',3005,5002)
insert into orders values(70005,2400.6,'2012-07-27',3007,5001)
insert into orders values(70008,5760,'2012-09-10',3002,5001)
insert into orders values(70010,1983.43,'2012-10-10',3004,5006)
insert into orders values(70003,2480.4,'2012-10-10',3009,5003)
insert into orders values(70012,250.45,'2012-06-27',3008,5002)
insert into orders values(70011,75.29,'2012-08-17',3003,5007)
insert into orders values(70013,3045.6,'2012-04-25',3002,5001)
--customer
create table customer(cust_id int,cust_name varchar(20),city varchar(20),grade int,salesman_id int)
insert into customer values(3002,'Nick Rimando','New York',100,5001)
insert into customer values(3007,'Brad Davis','New York',200,5001)
insert into customer values(3005,'Graham Zusi','Calofornia',200,5002)
insert into customer values(3008,'Julian Green','London',300,5002)
insert into customer values(3004,'Fabian Johnson','Paris',300,5006)
insert into customer values(3009,'Geoff Cameron','Berlin',100,5003)
insert into customer values(3003,'Jozy Altidor','Moscow',200,5007)
insert into customer values(3001,'Brad Guzan','London',NULL,5005)
select*from customer where city in('New York') AND grade>100
select*from salesman where Commission BETWEEN 0.10 AND 0.12
select SUM(purch_amt) as total_purch_amt_order from orders
select AVG(purch_amt) as total_purch_amt_order from orders
select COUNT(Name) as total_count_name from salesman
select customer_id, MAX(purch_amt) from orders  group by customer_id order by MAX(purch_amt)
--1
select*from orders where salesman_id=(select salesman_id from salesman where name='Paul Adam') 
--2
select*from orders where salesman_id in(select salesman_id from salesman where City='Paris')
--3
select*from orders where salesman_id=(select salesman_id from orders where customer_id=3007)
--4
select*from orders where purch_amt>( select AVG(purch_amt) from orders where ord_date='2012-10-10' )
--5
select*from orders where salesman_id in(select salesman_id from salesman where City='New York')
--6
select salesman_id,Name  from salesman a where 1<(select count(*) from customer where salesman_id=a.salesman_id)
--select salesman_id,Name from SalesPerson where salesman in(select salesman_id from customer group by salesman_id having count(*)>1)
--7
select*from orders where purch_amt>( select AVG(purch_amt) from orders)
--select*from orders a where purch_amt>( select AVG(purch_amt) from orders b where b.customer_id=a.customer_id)
--8
select ord_date, sum(purch_amt) from orders a group by ord_date having sum(purch_amt)>
(select 1000+max(purch_amt) from orders b where a.ord_date=b.ord_date)
--9
--select*from customer where city='London'
select*from customer where exists(select*from customer where city='London')
--10
select*from salesman where salesman_id in(select salesman_id from customer 
group by salesman_id having count(*) >1)
