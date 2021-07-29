## Trigger 정리
#### 💊 Trigger란? <br/>
특정 테이블에 DML문(INSERT, UPDATE, DELETE)이 수행되었을 때, DB에서 자동으로 동작하도록 작성된 프로그램<br/>
사용자가 직접 호출하는 것이 아니라, DB에서 자동적으로 호출하는 것이 가장 큰 특징<br/>

#### 💊 Trigger 사용형식 <br/>
```
create[or replace] trigger 트리거명
(before/after) (insert/update/delete) 이벤트
on 테이블명 --이벤트가 발생하는 테이블
[for each row] --실행될 문장 행에 각각 적용
[when 조건식]
begin
               --이벤트 발생 시 실행할 문장(이벤트 처리부)
end;

```

```sql
create trigger trg_testtbl
on testtbl
after insert, delete, update --삭제하고 수정할 때 트리거가 발동
as 
	print '새 트리거 발생!';
insert into testtbl values ('BTS');
select * from testTBL where txt = '마마무';
update testTBL set txt = '마마무 new!' where id = 4;
delete testTBL where id = 3;
```

