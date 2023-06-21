select * from student;  
select * from professor;
select * from department;
select * from salgrade;
select * from tab;   --�� ������ ������ �ִ� ��� ���̺�--

DESC STUDENT;
DESC PROFESSOR;
DESC DEPARTMENT;
SELECT DEPTNO, DNAME, COLLEGE, LOC FROM DEPARTMENT;
SELECT DNAME, DEPTNO FROM DEPARTMENT;
--1--
SELECT STUDNO, NAME, WEIGHT FROM STUDENT;
--2--
SELECT PROFNO, NAME, SAL FROM PROFESSOR;

--DISTINCT �ߺ�����
select distinct deptno from student;
select distinct deptno from professor;
select distinct position from professor; 
select distinct count(position) from professor;
select * from professor;
select distinct deptno, grade from student;

--���� �ο����--
-- original �÷� + ���� +  ����
-- original �÷� + as + ����
select dname dept_name, deptno as DN from department;

--�л� ���̺��� �̸�, �й�, �а� ��ȣ�� ����ϼ���--
desc student;
select name as �̸�, studno as �й�, deptno as �а���ȣ from student;

--�÷� ����ο� ����. �����̳� Ư������ ���Խ� ū����ǥ�� ���Ѵ� --
select dname "Department Name", deptno "�μ���ȣ#" from department;
select name �����̸�, sal "�޿�$", deptno "�а� ��ȣNo" from professor;

--�ռ�(concatenation)������ ( || )
-- �ϳ��� ������ �ٸ� Į��, ��� ǥ���� �Ǵ� ������� �����Ͽ� �ϳ��� Į��ó�� ����� ��쿡 ���.
-- �л� ���̺��� �й��� �̸� Į���� �����Ͽ� "Student"��� �������� �ϳ��� Į��ó�� �����Ͽ� ����Ͽ���
select studno || ' ' || name "Student" from student;

--��� ���̺�(emp)���� �� ���̺��� Employee and Title �̰�, �޸��� �������� ���е�, �̸��� ����(job)�� ����ǵ��� ����ϼ���.
DESC EMP;
SELECT ENAME || ',' || JOB AS "Employee and Title" from emp;

--���������(+,-,*,/)
select name, weight, weight*2.2 as weight_pound from student; --�̸�, ������, �������Ŀ��� ȯ��(1kg=2.2pound)

--������̺�(EMP)���� �����ȣ, �̸�, ����, �޿� �׸��� 22% ������ �޿��� ����ϼ���. ������ �޿��� �� ���̺��� New Salary �Դϴ�.
select empno, ename, job, sal, sal*1.22 as "New Salary", sal*1.22 - sal as increase from emp;

--where ������--
select studno, name, deptno, grade from student where grade = '1';  -- grade�� varchar2(1) ������Ÿ���̹Ƿ� �̰� ��Ȯ�� ��.
select studno, name, deptno, grade from student where grade = 1;   -- ����1�� ''���� �ʾƵ� ��(����Ŭ�� �ڵ���ȯ). ��Ȯ�� ���� �ƴ�.
select * from student where name='������';

select name, position, sal 
from professor 
where position = '�α���';

select studno, name, grade, deptno, weight
from student
where weight <= 70;

select studno, name, weight, deptno from student where grade='1' and weight >= 70; 
select studno, name, weight, deptno, grade from student where (grade = '1' or weight >= 70);  --��ȣ�� ��Ȯ�� ���ִ°� �̷л� ��Ȯ
select name, sal, position from professor where position='����' and sal >=300;

--not ������--
select  studno, name, weight, deptno from student where not deptno = 101;
select  studno, name, weight, deptno from student where not deptno = 101 and weight >= 70;

--sql ������--
--between ������: a between b, in ������: a in [a,b,c,d,...], �����ϴ� ����ã��: like %
select studno, name, weight from student where weight between 50 and 70;

--��������
/*
1. ������̺��� ����� Į���� ������ Name, �޿�*12�� Annual Salary�� �ο��Ͽ� ����� ������. (����� �Ʒ��� ���� ��������)
  Name       Annual Salary
  ---------- -------------
  SMITH               9600
  ALLEN              19200
2. ������̺��� ������ �޿��� �Ʒ��� ���� �������� ����� ������. (����� �Ʒ��� ���� ��������)
  MONTHLY
  --------------------------------------
  SMITH: 1 Month salary = 800
  ALLEN: 1 Month salary = 1600
  WARD: 1 Month salary = 1250
3. 101���� 202�� �а��� ������ �ʴ� ��� ������ �̸��� �а���ȣ�� ����ϼ���.
4. $2850 �̻��� ����� �̸��� �޿��� ����ϼ���.
5. $1250~$2800�� �ް� 20�� �μ��� ������ �ʴ� ����� �̸��� �޿��� ����ϼ���.
���� ���̺��� Employee�� Monthly Salary�� �ϼ���.(����� �Ʒ��� ������)
Employee             Monthly Salary
-------------------- --------------
ALLEN                          1600
WARD                           1250
MARTIN                         1250
CLARK                          2450
TURNER                         1500
MILLER                         1300
*/
--1--
select ename as Name, sal*12 as "Annual Salary" from emp;
--2--
select ename || ': 1 Month Salary = ' || sal as "MONTHLY" FROM EMP;
--3--
select name, deptno from professor where not deptno in (101, 202);
--4--
select ename, sal from emp where sal >= 2850;
--5--
select ename as Employee, sal as "Monthly Salary" from emp where deptno != 20 and (sal between 1250 and 2800);

