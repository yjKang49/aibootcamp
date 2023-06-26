select profno, name, position
from professor
where profno = 9903;

update professor
set position = '�α���'
where profno = 9903;

update student 
set weight = 80
where name = '�ڵ���';

update student 
set (grade, deptno) = (select grade, deptno
                        from student 
                        where studno = 10103)
where studno = 10201;

select studno, grade, deptno
from student 
where studno = 10201;

-- �������̺��� ������ ������ ���ް� ���� ������ ���� ������ �� ���� �޿��� 350������ �������� �޿��� 12% �λ��϶�.
update professor 
set sal =sal*1.12
where position = (select position from professor where name = '������')
and sal >= 350;

--������̺�(emp)���� 'DALLAS'�� �ٹ��ϴ� ������� �޿��� 100���� �����϶�
update emp
set emp.sal = 100
where deptno = ( select deptno from dept where loc = 'DALLAS');

DELETE FROM STUDENT;
SELECT * FROM STUDENT;
ROLLBACK;
DELETE FROM STUDENT
WHERE STUDNO = 20103;
COMMIT;

DELETE FROM STUDENT 
WHERE DEPTNO = (SELECT DEPTNO 
                FROM DEPARTMENT
                WHERE DNAME = '��ǻ�Ͱ��а�');
SELECT * 
FROM STUDENT 
WHERE DEPTNO = (SELECT DEPTNO 
                FROM DEPARTMENT 
                WHERE DNAME = '��ǻ�Ͱ��а�');
                
-- ������̺��� 'DALLAS'�� �ٹ��ϴ� ����� ������ �����϶�
DELETE FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
--- 49 page
CREATE TABLE PROFESSOR_TEMP AS 
SELECT * 
FROM PROFESSOR
WHERE POSITION = '����';

UPDATE PROFESSOR_TEMP
SET POSITION = '������'
WHERE POSITION = '����';

INSERT INTO PROFESSOR_TEMP 
VALUES( 9999, '�赵��', 'arom21', '���Ӱ���', 200, sysdate, 10, 101);

MERGE INTO PROFESSOR P
USING PROFESSOR_TEMP F
ON (P.PROFNO = F.PROFNO)
WHEN MATCHED THEN 
UPDATE SET P.POSITION = F.POSITION
WHEN NOT MATCHED THEN 
INSERT VALUES( F.PROFNO, F.NAME, F.USERID, F.POSITION, F.SAL, F.HIREDATE, F.COMM, F.DEPTNO);

/* COMMIT �߿�! 
�ش� Ʈ�����ǿ� �Ҵ�� CPU, �޸� �ڿ��� ������*/

/* SEQUENCE 
�ӵ��� ������ ������ �����ͻ������� ����. ��� ������ ���ٰ���*/
CREATE SEQUENCE s_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 100;

CREATE SEQUENCE s_seq_my
INCREMENT BY 1
START WITH 1
MAXVALUE 1000;

SELECT sequence_name, min_value, max_value, increment_by, last_number
from user_sequences
where sequence_name = 'S_SEQ';

/* nextval�� ���� �ߺ����� �ʴ� ���� ���� �ڵ����� �Է����ش�. �ѹ���*/
insert into emp values
(s_seq.nextval, 'test1', 'SALESMAN', 7698, SYSDATE, 800, NULL, 20);

insert into emp values
(s_seq.nextval, 'test2', 'SALESMAN', 7698, SYSDATE, 800, NULL, 20);

insert into emp values
(s_seq.nextval, 'test3', 'SALESMAN', 7698, SYSDATE, 800, NULL, 20);

select * from emp;

select s_seq.currval
from dual;
select s_seq.nextval
from dual;
/* alter ������ ���� ����*/
alter sequence s_seq maxvalue 200;
-- sequence ���� ��üȮ��
select * from user_sequences;
/* sequence ����*/
drop sequence s_seq_my;
drop sequence s_seq;

/* [����] 01-12. ���̺����.pdf */

