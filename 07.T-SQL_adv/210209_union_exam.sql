--union(전혀 관계없는 table들의 결합)
select clubName as bName, buildingNum as bLocation from clubTBL
union
select stdName, region from stdTBL;


--union all
select stdName, region from stdTBL
union all
select stdName, region from stdTBL; 