--������ ���� ������ ���� ���̺� 
create table PerformInfo(
 pName varchar(20) not null primary key,
 pTime varchar(20),
 pDate date default sysdate,
 pLocate varchar(30),
 total_seat number(10)
);
--ȸ�� ������ ǥ���ϴ� �� �ð��� ��¥�� �� ���� �ִ� �ø���ѹ��� ������ ����ϰ� ����..


--���� �̸��� ���� �ܿ��� ������ ���� ���̺� 
create table seatInfo(
 pName varchar(20), 
 vip_seat number(10),
 r_seat number(10),
 s_seat number(10)
);

--pk, fk ���� ���� �����ؾ� ��.