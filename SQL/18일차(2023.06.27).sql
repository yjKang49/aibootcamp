/* [����] 01-14. �ε��� ����.pdf */

CREATE UNIQUE INDEX idx_dept_name 
ON department(dname);
select * from department;

CREATE INDEX idx_stud_birthdate 
ON student(birthdate);
select * from student;

/* �����ε��� */
CREATE INDEX idx_stud_dno_grade
ON student(deptno, grade);

CREATE INDEX fidx_stud_no_name ON student(deptno DESC, name ASC);
/*�Լ���� �ε���*/
CREATE INDEX uppercase_idx ON emp (UPPER(ename));
CREATE INDEX idx_standard_weight ON student((height -100)*0.9);

/* �ε��� ������ Ȯ�� */
SELECT deptno, dname
FROM department
WHERE dname = '�����̵���к�';

/*
�ε��� ������ Ȯ���ϴ� ����� SQL ��û ���ϴ� ��!! Ŀ�ǻ�帮�� ���� �޶�پ �����
sqlplus command line���� ���� �Է�
conn system/manager
grant plustrace to hr;
conn hr/hr;
set autot on   //auto trace �ѱ�
SELECT deptno, dname
FROM department
WHERE dname = '�����̵���к�';
SQL �������� (oracle SQL developer,toad �� ����) F10 �Է��ϸ� �� �� �ִ�.
*/
/* �ε��� ���� */
DROP INDEX IDX_DEPT_NAME;

SELECT NAME, BIRTHDATE
FROM STUDENT
WHERE birthdate = '79/04/02';

drop INDEX idx_stud_birthdate;

SELECT index_name, uniqueness
FROM user_indexes
WHERE table_name = 'STUDENT';

DROP INDEX fidx_stud_no_name;

/* [����] 01-15. ��.pdf */
/* ��(view) */
CREATE or REPLACE VIEW v_stud_dept101 as
SELECT  studno, name, deptno
FROM student
WHERE deptno = 101;
SELECT * FROM v_stud_dept101;

/* ���պ� */

CREATE VIEW v_stud_dept102 AS
SELECT s.studno, s.name, s.grade, d.dname
FROM   student s, department d
WHERE  s.deptno = d.deptno AND s.deptno = 102;
SELECT * FROM v_stud_dept102;

/* �信�� �Լ��� ����ϸ� �ݵ�� �÷������� ����ؾ��Ѵ�.*/
CREATE VIEW v_prof_avg_sal AS
SELECT      deptno, sum(sal) sum_sal, avg(sal) avg_sal
FROM        professor
GROUP BY    deptno;

/* inline �� (�߿�) */
-- �������� FROM�� ���� ���������� ����ϸ� ������ �����ϰ� �ϳ��� �ɰ��� �����س�����.
-- �ζ��� �並 ����Ͽ� �а����� �л����� ��� Ű�� ��� ������, �а� �̸��� ����϶�.
-- from ���� ���������� �ִ� ���� ��� �ζ��� ��
SELECT dname, avg_height, avg_weight
FROM ( SELECT deptno, avg(height) avg_height, avg(weight) avg_weight
        FROM student
        GROUP BY deptno) s, department d
WHERE s.deptno = d.deptno;
/*
�а��� �ִ�Ű�� ���ϰ� �ִ�Ű�� ���� �л���
�а���, �ִ�Ű, �̸�, Ű�� ����ϼ���.(����� �Ʒ�~)
�а���           �ִ�Ű    �̸�     Ű
-------------------------------------
��Ƽ�̵���а�	 177	������ 	177
��ǻ�Ͱ��а�	     186 	������	 	186
���ڰ��а�	     184	������		184
*/
SELECT  d.dname , a.max_height , s.name , s.height
FROM ( SELECT deptno, MAX(height) max_height
       FROM  student
       GROUP BY deptno) a , student s, department d
WHERE s.deptno = a.deptno
AND s.height = a.max_height
AND s.deptno = d.deptno ;
-- USER_VIEWS : ����ڰ� ������ ��� �信 ���� ���Ǹ� ����
SELECT view_name, text
from user_views;

/* ���� ���� */
DROP VIEW V_STUD_DEPT101;
DROP VIEW V_STUD_DEPT102;
DROP VIEW EMP_DETAILS_VIEW;
DROP VIEW V_PROF_AVG_SAL;

