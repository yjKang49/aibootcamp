/* [기초] 01-14. 인덱스 관리.pdf */

CREATE UNIQUE INDEX idx_dept_name 
ON department(dname);
select * from department;

CREATE INDEX idx_stud_birthdate 
ON student(birthdate);
select * from student;

/* 결합인덱스 */
CREATE INDEX idx_stud_dno_grade
ON student(deptno, grade);

CREATE INDEX fidx_stud_no_name ON student(deptno DESC, name ASC);
/*함수기반 인덱스*/
CREATE INDEX uppercase_idx ON emp (UPPER(ename));
CREATE INDEX idx_standard_weight ON student((height -100)*0.9);

/* 인덱스 실행경로 확인 */
SELECT deptno, dname
FROM department
WHERE dname = '정보미디어학부';

/*
인덱스 실행경로 확인하는 사람은 SQL 엄청 잘하는 분!! 커피사드리고 옆에 달라붙어서 배워라
sqlplus command line에서 밑을 입력
conn system/manager
grant plustrace to hr;
conn hr/hr;
set autot on   //auto trace 켜기
SELECT deptno, dname
FROM department
WHERE dname = '정보미디어학부';
SQL 툴에서는 (oracle SQL developer,toad 와 같은) F10 입력하면 알 수 있다.
*/
/* 인덱스 삭제 */
DROP INDEX IDX_DEPT_NAME;

SELECT NAME, BIRTHDATE
FROM STUDENT
WHERE birthdate = '79/04/02';

drop INDEX idx_stud_birthdate;

SELECT index_name, uniqueness
FROM user_indexes
WHERE table_name = 'STUDENT';

DROP INDEX fidx_stud_no_name;

/* [기초] 01-15. 뷰.pdf */
/* 뷰(view) */
CREATE or REPLACE VIEW v_stud_dept101 as
SELECT  studno, name, deptno
FROM student
WHERE deptno = 101;
SELECT * FROM v_stud_dept101;

/* 복합뷰 */

CREATE VIEW v_stud_dept102 AS
SELECT s.studno, s.name, s.grade, d.dname
FROM   student s, department d
WHERE  s.deptno = d.deptno AND s.deptno = 102;
SELECT * FROM v_stud_dept102;

/* 뷰에서 함수를 사용하면 반드시 컬럼별명을 사용해야한다.*/
CREATE VIEW v_prof_avg_sal AS
SELECT      deptno, sum(sal) sum_sal, avg(sal) avg_sal
FROM        professor
GROUP BY    deptno;

/* inline 뷰 (중요) */
-- 에러나면 FROM절 안의 서브쿼리를 출력하며 오류를 점검하고 하나씩 쪼개서 검토해나간다.
-- 인라인 뷰를 사용하여 학과별로 학생들의 평균 키와 평균 몸무게, 학과 이름을 출력하라.
-- from 절에 서브쿼리가 있는 것은 모두 인라인 뷰
SELECT dname, avg_height, avg_weight
FROM ( SELECT deptno, avg(height) avg_height, avg(weight) avg_weight
        FROM student
        GROUP BY deptno) s, department d
WHERE s.deptno = d.deptno;
/*
학과별 최대키를 구하고 최대키를 가진 학생의
학과명, 최대키, 이름, 키를 출력하세요.(결과는 아래~)
학과명           최대키    이름     키
-------------------------------------
멀티미디어학과	 177	오유석 	177
컴퓨터공학과	     186 	서재진	 	186
전자공학과	     184	조명훈		184
*/
SELECT  d.dname , a.max_height , s.name , s.height
FROM ( SELECT deptno, MAX(height) max_height
       FROM  student
       GROUP BY deptno) a , student s, department d
WHERE s.deptno = a.deptno
AND s.height = a.max_height
AND s.deptno = d.deptno ;
-- USER_VIEWS : 사용자가 생성한 모든 뷰에 대한 정의를 저장
SELECT view_name, text
from user_views;

