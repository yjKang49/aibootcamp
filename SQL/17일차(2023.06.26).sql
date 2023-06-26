select profno, name, position
from professor
where profno = 9903;

update professor
set position = '부교수'
where profno = 9903;

update student 
set weight = 80
where name = '박동진';

update student 
set (grade, deptno) = (select grade, deptno
                        from student 
                        where studno = 10103)
where studno = 10201;

select studno, grade, deptno
from student 
where studno = 10201;

-- 교수테이블에서 성연희 교수의 직급과 동일 직급을 가진 교수들 중 현재 급여가 350이하인 교수들의 급여를 12% 인상하라.
update professor 
set sal =sal*1.12
where position = (select position from professor where name = '성연희')
and sal >= 350;

--사원테이블(emp)에서 'DALLAS'에 근무하는 사원들의 급여를 100으로 변경하라
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
                WHERE DNAME = '컴퓨터공학과');
SELECT * 
FROM STUDENT 
WHERE DEPTNO = (SELECT DEPTNO 
                FROM DEPARTMENT 
                WHERE DNAME = '컴퓨터공학과');
                
-- 사원테이블에서 'DALLAS'에 근무하는 사원의 정보를 삭제하라
DELETE FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
--- 49 page
CREATE TABLE PROFESSOR_TEMP AS 
SELECT * 
FROM PROFESSOR
WHERE POSITION = '교수';

UPDATE PROFESSOR_TEMP
SET POSITION = '명예교수'
WHERE POSITION = '교수';

INSERT INTO PROFESSOR_TEMP 
VALUES( 9999, '김도경', 'arom21', '전임강사', 200, sysdate, 10, 101);

MERGE INTO PROFESSOR P
USING PROFESSOR_TEMP F
ON (P.PROFNO = F.PROFNO)
WHEN MATCHED THEN 
UPDATE SET P.POSITION = F.POSITION
WHEN NOT MATCHED THEN 
INSERT VALUES( F.PROFNO, F.NAME, F.USERID, F.POSITION, F.SAL, F.HIREDATE, F.COMM, F.DEPTNO);

/* COMMIT 중요! 
해당 트랙젝션에 할당된 CPU, 메모리 자원이 해제됨*/

/* SEQUENCE 
속도가 빠르기 때문에 데이터사전에서 관리. 모든 유저가 접근가능*/
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

/* nextval을 쓰면 중복되지 않는 다음 수를 자동으로 입력해준다. 넘버링*/
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
/* alter 시퀀스 정의 변경*/
alter sequence s_seq maxvalue 200;
-- sequence 정보 전체확인
select * from user_sequences;
/* sequence 삭제*/
drop sequence s_seq_my;
drop sequence s_seq;

/* [기초] 01-12. 테이블관리.pdf */

/* 테이블 생성 CREATE */
CREATE TABLE address
( ID  NUMBER(3),
NAME VARCHAR2(50),
ADDR VARCHAR2(100),
PHONE VARCHAR2(30),
EMAIL VARCHAR2(100) );
/* 해당 계정이 접근할 수 있는 모든 테이블을 확인
SELECT * FROM TAB;  */
SELECT * FROM TAB;
DESC ADDRESS;

INSERT INTO ADDRESS
VALUES(1, 'HGDONG', 'SEOUL', '123-4567', 'gdhong@cwnet.ac.kr');
select * from address;
-- commit은 중요. commit을 일정기간마다 하지 않으면 db가 언제든 롤백할 수 있다는걸 대비하여 cpu, 메모리를 할당해서 쥐고있음. 너무 많이 쌓이면 서버가 죽어버림
commit;   

-- 컬럼명을 바꾸고 테이블 구조와 안의 데이터를 모두 가져와서 생성
create table addr_second(id, name, addr, phone, e_mail)     -- email컬럼을 e_mail로 변경.
as select * from address;
desc addr_second;
select * from addr_second;

-- 테이블 구조만 복사. 데이터는 가져오지x
create table addr_fourth
as select  id, name  from address
where 1=2;    -- 거짓조건이니까 데이터는 아무것도 가져오지 않음.
desc addr_fourth;
select * from addr_fourth;

