--union(���� ������� table���� ����)
select clubName as bName, buildingNum as bLocation from clubTBL
union
select stdName, region from stdTBL;


--union all
select stdName, region from stdTBL
union all
select stdName, region from stdTBL; 