/* ���̺� ���� CREATE */
CREATE TABLE address
( ID  NUMBER(3),
NAME VARCHAR2(50),
ADDR VARCHAR2(100),
PHONE VARCHAR2(30),
EMAIL VARCHAR2(100) );
/* �ش� ������ ������ �� �ִ� ��� ���̺��� Ȯ��
SELECT * FROM TAB;  */
SELECT * FROM TAB;
DESC ADDRESS;

INSERT INTO ADDRESS
VALUES(1, 'HGDONG', 'SEOUL', '123-4567', 'gdhong@cwnet.ac.kr');
select * from address;
-- commit�� �߿�. commit�� �����Ⱓ���� ���� ������ db�� ������ �ѹ��� �� �ִٴ°� ����Ͽ� cpu, �޸𸮸� �Ҵ��ؼ� �������. �ʹ� ���� ���̸� ������ �׾����
commit;   

-- �÷����� �ٲٰ� ���̺� ������ ���� �����͸� ��� �����ͼ� ����
create table addr_second(id, name, addr, phone, e_mail)     -- email�÷��� e_mail�� ����.
as select * from address;
desc addr_second;
select * from addr_second;

-- ���̺� ������ ����. �����ʹ� ��������x
create table addr_fourth
as select  id, name  from address
where 1=2;    -- ���������̴ϱ� �����ʹ� �ƹ��͵� �������� ����.
desc addr_fourth;
select * from addr_fourth;

-- ���������� �̿��� ���̺� ����
create table addr_third
as select id, name from address;
desc addr_third;
select * from addr_third;

/* ALTER ���̺� �÷� �߰� */
ALTER TABLE ADDRESS
ADD ( BIRTH DATE );   -- birth �÷��� ������Ÿ���� date
SELECT * FROM ADDRESS;
-- �÷��� default �� ����
ALTER TABLE ADDRESS
ADD(COMMENTS VARCHAR2(200) DEFAULT 'No Comment');
/* ALTER ���̺��� �÷� ���� */
ALTER TABLE ADDRESS DROP COLUMN COMMENTS;
DESC ADDRESS;
/* ���̺� Į�� ����*/
ALTER TABLE ADDRESS 
MODIFY PHONE VARCHAR2(50);
ALTER TABLE ADDRESS MODIFY PHONE VARCHAR2(5);   -- �̹� �����Ͱ� ����Ǿ��ִ� �÷��� �� ���� ������Ÿ������ ����Ұ�
/* ���̺� �� ���� */
RENAME ADDR_SECOND TO CLIENT_ADDRESS;
SELECT * FROM TAB;

/* ���̺� ���� */
drop table add_third;
select * from tab where tname = 'ADDR_THIRD';

/* TRUNCATE ��ɹ�. ���̺� ������ �����ǰ�, ���̺� �����Ϳ� �Ҵ�� ������ ������ ������*/
TRUNCATE TABLE CLIENT_ADDRESS;

/* �ּ��߰�*/
comment on table address
is '�� �ּҷ��� �����ϱ� ���� ���̺�';

comment on column address.name 
is '�� �̸�';

/* [����] 01-13. ������ ���Ἲ.pdf */

/* �ּ� Ȯ���ϴ� ��� */
-- ���̺� �ּ�
select comments 
from user_tab_comments
where table_name = 'ADDRESS';
-- �÷� �ּ�
select * from user_col_comments
where table_name = 'ADDRESS';

/* �ּ� ����*/
--���̺� �ּ� ����
COMMENT ON TABLE ADDRESS IS '';
-- �÷� �ּ� ����
COMMENT ON COLUMN ADDRESS.NAME IS '';

/* USER_ ������ ���� ��*/
SELECT TABLE_NAME FROM USER_TABLES;
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;  -- ������ Ȯ�� ����. �ڱ� ����,������ �ο����� ���̺������ ���ٰ����� ��� ���̺� Ȯ�� ����
select owner, table_name from dba_tables;  -- �ְ�����ڸ� ������ �� �ִ� ���̺� Ȯ��

