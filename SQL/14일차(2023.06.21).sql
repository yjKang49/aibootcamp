/* 2023.06.21 */

/*between A and B*/
select name, birthdate from student where birthdate between '81/01/01' and '83/12/31';

/* column in (  ) : column �ȿ� (�ش系��, �ش系��, ...)  */
select name, grade, deptno from student where deptno in (102, 201);

/* ���ڸ� ã�� �� ��������ǥ ' ' �� ���. ū ����ǥ ���� ������. ū ����ǥ " " �� ����(alias) ������ �� ���*/
select empno, ename, sal, job from emp where (sal between 1500 and 5000) and job NOT IN ('PRESIDENT', 'ANALYSIS');
select empno, ename, sal, job from emp where (sal between 1500 and 5000) and job IN ('PRESIDENT', 'ANALYSIS');

/*Į���� ����� ���ڿ� �߿��� like �����ڿ��� ������ �������ϰ� �κ������� ��ġ�ϸ� ���� �Ǵ� ������*/
select name, grade, deptno from student where name like '��%';
select name, grade, deptno from student where name like '%��';

/* �����( _ ) �� �� ���ڸ� �ǹ�. ��x�� �� ���ڿ��� ã��*/
select name, grade, deptno from student where name like '��_��';

select * from student;
select name, grade, deptno, idnum from student where idnum like '______2%';

/* ESCAPE �ɼ��� LIKE �����ڿ��� ����ϴ� ���ϵ幮��(%,_) ��ü�� �����ϴ� ���ڿ��� �˻��� ��, ���ϵ幮�ڸ� �Ϲݹ���ó�� ����ϱ� ���� �ɼ� */
insert into student (studno, name) values (33333, 'Ȳ��_��ȣ');
select * from student where studno = 33333;   /* Ȯ�� */
select name from student where name like 'Ȳ��\_%' escape '\';

/* NULL�� ���� */
select empno, sal, comm from emp;
select empno, sal + comm from emp;
select empno, sal, comm, sal + comm from emp;

/* NVL, NVL2 */
/* NVL: NULL �� ��츸 ������ ������ ��ġ�ϴ� �Լ�. NVL(NULL �Ǵܴ��, 'NULL �϶� ��ü��' )*/
/* NVL2: NULL �� ���ο� ���� ������ ������ ��ġ�ϴ� �Լ�. NVL2(NULL �Ǵܴ��, 'NOT NULL�϶� ��ü��', 'NULL �϶� ��ü��) */
SELECT NAME, POSITION, COMM FROM PROFESSOR;

/* IS NULL, IS NOT NULL*/
SELECT NAME, POSITION, COMM FROM PROFESSOR WHERE COMM = NULL;   -- COMM �÷��� ���ڿ��� NULL�� ���� ���
SELECT NAME, POSITION, COMM FROM PROFESSOR WHERE COMM IS NULL;  -- COMM �÷��� NULL�� ���� ���

-- 1. ��� ���̺��� 
-- Ŀ�̼��� ���� �ʰ� �޿��� 2500�̻��̰� �̸��� ����° A�� �����ϴ� 
-- ����� �̸�, �޿�, Ŀ�̼��� ����ϼ���
SELECT ENAME, SAL, COMM FROM EMP WHERE (SAL >= 2500) AND COMM IS NULL AND (ENAME LIKE '__A%');

-- 2. employees ���̺��� Ŀ�̼��� ���� �ʰ� , �޿��� 2500 �̻��̰� �۽�Ʈ������ ����° e�� �����ϴ� ����� �۽�Ʈ����, �޿�, Ŀ�̼��� ����ϼ���
desc employees;

select first_name, salary, commission_pct 
from employees 
where (salary >= 2500) 
and commission_pct is null 
and first_name like '__e%';

select name, sal, comm, sal+comm sal_com
from professor;  -- comm �� null�̸� cal+comm�� null�̴�.

/*������ �켱����*/
select name, grade, deptno
from student
where deptno = 102 
and (grade = '1' or grade = '4');

/* ���� ���� */
create table stud_heavy
as select * from student
where weight >=70 and grade = '1';