-- 서브쿼리를 이용한 테이블 생성
create table addr_third
as select id, name from address;
desc addr_third;
select * from addr_third;

/* ALTER 테이블에 컬럼 추가 */
ALTER TABLE ADDRESS
ADD ( BIRTH DATE );   -- birth 컬럼의 데이터타입이 date
SELECT * FROM ADDRESS;
-- 컬럼의 default 값 설정
ALTER TABLE ADDRESS
ADD(COMMENTS VARCHAR2(200) DEFAULT 'No Comment');
/* ALTER 테이블에서 컬럼 삭제 */
ALTER TABLE ADDRESS DROP COLUMN COMMENTS;
DESC ADDRESS;
/* 테이블 칼럼 변경*/
ALTER TABLE ADDRESS 
MODIFY PHONE VARCHAR2(50);
ALTER TABLE ADDRESS MODIFY PHONE VARCHAR2(5);   -- 이미 데이터가 저장되어있는 컬럼은 더 작은 데이터타입으로 변경불가
/* 테이블 명 변경 */
RENAME ADDR_SECOND TO CLIENT_ADDRESS;
SELECT * FROM TAB;

/* 테이블 삭제 */
drop table add_third;
select * from tab where tname = 'ADDR_THIRD';

/* TRUNCATE 명령문. 테이블 구조는 유지되고, 테이블 데이터와 할당된 물리적 공간도 삭제됨*/
TRUNCATE TABLE CLIENT_ADDRESS;

/* 주석추가*/
comment on table address
is '고객 주소록을 관리하기 위한 테이블';

comment on column address.name 
is '고객 이름';

/* [기초] 01-13. 데이터 무결성.pdf */

/* 주석 확인하는 방법 */
-- 테이블 주석
select comments 
from user_tab_comments
where table_name = 'ADDRESS';
-- 컬럼 주석
select * from user_col_comments
where table_name = 'ADDRESS';

/* 주석 삭제*/
--테이블 주석 삭제
COMMENT ON TABLE ADDRESS IS '';
-- 컬럼 주석 삭제
COMMENT ON COLUMN ADDRESS.NAME IS '';

/* USER_ 데이터 사전 뷰*/
SELECT TABLE_NAME FROM USER_TABLES;
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;  -- 소유자 확인 가능. 자기 소유,권한을 부여받은 테이블과같은 접근가능한 모든 테이블 확인 가능
select owner, table_name from dba_tables;  -- 최고관리자만 접근할 수 있는 테이블 확인

/* 참조무결성 제약조건. 외래키가 있는 컬럼 삭제*/
-- 문제: dept에서 30번 부서 삭제하기 
-- 1. dept 에서 30번 부서를 삭제 --error
-- 2. emp에서 30번 부서 소속 사원을 출력
-- 3. dept 테이블에서 33번 sales 부서를 추가
-- 4. emp에서 30번 부서 소속 사원을 33번 부서로 변경
-- 5. dept 테이블에서 30번 부서 삭제
-- 부모테이블: dept 테이블, 자식테이블: emp 테이블
delete dept where deptno=30;  -- 삭제안됨. 자식테이블의 외래키부터 처리. violated - child record found
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
    using index tablespace indx,    -- tablespace indx 가 없을 경우 에러날 수 있다. 밑 참고
subname varchar2(20)
    constraint subject_name_no not null,
term varchar2(1)
    constraint subject_term_ck check (term in ('1', '2')),
type varchar2(1));

/*
DB구축 절차
1. 시스템 구매
2. os 선택
3. DBMS 선택
4. create tablespace
5. create user
6. create table
7. insert data
*/
/*
테이블스페이스 위치
C:\oraclexe\app\oracle\oradata\XE
sql command line 들어가서
create tablespace indx
datafile 'C:\oraclexe\app\oracle\oradata\XE\indx.dbf' size 100m;
입력하면 indx.dbf 가 생성됨. (테이블스페이스)
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
/* USER_CONSTRAINTS 데이터사전에서 데이터 무결성 제약조건 확인*/
select constraint_name, constraint_type
from user_constraints
where table_name in ('SUBJECT','SUGANG');

