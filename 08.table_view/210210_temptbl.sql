use tableDB;
go

create table #tempTBL(id int, txt nvarchar(10));
create table ##tempTBL(id int, txt nvarchar(10));

insert into #tempTBL values (1, '�����ӽ����̺�');
insert into ##tempTBL values (2, '�����ӽ����̺�');
go

select * from #tempTBL;
select * from ##tempTBL;