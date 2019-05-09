
	create sequence seq_member;
	
	create table member (
		idx number(5) primary key,
		name varchar2(20) not null,
		id varchar2(10) not null,
		email varchar2(50) not null unique,
		password varchar2(20) not null ,
		phone number(30) not null, 
		grade varchar2(20),
		authenticate number(2)
	);
	
	create table MVreply(
		reNo number(10,0) primary key,
		movieNm varchar2(100) not null,
		reply varchar2(1000) not null,
		writer varchar2(50) not null,
		replyDate date default sysdate
	);
	
	