create table stud_101
as select * from student 
where deptno = 101 and grade = '1';

select * from stud_heavy;
select * From stud_101;

/*union ������ ���� ������ ���ƾ��Ѵ�.*/
select studno, name from stud_heavy
union 
select studno, name from stud_101;

/*union all������ �ߺ��Ǵ� �൵ ���*/
select studno, name from stud_heavy
union all
select studno, name from stud_101;

/*union�� �ϴµ� �÷��� ���� �ٸ��� ������ null�� �Ǵ� 0�� �־�����ϸ� null as column�� from ���̺�� �Ǵ� 0 as column��*/
select name, userid, 0 as sal from student    /* null�� ä����� �ϸ�, null as sal from student �ϸ� ��*/
union 
select name, userid, sal from professor;

/* ������ */
select name from stud_heavy 
intersect
select name from stud_101;

/*������*/
select studno �й�, name �̸�
from stud_heavy
minus
select studno, name
from stud_101;

select studno �й�, name �̸� from stud_101
minus 
select studno, name from stud_heavy;

/* ���� ���̺�����ü ������ �޿��� �λ��ϱ� ���� ��������� ����Ϸ��� �Ѵ�. minus ������ ����Ͽ� ������ ���Ӱ����� ������� ��ܿ��� �����ϼ���.*/
desc professor;
select name, position from professor 
minus 
select name, position from professor where position = '���Ӱ���';

/* ����(sort) - order by */
select name, grade, tel 
from student 
order by name;

select name, grade, tel 
from student 
order by grade desc;

/* ��� ����� �̸��� �޿� �� �μ���ȣ�� ����ϴµ�, �μ���ȣ�� ����� ������ ���� �޿��� ���ؼ��� ������������ �����϶� */
select ename, job, deptno, sal from emp
order by deptno, sal desc;    -- �μ���ȣ�� ��������, �޿��� ��������

select ename, job, deptno, sal from emp
order by 3, 4 desc, 1;    -- 3��° Į�� �켱����, �״��� 4��° Į�� ������������, ù��° Į�� ����
--�μ���ȣ�� 10�Ǵ� 30�̰� �μ���ȣ�� �̸��� �������� �����Ͽ� �����̸��� �μ���ȣ ���
select ename, deptno from emp where deptno in (10, 30) order by deptno, ename;
-- ���� �̸�, ������� ���. �� 89�⿡ �Ի�
select ename, hiredate from emp where hiredate like '89%'; 
-- ���ʽ��� �޴� ��� ����� ���ؼ� �̸�, �޿� �׸��� ���ʽ��� ����ϴ� ���ǹ��� �����϶�. �� �޿��� ���ʽ��� ���ؼ� �������� ����
select  ename, sal, comm from emp where comm is not null and comm != 0 order by sal desc, comm desc;
-- ���ʽ��� �޿��� 20% �̻��̰� �μ���ȣ�� 30�� ���� ��� ����� ���ؼ� �̸�, �޿� �׸��� ���ʽ��� ����ϴ� ���ǹ��� ����
select ename, sal, comm from emp where comm >= sal*0.2 and deptno = 30;

select EMPNO AS ���, ENAME AS "����� �̸�", JOB AS ����, SAL AS �޿� FROM EMP 
where (sal between 1600 and 5000) and (JOB NOT IN ('PRESIDENT', 'ANALYST')) AND COMM >= SAL*0.1
ORDER BY JOB DESC, SAL DESC;

create table ex_type ( c char(10), v varchar2(10));
insert into ex_type values ( 'sql', 'sql');
desc ex_type;
select * from ex_type where c = 'sql';  --desc�� Ȯ���ϱ������� ���̸� �� �� ����.
select * from ex_type where c = v;   --������ Ÿ���� �ٸ��� ������ c=v�� false�� ���´�.
/*
�Ҽ��� NUMBER(precision, scale) �������� �Է�
precision: �Ҽ����� �����ϴ� ��ü �ڸ���
scale: �Ҽ����� �ڸ���
*/
select sysdate from dual;   --sysdate: �ý����� ��¥�� �ð� ��ȯ

