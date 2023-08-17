--index
create clustered index Emp_Id_Index on Emp(Id)
select * from Emp where Name = 'Deep'

drop table Emp

create database Day5Db
use Day5Db
create table Emp
(Id int ,
Name nvarchar(50),
Salary float)

insert into Emp values (2,'Sam',98000.50),
(12,'Ram',98000.50),
(5,'Raj',98000.50),
(6,'Deep',98000.50)

select * from Emp
select * from Emp where Id=5

---------------------------------------------------------
create index Emp_Salary_Index on Emp(Salary)

-----------------------------------------

/*CREATE NONCLUSTERED INDEX IX_PurchaseOrderDetails_RejectedQty
ON Purchasing.PurchaseOrderDetail
	(REjectedQty DESC, ProductId ASC, DueDate, OrderQty);
GO*/
--------------------------------------------------------------
drop table Emp
---------------------------------------------------
create table Customers
(CId int primary key,
CName nvarchar(50) not null,
CODLimit float)

insert into Customers values(1,'Raj',89000.50)
insert into Customers values(2,'Deep',60000.50)
insert into Customers values(3,'Amit',76000.50)
insert into Customers values(4,'Vinay',82000.50)
insert into Customers values(5,'Ritesh',45000.50)
insert into Customers values(7,'Deep',89000.50)

select * from Customers

create view cust_view
as
select CName,CODLimit from Customers

select * from cust_view

insert into Customers values(8,'Deep',75000.50)
delete from cust_view where CName = 'Deep'
--------------------------------------------------
alter view cust_view
as
select CODLimit from Customers

create view cust_view2
as
select CName,CId from Customers

insert into cust_view2 values('Nitesh',15)
select *from cust_view2

alter table Customers drop column CName

select *from cust_view
select *from cust_view2

------------------------------------------------------------------------

create schema bank
create table bank.Customers
(CId int primary key,
CName nvarchar(50) not null,
CODLimit float)

insert into bank.Customers values (1,'Raj',89000.50),
(2,'Deep',60000.50),
(3,'Amit',76000.50),
(4,'Vinay',82000.50),
(5,'Ritesh',45000.50),
(7,'Deep',75000.50)

create view bank.cust_view2
with schemabinding
as
select CName,CId from bank.Customers

select * from bank.cust_view2
alter table bank.Customers drop column CName
--------------------------------------------------------------
use joinExDb

create view viewEmpDept
as
select e.Id,e.Fname+''+e.Lname 'Full Name',d.DName 'Department',d.DId,e.salary,e.Designation
from Emps e join Depts d on e.DId=d.DId
select * from viewEmpDept where Department='Web-Development'
select * from viewEmpDept where Salary>=86000
select * from viewEmpDept where Salary<=86000