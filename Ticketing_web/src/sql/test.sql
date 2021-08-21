-------------------------------[����� ��������]----------------- 
drop table member;
create table member(
    id varchar2(20) constraint id_pk primary key,
    pw varchar2(20) not null,
    name varchar2(20) not null,
    email varchar2(30) not null
);

commit;

insert into member values('suhyun','1234','����','aa@naver.com');
select * from member;
-----------------------------------[���� ������]----------------------------
drop table performance;
create table performance(
    p_name varchar2(30) constraint p_name_pk primary key,
    cast varchar2(50),
    p_desc varchar2(50)
);
commit;
insert into performance values('�����ӶѾƳ�Ʈ','���ֿ�,������,������','image/url');
commit;
select * from performance;
----------------------------------------[���� ȸ�� ����]----------------------
drop table performance_each;
create table performance_each(
    p_id varchar2(10) primary key, 
    p_name varchar2(30) constraint p_name_fk references performance(p_name),
    p_date date,
    p_time varchar2(10),
    vip number(2),
    r number(3),
    s number(3)     
);
commit;

insert into performance_each values('MA08281400','�����ӶѾƳ�Ʈ',TO_DATE('2021-08-28','yyyy-mm-dd'),'14:00',80,150,150);
select * from performance_each;
---------------------------------[�¼� ����]--------------------------------------
create table member_seat(
    id varchar2(20) constraint id_fk references member(id),
    s_id varchar2(15) UNIQUE,
    p_id varchar2(10) constraint p_id_fk references performance_each(p_id),
    p_name varchar2(30) constraint p_name_seat_fk references performance(p_name)
);
commit;
select * from member_seat;
insert into member_seat(id,p_id,p_name) values('suhyun','MA08281400','�����ӶѾƳ�Ʈ');
---------------------------------------[���� �Ϸ� ����]-------------------------------------------
create table total_ticket(
    ticket_number varchar2(20) primary key,
    user_id varchar2(10) constraint u_id_fk references member(id),
    payment_number varchar2(20)
);
commit;
select * from total_ticket;
----------------[����]------------------------------
create table payment(
    id varchar2(20) constraint id_pay_fk references member(id),
    rcv_ticket varchar2(10),
    pay_ticket varchar2(10),
    total number(6)
);
commit;
select * from payment;

------[�Խ���]-----------------------------