/* �������Ἲ ��������. �ܷ�Ű�� �ִ� �÷� ����*/
-- ����: dept���� 30�� �μ� �����ϱ� 
-- 1. dept ���� 30�� �μ��� ���� --error
-- 2. emp���� 30�� �μ� �Ҽ� ����� ���
-- 3. dept ���̺��� 33�� sales �μ��� �߰�
-- 4. emp���� 30�� �μ� �Ҽ� ����� 33�� �μ��� ����
-- 5. dept ���̺��� 30�� �μ� ����
-- �θ����̺�: dept ���̺�, �ڽ����̺�: emp ���̺�
delete dept where deptno=30;  -- �����ȵ�. �ڽ����̺��� �ܷ�Ű���� ó��. violated - child record found
select * from emp where deptno = 30;
insert into dept values(33, 'SALES', 'SEOUL');
update emp set deptno = 33 where deptno=30; 
delete from dept where deptno = 30;
select * from dept ;
-- 14page
create table subject
(subno number(5)
    constraint subject_no_pk primary key
    deferrable initially deferred
    using index tablespace indx,    -- tablespace indx �� ���� ��� ������ �� �ִ�. �� ����
subname varchar2(20)
    constraint subject_name_no not null,
term varchar2(1)
    constraint subject_term_ck check (term in ('1', '2')),
type varchar2(1));

/*
DB���� ����
1. �ý��� ����
2. os ����
3. DBMS ����
4. create tablespace
5. create user
6. create table
7. insert data
*/
/*
���̺����̽� ��ġ
C:\oraclexe\app\oracle\oradata\XE
sql command line ����
create tablespace indx
datafile 'C:\oraclexe\app\oracle\oradata\XE\indx.dbf' size 100m;
�Է��ϸ� indx.dbf �� ������. (���̺����̽�)
*/
-- p.23
alter table student 
add constraint stud_no_pk primary key(studno);

create table sugang
(studno number(5)
        constraint sugang_studno_fk references student(studno),
subno number(5)
        constraint sugang_subno_fk references subject(subno),
regdate date,
result number(3),
        constraint sugang_pk primary key(studno, subno));
        
-- p.24
/* USER_CONSTRAINTS �����ͻ������� ������ ���Ἲ �������� Ȯ��*/
select constraint_name, constraint_type
from user_constraints
where table_name in ('SUBJECT','SUGANG');

SELECT * FROM USER_CONSTRAINTS;  -- ���Ἲ �������� Ȯ��
-- p.26
ALTER TABLE STUDENT
ADD CONSTRAINT stud_idnum_uk UNIQUE(idnum);
ALTER TABLE STUDENT
MODIFY (name CONSTRAINT stud_name__nn NOT NULL);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT department_deptno_uk UNIQUE(deptno);
-- �ܷ�Ű ����
ALTER TABLE student ADD CONSTRAINT stud_deptno_fk 
FOREIGN KEY(deptno) REFERENCES department(deptno);
-- P.27        
ADD CONSTRAINTS PRIMARY KEY DEPT_PK(DEPTNO);
ALTER TABLE DEPARTMENT MODIFY (DNAME NOT NULL);

ALTER TABLE professor ADD CONSTRAINTS prof_pk primary key(profno);
ALTER TABLE professor modify (name NOT NULL);
ALTER TABLE PROFESSOR ADD CONSTRAINTS PROF_FK
FOREIGN KEY(DEPTNO) REFERENCES DEPARTMENT(DEPTNO);

-- ���Ἲ �������� ������
SELECT constraint_name, constraint_type
FROM user_constraints
where table_name = 'SUBJECT';

ALTER TABLE SUBJECT
RENAME CONSTRAINT subject_term_ck;

select constraint_name, constraint_type
FROM user_constraints
where table_name = 'SUBJECT'; 
-- �������� �̸�����
alter table SUBJECT
rename constraint SUBJECT_NAME_NO to SUBJECT_NAME_NN;

-- p.35
alter table sugang
disable constraint sugang_Pk;

alter table sugang
disable constraint sugang_studno_fk;

select constraint_name, status
from user_constraints
where table_name in ('SUGANG', 'SUBJECT');

-- p.36
alter table sugang
enable constraint sugang_Pk;

