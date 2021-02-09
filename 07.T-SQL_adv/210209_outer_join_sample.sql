--테이블 3개 outer join 
select * 
  from stdTBL as s
  left outer join clubregTbl as r
    on s.id=r.std_id
  right outer join clubTBL as c
    on r.club_id = c.id;

select * 
  from stdTBL as s
  left outer join clubregTbl as r
    on s.id=r.std_id

select *
  from clubregtbl as r
right outer join clubtbl as c
   on r.club_id = c.id;