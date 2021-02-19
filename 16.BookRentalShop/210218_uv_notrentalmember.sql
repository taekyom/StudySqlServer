create or alter view uv_nonerentalMember
as
	select r.rentalidx
        --,r.memeberidx
	      ,m.memberName
        --,r.bookidx
	    --,b.cateidx
		  ,c.cateName
		  ,b.bookName
		  ,b.author
		  ,format(r.rentaldt, 'yyyy-MM-dd') as rentalDt
		  ,format(r.returndt, 'yyyy-MM-dd') as returndt
		  ,r.rentalstate
		  ,dbo.ufn_getState(r.rentalState) as '대여상태'
      from rentaltbl as r
	 right outer join memberTBL as m
		on r.memeberidx = m.memberidx
	 left outer join booksTBL as b
		on r.bookidx = b.bookidx
	 left outer join cateTBL as c
		on c.cateidx = b.cateidx
	 where r.rentalidx is null;
go