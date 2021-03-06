/*
use sqlDB;
go
*/

--create table testTBL(num int); --테이블 생성
--drop table testTBL; --테이블 삭제

use tempdb;
go
/*
drop database tableDB;
go
create database tableDB;
*/
use tableDB;
go
drop table buyTBL;
drop table userTBL;
create table userTBL --부모 테이블
(
	userID		char(8)			not null	primary key,					--아이디
	userName	nvarchar(10)	not null,									--이름
	birthYear	int				not null	default year(getdate()),		--출생연도
	addr		nchar(2)		not null	default '서울',					--지역
	mobile1		char(3)			null,										--휴대폰 국번
	mobile2		char(8)			null,										--휴대폰 번호
	height		smallint		null		default 170,					--키
	mDate		date			null,										--회원가입일
	email		varchar(150)	not null	unique							--이메일 추가 210210 14:25 
);
go 
create table buyTBL --자식 테이블
(
	num			int			not null	identity(1, 1)	primary key,		--순번(PK)/자동으로 1씩 증가하는 값
	userID		char(8)		not null
		foreign key references userTBL(userID),								--아이디/userTBL의 userID를 buyTBL의 FK로 지정
	prodName	nchar(6)	not null,										--품명
	groupName	nchar(4)	null,											--분류
	price		int			not null,										--단가
	amount		smallint	not null,										--수량
);
go