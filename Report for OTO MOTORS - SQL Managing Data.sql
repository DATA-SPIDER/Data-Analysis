use [OtoMotors]
go
drop table if exists test
create table dbo.test (
	Product_Inner_Code varchar (132), 
	SumOfNetRevenue float,
	SoldProductQuantity int
)
insert into test
select Product_Inner_Code, 
	sum (net_Revenue) as SumOfNetRevenue,
	count (Product_Inner_Code) as SoldProductQuantity
from [Report for OTO MOTORS - Sales on ebay]
where month(date) in (12,01,02,03)
group by Product_Inner_Code

select * 
from [Report for OTO MOTORS - Sales on ebay]
where Product_Inner_Code is null

delete from [Report for OTO MOTORS - Sales on ebay]
where Product_Inner_Code is null

select * from [Report for OTO MOTORS - Sales on ebay]
select * from test;