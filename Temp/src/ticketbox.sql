--게시판
create table board(
    aid number(10) primary key not null,
    rid number(10),
    pwd varchar2(50),
    dbsubject varchar2(50),
    dbname varchar2(50),
    dbdate date default sysdate,
    dbhits number(10),
    dbmemo varchar2(500)
);
commit;
--사용자 정보 ----> 아직 이 접속으로 테이블 생성안했음.
CREATE TABLE member(
name varchar2(20), 
id varchar2(20), 
pw varchar2(30), 
phone varchar2(20), 
gender varchar2(10)
);
commit;

--사용자 A-> 로그인시 이름 넘겨오고, 임시로 A라고 주었음. 
create table user_seat(
    user_name varchar2(20),
    seat_name varchar2(30),
    
);