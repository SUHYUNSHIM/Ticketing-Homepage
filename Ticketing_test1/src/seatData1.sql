--오로지 공연 정보에 대한 테이블 
create table PerformInfo(
 pName varchar(20) not null primary key,
 pTime varchar(20),
 pDate date default sysdate,
 pLocate varchar(30),
 total_seat number(10)
);
--회차 정보를 표시하는 데 시간과 날짜를 한 번에 넣는 시리얼넘버를 만들지 고민하고 있음..


--공연 이름에 따른 잔여석 정보에 대한 테이블 
create table seatInfo(
 pName varchar(20), 
 vip_seat number(10),
 r_seat number(10),
 s_seat number(10)
);

--pk, fk 제약 사항 수정해야 함.