-- rowid�� �����ͺ��̽� ��ü���� �ߺ����� �ʴ� ������ ��.Ư�� ���ڵ忡 �������� �������ϱ� ����.����������
select rowid, empno, ename from emp;
select rowid, empno ename from emp where rowid = 'AAAE5oAAEAAAAGsAAA';
select rowid, name from professor;    -- rowid ��� �������� ����
select rowid, name from student;

-- rownum: ���� �����Ϳ��� ��� �Ǹ� ������ �����޶�� �Ҷ� ���)
-- timestamp ������Ÿ��
create table ex_time
(id     number(2),
basictime   timestamp,
standardtime    timestamp with time zone,
localtime       timestamp with local time zone);
insert into ex_time values(1, sysdate, sysdate, sysdate);
set linesize 300    -- line�� ���̸� ����. ����ϴ� ���̺��� ũ�⿡ ����
select * from ex_time;

/* DUAL ���̺� 
������ ��ųʸ��� �Բ� oracle�� ���� �ڵ����� �����Ǵ� ���̺��̴�. ����� SYS�� ��Ű���� ������ ��� ����ڴ� DUAL�̶�� �̸����� ������ �� �ִ�. 
sys �� ������ ���̺� �����Ͱ� �ִ� ���̺��� �������� �ʴ� �����, �ǻ翭, ǥ���� ���� ���� �� �ѹ��� �����ų� 
���糯¥, �ð��� �˰����� �� �Ͻ��� ���, ��¥ ���� � �ַ� ���
�ӵ��� ������ ������
*/
select dummy from dual;
select 20*30 from student;   --sql�� �ݵ�� ���̺� �ʿ�
select 20*30 from dual;
select sysdate from dual;
--����, ����, ���� �ⷰ
select sysdate-1 as YESTERDAY, sysdate as TODAY, sysdate+1 as TOMORROW from dual;

/* initcap�Լ�: �μ��� �ԷµǴ� Į���̳� ǥ������ ���ڿ����� ù��° �����ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ� */
initcap(empr | column)
select name, userid, initcap(userid) from student where name = '�迵��';

select * from emp;
select empno, ename from emp where initcap(ename) = 'Smith';   --ename�� ��� �����͸� �ٲ���� ��

/* lower�Լ�, upper�Լ�*/
select userid, lower(userid),upper(userid) from student where studno = 20101;
select ename, job, deptno from emp where lower(job) = 'manager' order by ename;

/* length �Լ� */
select dname, length(dname), lengthb(dname) from department;    --length�� ���ڼ�, lengthb�� ����Ʈ���� ��ȯ�Ѵ�

--����Ŭ���� ĳ���� ���� AL32UTF8 �ΰ�� �ѱ��� �� �ڴ� 3����Ʈ�� �ν��Ѵ�
--���� ĳ���ͼ� Ȯ��
SELECT *
FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

-- CONCAT �Լ�: ù��° ���ڿ� �ι��� ���ڸ� ����
SELECT CONCAT(CONCAT(CONCAT(NAME, '�� ��å�� '), POSITION),'�̴�') FROM PROFESSOR;

-- SUBSTR �Լ�: ���ڿ��� �Ϻθ� �����ϴ� �Լ� (�߿�). SUBSTR(column��, �����ϴ� �ε���, ���ⰳ��)
SELECT NAME, IDNUM, SUBSTR(IDNUM, 1,6) BIRTH_DATE, SUBSTR(IDNUM, 3,2) BIRTH_MON
FROM STUDENT 
WHERE GRADE = '1' AND SUBSTR(idnum, 7, 1) = 2;  --���л���

select * from emp;
select INITCAP(ename) as Name, LENGTH(ename) as Length from emp 
where substr( ename, 1,1) in ('J','A','M');   -- (J,A,M)�� �ƴ϶� ���� ''�������

-- INSTR('����ڿ�', '�˻�����', �˻�������ġ, ��Ī���Ƚ��)
SELECT DNAME, INSTR(DNAME, '��') FROM DEPARTMENT;