SELECT * FROM USER_CONSTRAINTS;  -- 무결성 제약조건 확인
-- p.26
ALTER TABLE STUDENT
ADD CONSTRAINT stud_idnum_uk UNIQUE(idnum);
ALTER TABLE STUDENT
MODIFY (name CONSTRAINT stud_name__nn NOT NULL);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT department_deptno_uk UNIQUE(deptno);
-- 외래키 설정
ALTER TABLE student ADD CONSTRAINT stud_deptno_fk 
FOREIGN KEY(deptno) REFERENCES department(deptno);
-- P.27        
ADD CONSTRAINTS PRIMARY KEY DEPT_PK(DEPTNO);
ALTER TABLE DEPARTMENT MODIFY (DNAME NOT NULL);

ALTER TABLE professor ADD CONSTRAINTS prof_pk primary key(profno);
ALTER TABLE professor modify (name NOT NULL);
ALTER TABLE PROFESSOR ADD CONSTRAINTS PROF_FK
FOREIGN KEY(DEPTNO) REFERENCES DEPARTMENT(DEPTNO);

-- 무결성 제약조건 삭제시
SELECT constraint_name, constraint_type
FROM user_constraints
where table_name = 'SUBJECT';

ALTER TABLE SUBJECT
RENAME CONSTRAINT subject_term_ck;

select constraint_name, constraint_type
FROM user_constraints
where table_name = 'SUBJECT'; 
-- 제약조건 이름변경
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
1. 아래와 같이 EE 테이블을 생성하세요.
   Name		Null		Type
  --------       -------------  	        ------------
   EMPLOYEE_ID			NUMBER(7)
   LAST_NAME			VARCHAR2(25)
   FIRST_NAME			VARCHAR2(25)
   DEPTNO			NUMBER(2)
   PHONE_NUMBER			VARCHAR2(20)

2. 1.에서 생성한 테이블에 아래와 같이 4건의 데이터를 입력하세요.
EMPLOYEE_ID	LAST_NAME	FIRST_NAME	DEPTNO		PHONE_NUMBER
----------------------------------------------------------------------------------------------------------
   1    	test1		Ben		  10		123-4566	1100
   2	test2		Betty		  20		123-7890	1860
   3	test3		Chad	 	  20		123-8888	2200
   3	test4		haha	 	  20		123-8888	2200
3. EE 테이블의 EMPLOYEE_ID열에 PRIMARY KEY 제약조건을 추가하세요.
   만약, 제약조건이 걸리지 않는다면 이유를 말하시고, 수정후 제약조건을 추가해 보세요.
4. 위에서 생성한 EE 테이블의 DEPTNO는 DEPT테이블의 DEPTNO 컬럼을 참조하게 제약 조건을 설정해 보세요.
5. INSERT INTO ee(employee_id, first_name, deptno)
   VALUES(4, 'cindy',50);
   데이터를 입력하려고 하였으나 실패하였다. 이유는?
6. 생성한 ee 테이블을 삭제해 보세요.
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
-- 중복되는 데이터가 있으므로 primary key 조건 중 unique key를 만족하지 않음. 
-- 따라서 마지막 데이터의 employee_id를 4로 변경
update EE set employee_id = 4 where last_name = 'test4';
alter table EE 
add constraint EE_id_pk primary key(employee_id);
/* 4 */
ALTER TABLE EE ADD CONSTRAINT ee_deptno_fk 
FOREIGN KEY(deptno) REFERENCES dept(deptno);
/*5*/
/* 부모테이블인 dept테이블의 deptno=50 이 없음. 
integrity constraint (HR.EE_DEPTNO_FK) violated - parent key not found */
INSERT INTO EE(EMPLOYEE_ID, FIRST_NAME, DEPTNO) VALUES(5, 'cindy', 50);  -- 위에서 employee_id에 중복을 피하기 위해 임의로 4를 넣었으므로 

/*6*/
drop table EE;

/* 제약조건 확인*/
select *
from user_constraints
where table_name in ('EE');
