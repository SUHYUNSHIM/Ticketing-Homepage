--ticketbox 1234 �������� ����
----------------------------[�Խ���]----------------------------------
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
-------------------------------------------[ȸ������]----------------------
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

---------------------------------------------[��������]------------------- 
create table performance(
    p_name varchar2(30) constraint p_name_pk primary key,
    cast varchar2(50),
    p_desc varchar2(50)
);
commit;
insert into performance values('�����ӶѾƳ�Ʈ','���ֿ�,������,������','image/url');
insert into performance values('�����','���ֿ�, ������,������','image/url');
insert into performance values('������Ʈ','���ֿ�, ������, ������','image/url');
select * from performance;
---------------------------------------------[���� ȸ�� ����]-------------------
create table performance_each(
    p_id varchar2(10) primary key, 
    p_name varchar2(30) constraint p_name_fk references performance(p_name),
    p_date date,
    p_time varchar2(10),
    vip number(2),
    r number(3),
    s number(3)     
);
insert into performance_each values('MA08281400','�����ӶѾƳ�Ʈ',TO_DATE('2021-08-28','yyyy-mm-dd'),'14:00',80,150,150);
insert into performance_each values('MA08281800','�����ӶѾƳ�Ʈ',TO_DATE('2021-08-28','yyyy-mm-dd'),'18:00',80,150,150);
insert into performance_each values('MA08251400','�����ӶѾƳ�Ʈ',TO_DATE('2021-08-25','yyyy-mm-dd'),'14:00',80,150,150);
commit;
insert into performance_each values('HE08281400','�����',TO_DATE('2021-08-28','yyyy-mm-dd'),'14:00',80,150,150);
insert into performance_each values('HE08281800','�����',TO_DATE('2021-08-28','yyyy-mm-dd'),'18:00',80,150,150);

insert into performance_each values('MO08281400','������Ʈ',TO_DATE('2021-08-28','yyyy-mm-dd'),'14:00',80,150,150);
insert into performance_each values('MO08281800','������Ʈ',TO_DATE('2021-08-28','yyyy-mm-dd'),'18:00',80,150,150);

select * from performance_each;
commit;
----------------------------------------------[�¼� ���� ]-----------------------------
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
select * from member;
---------------------------------------[���� ����]-------------------------------------------
create table total_ticket(
    ticket_number varchar2(20) primary key,
    user_id varchar2(10) constraint u_id_fk references member(id),
    payment_number varchar2(20)
);
commit;
select * from total_ticket;
------------------------------------[����]--------------------------------------------
create table payment(
    id varchar2(20) constraint id_pay_fk references member(id),
    rcv_ticket varchar2(10),
    pay_ticket varchar2(10),
    total number(6)
);
cnullommit;
select * from payment;
-----------------------------------------------------------------------
select * from member_seat;
update performance_each set VIP = VIP-1 , R = R-1 , S = s-1 
where performance_each.p_id = memer_seat.p_id;
select * from member;
delete from member where name = '����' or name = '�ɼ���';
commit;
select * from performance_each;
select * from member_seat;
commit;
update performance_each set VIP = VIP-0 , R= R-0, S=S-1 
where p_id = 'MA08281400';