/* 뷰의 삭제 */
DROP VIEW V_STUD_DEPT101;
DROP VIEW V_STUD_DEPT102;
DROP VIEW EMP_DETAILS_VIEW;
DROP VIEW V_PROF_AVG_SAL;

/* [기초] 01-16. 사용자권한제어.pdf */
-- tiger 계정생성
CREATE USER tiger IDENTIFIED BY tiger123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;
/* 테이블스페이스 위치 
C:\oraclexe\app\oracle\oradata\XE */
-- tiger에게 권한부여
conn system/manager
grant connect, resource TO tiger;
-- hr 소유자의 테이블 tiger에게 접근권한 부여
conn hr/hr
grant select on hr.student to tiger;
conn tiger/tiger123
select * from hr.student;
-- hr 소유자의 테이블 tiger가 수정은 불가
/*
SQL> conn hr/hr
Connected.
SQL> grant update(height, weight) on student to tiger;

Grant succeeded.

SQL> conn tiger/tiger123
Connected.
SQL> update hr.student
  2  set height = 180, weight = 80
  3  where deptno = 101;

0 rows updated.
*/


CREATE USER encore IDENTIFIED BY encore123
DEFAULT TABLESPACE encore
TEMPORARY TABLESPACE temp;

/*
1. encore라는 테이블스페이를 만들고
2. encore/encore123 라는 유저가 테이블 스페이스는 encore/ temp를 사용하도록
3. encore가  hr의 student 테이블을 select 하도록 하세요.
*/
SQL> conn system/manager;
SQL> create tablespace encore
  2  datafile 'C:\oraclexe\app\oracle\oradata\XE\encore.dbf' size 100m;
SQL> CREATE USER encore IDENTIFIED BY encore123
  2  DEFAULT TABLESPACE encore
  3  TEMPORARY TABLESPACE temp;
SQL> grant connect, resource TO encore;
SQL> conn hr/hr
SQL> grant select on hr.student to encore;
SQL> conn encore/encore123
SQL> select * from hr.student;

/* 롤의 생성 27p */
SQL> create role rolename identified by rolepassword
/* 롤 삭제 */
SQL> drop role rolename;

/* [기초] 01-17. 계층적 질의문_2020-03-30.pdf */

SELECT deptno, dname, college
FROM department
START WITH deptno = 10   -- 어디부터 시작하는지
CONNECT BY PRIOR deptno = college;

SELECT deptno, dname, college
FROM department 
START WITH deptno = 102
CONNECT BY PRIOR college = deptno;
-- p.11
-- 계층적 질의문을 사용하여 부서 테이블에서 부서 이름을 검색하여 단대, 학부, 학과 순의 top-down 형식으로 출력하라. 
-- 시작데이터는 '공과대학'이고 각 레벨별로 우측 3칸 이동하여 출력. 11page
SELECT LEVEL
, LPAD(' ',(LEVEL - 1)*3) || dname 조직도
FROM department 
START WITH dname = '공과대학'
CONNECT BY PRIOR deptno = college;
-- p.14, p.15
SELECT deptno, college, dname, loc
FROM department
WHERE dname != '정보미디어학부'
START WITH college is null
CONNECT BY PRIOR deptno = college
AND dname != '정보미디어학부';

-- 계층적 질의문을 사용하여 level이 1인 최상위로우(Root node)의 정보를 얻어올 수 있다. p.16
SELECT LPAD('   ', 4*(LEVEL-1)) || ename 사원명
    , empno 사번
    , CONNECT_BY_ROOT empno 최상위사번
    , LEVEL
FROM emp
START WITH job = UPPER('President')
CONNECT BY PRIOR empno = mgr;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename 사원명
    , empno 사번
    , CONNECT_BY_ISLEAF Leaf_YN
    , LEVEL
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename 사원명
    , empno 사번
    , SYS_CONNECT_BY_PATH(ename, '/') PATH
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr;