/* [����] 01-16. ����ڱ�������.pdf */
-- tiger ��������
CREATE USER tiger IDENTIFIED BY tiger123
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;
/* ���̺����̽� ��ġ 
C:\oraclexe\app\oracle\oradata\XE */
-- tiger���� ���Ѻο�
conn system/manager
grant connect, resource TO tiger;
-- hr �������� ���̺� tiger���� ���ٱ��� �ο�
conn hr/hr
grant select on hr.student to tiger;
conn tiger/tiger123
select * from hr.student;
-- hr �������� ���̺� tiger�� ������ �Ұ�
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
1. encore��� ���̺����̸� �����
2. encore/encore123 ��� ������ ���̺� �����̽��� encore/ temp�� ����ϵ���
3. encore��  hr�� student ���̺��� select �ϵ��� �ϼ���.
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

/* ���� ���� 27p */
SQL> create role rolename identified by rolepassword
/* �� ���� */
SQL> drop role rolename;

/* [����] 01-17. ������ ���ǹ�_2020-03-30.pdf */

SELECT deptno, dname, college
FROM department
START WITH deptno = 10   -- ������ �����ϴ���
CONNECT BY PRIOR deptno = college;

SELECT deptno, dname, college
FROM department 
START WITH deptno = 102
CONNECT BY PRIOR college = deptno;
-- p.11
-- ������ ���ǹ��� ����Ͽ� �μ� ���̺��� �μ� �̸��� �˻��Ͽ� �ܴ�, �к�, �а� ���� top-down �������� ����϶�. 
-- ���۵����ʹ� '��������'�̰� �� �������� ���� 3ĭ �̵��Ͽ� ���. 11page
SELECT LEVEL
, LPAD(' ',(LEVEL - 1)*3) || dname ������
FROM department 
START WITH dname = '��������'
CONNECT BY PRIOR deptno = college;
-- p.14, p.15
SELECT deptno, college, dname, loc
FROM department
WHERE dname != '�����̵���к�'
START WITH college is null
CONNECT BY PRIOR deptno = college
AND dname != '�����̵���к�';

-- ������ ���ǹ��� ����Ͽ� level�� 1�� �ֻ����ο�(Root node)�� ������ ���� �� �ִ�. p.16
SELECT LPAD('   ', 4*(LEVEL-1)) || ename �����
    , empno ���
    , CONNECT_BY_ROOT empno �ֻ������
    , LEVEL
FROM emp
START WITH job = UPPER('President')
CONNECT BY PRIOR empno = mgr;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename �����
    , empno ���
    , CONNECT_BY_ISLEAF Leaf_YN
    , LEVEL
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename �����
    , empno ���
    , SYS_CONNECT_BY_PATH(ename, '/') PATH
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr;

SELECT LEVEL
    , SYS_CONNECT_BY_PATH(ename, '/') PATH
FROM emp
WHERE CONNECT_BY_ISLEAF = 1   -- Leaf Node�� ������
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename �����
    , ename ename2, empno ���, level
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr
ORDER SIBLINGS BY ename;

SELECT LPAD('   ', 4*(LEVEL-1)) || ename �����
    , ename ename2, empno ���, level
FROM emp
START WITH job = UPPER('President')
CONNECT BY NOCYCLE PRIOR empno = mgr
ORDER BY ename;

/*
client ���� host���� network
"C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN\tnsnames.ora"
*/

/*
1. emp, dept ���̺��� ��ȸ�Ͽ� �μ���ȣ�� �μ��� �ִ� �޿�, �μ����� ����� ������.(�ζ��� �並 ���)
    DEPTNO DNAME                               SAL
---------- ---------------------------- ----------
        10 ACCOUNTING                         5000
        20 RESEARCH                            800
        33 SALES                             	 2850
2. EMPNO, ENAME �׸��� DEPTNO ������ �����ϴ� EMP ���̺��� ������ ���ʷ�EMP1 ���̺��� �����ϼ���.
   �� ���̺��� ID, LAST_NAME�� DEPT_ID�� �� �̸��� �����ϼ���.
3. 2.���� ������ EMP1 ���̺��� LAST_NAME �ʵ带 10-->30���� �����ϼ���.
4. system�̳� sys ������  ���̺��� �����ϰ�, �����͸� �ϳ� �Է��϶�.  (4��~7���� sql command line���� ����)
   Name		Null		Type
  --------    -------------   ------------
   ID				NUMBER(7)
   LAST_NAME			VARCHAR2(25)
   FIRST_NAME			VARCHAR2(25)
   DEPT_ID			NUMBER(7)
5.system�� employee���̺� ���� pub_employee��� ���� ���Ǿ �����Ͽ���.
6. 5���� ������ ���� ���Ǿ ���� system������ employee ���̺��� hr ������ ��ȸ�ϵ��� �Ͽ���.
7. ���뵿�Ǿ� pub_employee�� ���� �ϼ���.
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
