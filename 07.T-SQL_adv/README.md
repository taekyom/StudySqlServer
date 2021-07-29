## DB Join 정리
#### 💊 Join이란?<br/>
둘 이상의 테이블을 연결해서 데이터를 검색하는 방법<br/>
연결을 하기 위해서는 테이블들이 적어도 하나의 컬럼을 공유해야 하고 이 컬럼을 PK 또는 FK값으로 설정<br/>

#### 💊 Join의 종류<br/>
![image](https://user-images.githubusercontent.com/77951868/127413936-543d5da4-d8d3-458b-9b70-01bc4cdfb83c.png)<br/>
1. INNER JOIN
- 키 값이 있는 테이블의 컬럼 값을 비교 후 조건에 맞는 값을 가져오는 것
- 서로 연관된 내용만 검색하는 조인 방법
```sqL
select s.id, s.stdName, c.clubName, c.buildingNum
  from clubTBL as C
inner join clubregTBL as r
   on r.club_id = c.id
inner join stdTBL as s
   on s.id = r.std_id;
```

2. LEFT/RIGHT JOIN 
- LEFT JOIN : 왼쪽에 있는 테이블이 JOIN기준 
- RIGHT JOIN : 오른쪽에 있는 테이블이 JOIN기준 
```sqL
select * 
  from stdTBL as s
  left outer join clubregTbl as r
    on s.id=r.std_id
  right outer join clubTBL as c
    on r.club_id = c.id;
```
3. FULL OUTER JOIN
- JOIN하려는 테이블을 합쳐서 모든 데이터 조회
- JOIN이 되면 해당값을 표시, JOIN이 안되면 NULL로 표시
```sqL
select * 
  from stdTBL as s
  FULL OUTER JOIN clubTBL as c
    on s.id = c.id;
```

---------------------------------------------------------

## DB UNION/UNION ALL 정리
#### 💊 UNION이란?<br/>
두 개 이상의 SELECT 문의 결과 집합을 결합하는 데 사용되는 명령<br/>
합친 결과에서 중복되는 행은 하나만 표시<br/>

#### 💊 UNION 생성조건<br/>
- UNION 내의 각 SELECT 문은 같은 수의 열을 가져야 한다.
- 열은 유사한 데이터 형식을 가져야 한다.
- 각 SELECT 문의 열은 또한 동일한 순서로 있어야 한다.
```sqL
select clubName as bName, buildingNum as bLocation from clubTBL
union
select stdName, region from stdTBL;
```

#### 💊 UNION ALL이란?<br/>
두 SQL 문의 결과를 결합하는데 사용되는 명령<br/>
데이터 값이 중복되더라도 조건이 일치하는 데이터를 모두 표시하는 것이 UNION과의 차이점<br/>

```sqL
select stdName, region from stdTBL
union all
select stdName, region from stdTBL; 
```





