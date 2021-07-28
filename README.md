# StudySqlServer
SSMS를 사용한 데이터베이스 학습 리포지토리

--------------------------------------------

## DBMS(DataBase Management System)
#### 💊 데이터베이스란?<br/>
대량의 정보를 컴퓨터가 효율적으로 접근할 수 있도록 가공 및 저장한 것<br/>

#### 💊 DBMS란?<br/>
다수의 사용자들이 DB내의 데이터를 접근할 수 있도록 해주는 소프트웨어 도구의 집합<br/>

#### 💊 DBMS를 쓰지 않는다면?<br/>
- 다수의 사람이 데이터를 공유하기 어렵다
- 대량의 데이터를 다루기 어렵다 (txt, xls 등)
- 읽기/쓰기를 자동화하려면 프로그래밍 기술이 필요하다
- 만일의 사고에 대응하기 어렵다 (보안, 백업)

--------------------------------------------

## 관계형 데이터베이스
#### 💊 RDB(Relational Database)란?<br/>
키(key)와 값(value)의 간단한 관계를 2차원 표(테이블) 형식으로 나타낸 데이터베이스<br/>
하나의 데이터베이스 안에는 여러 개의 테이블이 존재 가능<br/>

#### 💊 테이블이란?<br/>
![image](https://user-images.githubusercontent.com/77951868/127244719-7b79d19b-6f7a-4fc8-8e3d-d410b6f8e7e9.png) <br/>
- 테이블은 행(row)과 열(column)로 구성된다
- 테이블의 행은 레코드(record)라고도 부르며, 데이터 한 건에 해당한다
- 테이블의 열에 해당하는 컬럼은 각기 구분하기 쉽게 이름을 붙여 분류한다(ex. name, age, major 등) 
- 각 칼럼은 특정한 데이터 타입을 가진다<br/>

--------------------------------------------

## RDMBS(Relational Database Management System)<br/>
#### 💊 RDMBS(Relational Database Management System)란?<br/>
관계형 데이터베이스를 생성, 갱신, 관리하기 위한 시스템<br/>
레코드 단위로 데이터 읽기/쓰기가 발생<br/>

#### 💊 RDMBS의 특징<br/>
- 일반적으로 클라이언트가 요청을 보내면 서버가 처리해주는 C/S 구조로 되어있다
- 클라이언트가 요청을 보낼 때 주로 사용하는 언어가 SQL 이다.
- 사용자가 데이터를 조회하고 싶을 때에 SQL 문으로 작성한 요청을 RDBMS에 보내면 RDMBS는 요청된 데이터를 반환한다.
- RDMBS는 2차원 표 형태의 데이터를 반환한다.
![image](https://user-images.githubusercontent.com/77951868/127245129-43d3c595-5fb3-4854-831f-0d93c48487e0.png)<br/>

#### 💊 RDMBS의 종류<br/>
어떤 RDBMS를 쓰는지에 따라 SQL 문법이 조금씩 달라질 수 있다. 주로 쓰이는 RDBMS의 종류는 다음과 같다.<br/>
- **Oracle DB** - 가장 오래되었고 높은 신뢰도와 안정성을 가지고 있다. 대규모의 애플리케이션, 은행 업계에서 쓰인다.
- **MySQL** - 오픈 소스로 가장 널리 쓰인다. 웹 개발, PHP를 이용한 개발에 흔히 쓰인다.
- **Maria DB** - MySQL 5.5를 기반으로 만들어져 사용법이 거의 유사하고 호환성도 뛰어나다.
- **PostgreSQL** - 버클리 대학의 프로젝트로 만들어진 오픈 소스 ORDBMS(ORDBMS: 객체-관계형 데이터베이스 관리 시스템)이다. SQL의 확장성과 표준을 준수하고, 풍부한 기능을 지원한다.
- **SQL Server** - 마이크로소프트가 개발한 RDBMS로 윈도우 시스템 환경을 지원한다.
- **SQLite** - DB를 서버가 아닌 파일로 저장하는 DBMS이다. 기기에 가벼운 DB를 저장하는 목적으로 설계되었으며, 대표적으로 안드로이드, iOS, mac OS에서 사용된다.

--------------------------------------------

## SQL (Structured Query Language)<br/>
#### 💊 SQL (Structured Query Language)란?<br/>
RDBMS에 저장된 데이터와 통신하기 위해 필요한 프로그래밍 언어<br/>

#### 💊 SQL 명령어<br/>
- **DDL(Data Definition Language)** -  데이터 정의 언어 
```sql
CREATE TABLE user_tbl(
    userID	char(8) not null primary key, --사용자 아이디, 기본키
    userName	nvarchar(10) not null, --이름
    birthYear	int not null, --출생년도
    addr	nchar(2) not null, --지역
    mobile1		char(3), --휴대폰 국번(010~019)
    mobile2		char(8), --010제외 나머지자리
    height	smallint, --키
);

ALTER TABLE user_tbl ADD COLUMN mDate date;

DROP TABLE user_tbl;
```
- **DML(Data Manipulation Language)** -  데이터 조작 언어, 실질적으로 저장된 데이터에 처리할 때 사용
```
SELECT * from testTBL1;

INSERT INTO testTBL1 values(1, '홍길동', 25);

UPDATE testTBL1	
   SET userName = '성수경', 
       age = 45
 WHERE id=6;

DELETE from testTBL1 
 WHERE id = 11;
```
- **DCL(Data Control Language)** -  데이터 제어 언어
  COMMIT : 
  ROLLBACK :
- **TCL(Transaction Control Language)** -  트랜잭션 제어 언어
![image](https://user-images.githubusercontent.com/77951868/127281365-959e022a-b2c2-41e2-9adb-6e28b1272371.png)<br/>

#### 💊 데이터 타입<br/>
![image](https://user-images.githubusercontent.com/77951868/127281473-95e89c83-0713-4673-8d39-57f694163f45.png)<br/>