alter table sugang
enable constraint sugang_studno_fk;

select constraint_name, status
from user_constraints
where table_name in ('SUGANG', 'SUBJECT');

/*
1. �Ʒ��� ���� EE ���̺��� �����ϼ���.
   Name		Null		Type
  --------       -------------  	        ------------
   EMPLOYEE_ID			NUMBER(7)
   LAST_NAME			VARCHAR2(25)
   FIRST_NAME			VARCHAR2(25)
   DEPTNO			NUMBER(2)
   PHONE_NUMBER			VARCHAR2(20)

2. 1.���� ������ ���̺� �Ʒ��� ���� 4���� �����͸� �Է��ϼ���.
EMPLOYEE_ID	LAST_NAME	FIRST_NAME	DEPTNO		PHONE_NUMBER
----------------------------------------------------------------------------------------------------------
   1    	test1		Ben		  10		123-4566	1100
   2	test2		Betty		  20		123-7890	1860
   3	test3		Chad	 	  20		123-8888	2200
   3	test4		haha	 	  20		123-8888	2200
3. EE ���̺��� EMPLOYEE_ID���� PRIMARY KEY ���������� �߰��ϼ���.
   ����, ���������� �ɸ��� �ʴ´ٸ� ������ ���Ͻð�, ������ ���������� �߰��� ������.
4. ������ ������ EE ���̺��� DEPTNO�� DEPT���̺��� DEPTNO �÷��� �����ϰ� ���� ������ ������ ������.
5. INSERT INTO ee(employee_id, first_name, deptno)
   VALUES(4, 'cindy',50);
   �����͸� �Է��Ϸ��� �Ͽ����� �����Ͽ���. ������?
6. ������ ee ���̺��� ������ ������.
*/
/* 1 */
CREATE TABLE EE
(
EMPLOYEE_ID  NUMBER(7),
LAST_NAME  VARCHAR2(25),
FIRST_NAME  VARCHAR2(25),
DEPTNO  NUMBER(2),
PHONE_NUMBER  VARCHAR2(20)
);
/* 2 */
INSERT ALL 
INTO EE(EMPLOYEE_ID, LAST_NAME, FIRST_NAME, DEPTNO, PHONE_NUMBER)
VALUES(1, 'test1', 'Ben' , 10, '123-4566 1100')
INTO EE(EMPLOYEE_ID, LAST_NAME, FIRST_NAME, DEPTNO, PHONE_NUMBER)
VALUES(2, 'test2', 'Betty' , 20, '123-7890 1860')
INTO EE(EMPLOYEE_ID, LAST_NAME, FIRST_NAME, DEPTNO, PHONE_NUMBER)
VALUES(3, 'test3', 'Chad' , 20, '123-8888 2200')
INTO EE(EMPLOYEE_ID, LAST_NAME, FIRST_NAME, DEPTNO, PHONE_NUMBER)
VALUES(3, 'test4', 'Haha' , 20, '123-8888 2200')
SELECT * FROM dual;
/* 3 */
-- �ߺ��Ǵ� �����Ͱ� �����Ƿ� primary key ���� �� unique key�� �������� ����. 
-- ���� ������ �������� employee_id�� 4�� ����
update EE set employee_id = 4 where last_name = 'test4';
alter table EE 
add constraint EE_id_pk primary key(employee_id);
/* 4 */
ALTER TABLE EE ADD CONSTRAINT ee_deptno_fk 
FOREIGN KEY(deptno) REFERENCES dept(deptno);
/*5*/
/* �θ����̺��� dept���̺��� deptno=50 �� ����. 
integrity constraint (HR.EE_DEPTNO_FK) violated - parent key not found */
INSERT INTO EE(EMPLOYEE_ID, FIRST_NAME, DEPTNO) VALUES(5, 'cindy', 50);  -- ������ employee_id�� �ߺ��� ���ϱ� ���� ���Ƿ� 4�� �־����Ƿ� 

/*6*/
drop table EE;

/* �������� Ȯ��*/
select *
from user_constraints
where table_name in ('EE');
