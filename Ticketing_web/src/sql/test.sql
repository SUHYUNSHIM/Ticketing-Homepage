create table member(
    id varchar2(20) primary key,
    pw varchar2(20) not null,
    name varchar2(20) not null,
    email varchar2(30) not null
);

commit;

insert into member values('suhyun','1234','수현','aa@naver.com');
select * from member;
-------------------------------------------------------------------
create table performance(
    p_name varchar2(30) primary key,
    cast varchar2(50),
    p_desc varchar2(50)
);
commit;
insert into performance values('마리앙뚜아네트','김주연,이조연,박조연','image/url');
commit;
select * from performance;
----------------------------------------------------------------------