SELECT LEVEL
    , SYS_CONNECT_BY_PATH(ename, '/') PATH
FROM emp
WHERE CONNECT_BY_ISLEAF = 1   -- Leaf Node만 선택함
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename 사원명
    , ename ename2, empno 사번, level
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr
ORDER SIBLINGS BY ename;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename 사원명
    , ename ename2, empno 사번, level
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr
ORDER BY ename;

/*
client 측의 host정보 network
"C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\tnsnames.ora"
*/

/*
1. emp, dept 테이블을 조회하여 부서번호와 부서별 최대 급여, 부서명을 출력해 보세요.(인라인 뷰를 사용)
    DEPTNO DNAME                               SAL
---------- ---------------------------- ----------
        10 ACCOUNTING                         5000
        20 RESEARCH                            800
        33 SALES                             	 2850
2. EMPNO, ENAME 그리고 DEPTNO 열만을 포함하는 EMP 테이블의 구조를 기초로EMP1 테이블을 생성하세요.
   새 테이블에서 ID, LAST_NAME과 DEPT_ID로 열 이름을 지정하세요.
3. 2.에서 생성한 EMP1 테이블에서 LAST_NAME 필드를 10-->30으로 수정하세요.
4. system이나 sys 소유의  테이블을 생성하고, 데이터를 하나 입력하라.  (4번~7번은 sql command line에서 실행)
   Name		Null		Type
  --------    -------------   ------------
   ID				NUMBER(7)
   LAST_NAME			VARCHAR2(25)
   FIRST_NAME			VARCHAR2(25)
   DEPT_ID			NUMBER(7)
5.system의 employee테이블에 대해 pub_employee라는 공용 동의어를 생성하여라.
6. 5에서 생성한 공용 동의어에 의해 system소유의 employee 테이블을 hr 유저가 조회하도록 하여라.
7. 공용동의어 pub_employee를 삭제 하세요.
*/
-- 1 --
SELECT e.deptno,  d.dname , SAL
FROM ( SELECT deptno, MAX(sal) SAL
        FROM emp
        GROUP BY deptno) e, dept d
where e.deptno = d.deptno
ORDER BY DEPTNO;

-- 2 -- 
CREATE TABLE EMP1 AS 
SELECT EMPNO ID, ENAME LAST_NAME, DEPTNO DEPT_ID
FROM EMP;

SELECT * FROM EMP1;

-- 3 --
DESC EMP1;
ALTER TABLE EMP1 
MODIFY LAST_NAME VARCHAR2(30);

-- 4 --

SQL> conn system/manager
Connected.
SQL> CREATE TABLE employee
  2  ( ID  NUMBER(7),
  3  LAST_NAME VARCHAR2(25),
  4  FIRST_NAME VARCHAR2(25),
  5  DEPT_ID NUMBER(7));

Table created.

SQL> SELECT * FROM EMPLOYEE;

no rows selected
SQL> INSERT INTO employee(ID, LAST_NAME, FIRST_NAME, DEPT_ID) VALUES ( 1111, 'cup', 'latte', 1234);

1 row created.

SQL> SELECT * FROM EMPLOYEE;

        ID LAST_NAME
---------- --------------------------------------------------
FIRST_NAME                                            DEPT_ID
-------------------------------------------------- ----------
      1111 cup
latte                                                    1234

--5--
SQL> conn system/manager
Connected.
SQL> create public synonym pub_employee for employee;

Synonym created.

-- 6 -- 
SQL> grant select on employee to hr;

Grant succeeded.

SQL> conn hr/hr
Connected.
SQL> select * from pub_employee;

        ID LAST_NAME
---------- --------------------------------------------------
FIRST_NAME                                            DEPT_ID
-------------------------------------------------- ----------
      1111 cup
latte                                                    1234

-- 7 --
SQL> conn system/manager
Connected.
SQL> drop public synonym pub_employee;

Synonym dropped.
