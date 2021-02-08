--testTBL insert query
use sqlDB;
go

--DML 중 select
select * from testTBL1;

--DML 중 insert
insert into testTBL1 values(1, '홍길동', 25);
insert into testTBL1 (id, userName) values (2, '이태경');
insert into testTBL1 (id, userName) values (3, '홍길순');
insert into testTBL1 (age, id) values (30, 4);
--insert into testTBL1(userName, age) values ('설현', 23) --에러(pk값이 없기 때문에 실행 안됨)

insert into testTBL1 values ('성시경', 40);

exec sp_help 'testTBL1';


--현재 테이블의 가장 최신의 id를 조회할 때
select IDENT_CURRENT('testTBL1');
select @@IDENTITY;


select * from BikeStores.sales.order_items;
select * from ShopDB.dbo.memberTbl;


--sales.order_itmes 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
	);

insert into sales_order_items
select * from BikeStores.sales.order_items;

select * from sales_order_items;


--update
select * from testTBL1;

update testTBL1	
   set userName = '성수경', 
       age = 45
 where id=6;

delete from testTBL1 where id = 11;


use BikeStores;
go

select * from sales.customers
 where last_name like 'S%'
 and state = 'NY'
 and phone is not null
 order by first_name;

