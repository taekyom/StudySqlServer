/*select memberID, memberName 
	from membertbl
where memberID like 'D%';*/


--select '1';

use BikeStores;

SELECT * from sales.customers;
select * from production.products;

--DB 조회
EXEC sp_helpdb;

--테이블 조회
exec sp_tables @table_type = "'table'";

--열이름 조회
exec sp_columns @table_name = 'stocks',
			    @table_owner = 'production';