--LPAD, RPAD 
SELECT POSITION, LPAD(position, 10, '*') lpad_position, userid, RPAD(userid, 12, '*') rpad_userid
FROM professor;

-- LTRIM, RTRIM
SELECT LTRIM('xyxXxyLAST WORD', 'xy') FROM DUAL;
SELECT DNAME, RTRIM(dname, '��') from department;

-- round(m,n): m�� �Ҽ��� n�ڸ������� �ݿø�, trunc: ����, mod(m,n): m�� n���� ���� ������, ceil: �ø�, floor: ����
-- ���� ���̺��� 101�а� ������ �ϱ��� ���(�� �ٹ����� 22��) �Ͽ� 
--�Ҽ��� ù°�ڸ��� ��° �ڸ����� �ݿø��� ���� �Ҽ��� ���� ù° �ڸ����� �ݿø�(����)�� ���� ����Ͽ���
select name, sal, sal/22, round(sal/22), round(sal/22, 2), round(sal/22, -1) from professor where deptno = 101;
select name, sal, sal/22, trunc(sal/22), trunc(sal/22,2), trunc(sal/22,2) from professor where deptno = 101;

-- ���� ���̺��� 101�� �а� ������ �޿��� ������������ ���� �������� ����Ͽ� ����Ͽ���
select name, sal, comm, MOD(sal, comm) from professor where deptno = 101;
-- ceil(n), floor(n) : n���� ū ���� ���� ����, n ���� ���� ���� ū ����
select ceil(19.7), floor(12.345) from dual;

--��¥�Լ�
select name, hiredate, hiredate+30, hiredate+60 from professor where profno = 9908;
select sysdate from dual;   --���ó�¥
select profno, hiredate, months_between(sysdate, hiredate) tenure, add_months(hiredate, 6) review from professor
where months_between(sysdate, hiredate) < 365;

/*
1. �л� ���̺��� �̸��� '��'���� ������, ���������� �������� �ʴ� 101�� �а� �л���
���̵�, �̸�, �г�, �а� ��ȣ�� ����ϼ���.
2. MANAGER�̰ų� SALESMAN�̸� �޿��� $1500, $3000 �Ǵ� 5000�� �ƴ� ��� ����� ���ؼ�
�̸�, ����, �׸��� �޿��� ����ϼ���.(����� �Ʒ��� ���� ��������)
 ENAME      JOB              SAL
----------- --------- ----------
 JONES      MANAGER         2975
 BLAKE      MANAGER         2850
             .
             .
3. ��� ���̺��� 2���� �Ի��� ����� ����� ������.(substr ���)
4. ������ 'manager'�� ����� �˻��Ϸ��� �Ʒ��� ���� ���ǹ��� �ۼ��Ͽ�����,'���õ� ���ڵ尡 �����ϴ�.'��� ����
   ������ �����ϰ� ������ 'manager'�� ����� �˻��ϵ��� ���ǹ��� ������ ������.
SELECT 	empno, ename ,job
FROM	emp
WHERE 	job='MANAGER';   manager�� MANAGER�� �ٲ�
5. ��� ���̺��� ��� ��ȣ, �̸�, �޿� �׸��� 12% ������ �޿��� ��� ����ϼ���.(�Ҽ��� 3° �ڸ����� �ݿø�)
(�Ʒ��� ���� ����� ��������)
  EMPNO ENAME             SAL New Salary   Increase
------- ---------- ---------- ---------- ----------
   7369 SMITH             800        960        160
   7499 ALLEN            1600       1920        320
   7521 WARD             1250       1500        250

*/
--1--
select userid, name, grade, deptno from student where name like '%��' and deptno = 101 and profno is null;
--2--
select * from emp;
select ename, job, sal from emp where job in ('MANAGER', 'SALESMAN') AND SAL NOT IN (1500,3000,5000);
--3--
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,4,2) = 02;
--4--
SELECT 	empno, ename ,job
FROM	emp
WHERE 	job='MANAGER';   --manager�� MANAGER�� �ٲ�
--5--
select empno, ename, sal, sal*1.12 as "New Salary", round(sal*1.12 - sal, 2) as "Increase" from emp;