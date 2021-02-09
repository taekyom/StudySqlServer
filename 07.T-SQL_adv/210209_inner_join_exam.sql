/*select * from stdTBL;
select * from clubTBL;
select * from clubregTbl;
*/

--Standard SQL
select s.id, s.stdName, c.clubName, c.buildingNum
  from clubTBL as C
inner join clubregTBL as r
   on r.club_id = c.id
inner join stdTBL as s
   on s.id = r.std_id;


--inner join 약식(SQL server T-SQL)
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdtbL as s, clubregTBL as r, clubtbl as c
 where s.id=r.std_id
   and r.club_id = c.id;


--outer join(외부조인)
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdtbl as s
left outer join clubregTBL as r
   on s.id = r.std_id
left outer join clubtbl as c
   on r.club_id = c.id;


--userTBL / buyTBL
select u.userName, u.addr, b.productName, b.price
  from userTbl as u
  full outer join buyTbl as b
   on u.userID=b.userID;


select * from buyTbl