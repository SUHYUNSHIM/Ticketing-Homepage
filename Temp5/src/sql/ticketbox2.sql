drop table temp_selecting;
select * from member;
--------------------------------
create table board(
    aid number(10) primary key not null,
    rid number(10),
    pwd varchar2(50),
    dbsubject varchar2(50),
    dbname varchar2(50),
    dbdate date default sysdate,
    dbhits number(10),
    dbmemo varchar2(500),
    jumsoo varchar2(10)
);
commit;
select * from board;
-------------------------------------------------
drop table member;
CREATE TABLE member(
name varchar2(20), 
id varchar2(20) primary key, 
pw varchar2(30), 
phone varchar2(20), 
gender varchar2(10),
address varchar2(100),
email varchar2(50)
);

----------------------------------공연 정보 테이블------------------------------ 
create table performance(
    p_name varchar2(30) constraint p_name_pk primary key,
    cast varchar2(50),
    p_desc varchar2(50)
);
commit;
insert into performance values('마리앙뚜아네트','김주연,이조연,박조연','image/url');
select * from performance;
--------------------------------공연 회차 테이블--------------------------------
create table performance_each(
    p_id varchar2(10) primary key, 
    p_name varchar2(30) constraint p_name_fk references performance(p_name),
    p_date date,
    p_time varchar2(10),
    vip number(2),
    r number(3),
    s number(3)     
);
insert into performance_each values('MA08281400','마리앙뚜아네트',TO_DATE('2021-08-28','yyyy-mm-dd'),'14:00',80,150,150);
insert into performance_each values('MA08281800','마리앙뚜아네트',TO_DATE('2021-08-28','yyyy-mm-dd'),'18:00',80,150,150);
commit;
select * from performance_each;
commit;
----------------------------------------------좌석 선택 테이블-----------------------------
drop table member_seat;
create table member_seat(
    id varchar2(20) constraint id_fk references member(id),
    s1_id varchar2(30),
    s2_id varchar2(30),
    s3_id varchar2(30),
    p_id varchar2(10) constraint p_id_fk references performance_each(p_id),
    p_name varchar2(30) constraint p_name_seat_fk references performance(p_name)
);

select id from member;

