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
select ord_date,salesman_id,ord_no,purch_amt from orders
--2
select distinct salesman_id from orders
--3
select Name,city from salesman where City='Paris'
--4
select ord_no,ord_date,purch_amt from  orders where salesman_id=5001
--5
select*from customer where city='New York' and grade>100
--6
select salesman_id,name,city from salesman where(Commission>0.10 and Commission<0.12)
--7
select SUM(purch_amt) as total_purch_amt_order from orders
--8
select AVG(purch_amt) as total_purch_amt_order from orders
--9
select COUNT(Name) as total_count_name from salesman
select count(distinct salesman_id) as total_count_name  from orders
--10
select customer_id, MAX(purch_amt) as max_purch_amt from orders  group by customer_id order by customer_id
--11
select ord_date,customer_id,max(purch_amt) as max_purch_amt from orders group by ord_date,customer_id
--12
select salesman_id,purch_amt from orders where ord_date='2012-08-17' group by salesman_id,purch_amt
--13
select salesman.Name as salesman,customer.cust_name as customername ,customer.city from salesman, customer where salesman.city=customer.city
--14
select o.ord_no,o.purch_amt,c.cust_name,c.city from orders o,customer c 
where o.customer_id=c.cust_id and o.purch_amt between 500 and 2000
--15
select s.Name,s.commission,c.cust_name,c.city from salesman s inner join customer c on s.Salesman_id=c.salesman_id where s.Commission>0.12
--16
select c.cust_name,c.city,c.grade,s.name,s.city from customer c left join salesman s on c.salesman_id=s.Salesman_id order by c.cust_id

