/* 2023.06.22 */
/* 01-06 SQL �Լ�.pdf */
select sysdate, last_day(sysdate), next_day(sysdate, '��') from dual;
select sysdate, last_day(sysdate), next_day(sysdate, 1) from dual;

/* sysdate�� datetime �����������ε� char�� �ٲ� */
select to_char(sysdate, 'YY/MM/DD HH24:MM:SS') NORMAL, 
        to_char(trunc(sysdate), 'YY/MM/DD HH24:MM:SS') trunc,
        to_char(round(sysdate), 'YY/MM/DD HH24:MM:SS') round   -- round �Լ��� ������ ������ ������ ���
from dual;

select to_char(hiredate, 'YY/MM/DD HH24:MM:SS') hiredate,
        to_char(round(hiredate, 'dd'), 'YY/MM/DD') round_dd,
        to_char(round(hiredate, 'mm'), 'YY/MM/DD') round_mm,
        to_char(round(hiredate, 'yy'), 'YY/MM/DD') round_yy
from professor
where deptno = 101;

-- grade�� varchar Ÿ���ε� 1�� �־ �νĵ�. �������� ������Ÿ�� ��ȯ. ����: �ӵ��� ������.
-- �ش� �÷��� ��Ȯ�� ������Ÿ���� �̿��ؾ� �ӵ��� �������� ����. 
select * from student where grade = 1;   
select * from student where grade = '1';   
desc student;

select studno, birthdate ����, TO_CHAR(birthdate, 'YY-MM') birthdate
from student
where name = '������';

select name, grade, TO_CHAR(birthdate, 'Day Month Mon DD, YYYY') birthdate
from student 
where deptno = 102;

alter session set NLS_LANGUAGE = AMERICAN;
alter session set NLS_LANGUAGE = KOREAN;
DESC SESSION;

/*��¥Ÿ���� ������Ÿ������ ����*/
SELECT NAME, TO_CHAR(hiredate, 'MONTH DD, YYYY HH24:MM:SS PM') HIREDATE
FROM PROFESSOR
WHERE DEPTNO=101;

SELECT name, position, TO_CHAR( hiredate, 'Mon "the" DDTH "of" YYYY' ) HIREDATE
from professor
where deptno = 101;

select name, sal, comm, TO_CHAR((sal + comm)*12, '9,999') annual_sal 
from professor
where comm is not null;

/*
TO_NUMBER �Լ��� ���ڷ� ������ ���ڿ��� ���� �����ͷ� ��ȯ�ϱ� ���� �Լ�
*/
SELECT TO_NUMBER('1') FROM DUAL;


-- 6���̶�� �Է��Ϸ��� alter session set NLS_LANGUAGE = KOREAN; �ؾ���
-- ���ڿ� ��¥�� ���� ���ڿ��� ��¥�����ͷ� �ٲ�
SELECT NAME, HIREDATE 
FROM PROFESSOR 
WHERE HIREDATE = TO_DATE('june 01, 01', 'MONTH DD, YY');   

select sysdate - TO_DATE('19980409', 'YYYY/MM/DD') as "Lived day" from dual; --���ݱ��� ��ĥ ��ҳ���?

SELECT sysdate - TO_DATE('19980409', 'YYYY/MM/DD') as "Lived day", 
    ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE('19980409','YYYY/MM/DD'))) as "Lived month"
from dual;

SELECT TO_CHAR( TO_DATE(SUBSTR(IDNUM,1,6), 'YYMMDD'), 'YY/MM/DD') BIRTHDATE 
FROM student;

/* NVL( expression1, expression2 ) : NULL�� 0�Ǵ� �ٸ� ������ ��ȯ�ϱ� ���� �Լ� 
expression1 �� NULL�� �����ϴ� ǥ���� �Ǵ� Į��
expression2 �� NULL�� ��ü�ϴ� ��
*/ --�߿�
select name, position, sal, comm, sal+comm, sal + NVL(COMM, 0) s1, NVL(sal+comm, sal) s2
from professor
where deptno = 201;

/*
NVL2( expression1, expression2, expression3 ) : 
*/
SELECT name, position, sal, comm, NVL2(comm, sal + comm, sal) total 
FROM professor
WHERE deptno = 102;

SELECT ename, sal, comm, sal + comm, NVL2(COMM, SAL+ COMM, SAL), SAL+NVL(COMM,0)
FROM EMP;

/* ����� �̸�, ���ʽ� ���� ����ϰ� ���ʽ��� ���� �ʴ� ����� 'NO'�� �������� ��*/
select ename, NVL2(COMM, TO_CHAR(COMM), 'NO') comm2
from emp;
desc emp;

/*���� ���̺��� �̸��� ����Ʈ���� ����ھ��̵��� ����Ʈ ���� ���ؼ� ������ null�� ��ȯ�ϰ� ���������� �̸��� ����Ʈ ���� ��ȯ�Ͽ���*/
SELECT NAME, USERID, LENGTHB(name), LENGTHB(userid), 
nullif(LENGTHB(NAME), LENGTHB(USERID)) nullif_result
from professor;

/* COALESCE */
/*���� ���̺��� ���������� null�� �ƴϸ� ���������� ����ϰ�, ���������� null�̰� �޿��� null �� �ƴϸ� �޿��� ���, 
��������� �޿��� null�̸� 0������϶�*/
select name, comm, sal, coalesce(comm, sal, 0) co_result
from professor;

/* DECODE (�߿�)*/
select name, deptno, decode(deptno, 101, '��ǻ�Ͱ��а�', 102, '��Ƽ�̵���а�', 201, '���ڰ��а�', '�����а�') dname
from professor;
/* �л����̺��� �а���ȣ�� �̸�, �а����� ����ϵ� 101�� �а� �л��� 'Computer Science'�� ����ϰ� 
101���� �ƴ� �л����� �а����� 'ETC' ��� */
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, 'Computer Science', 'ETC') �а��� 
FROM STUDENT
WHERE name NOT IN ('Ȳ��_��ȣ', '������');

/* CASE �Լ�(�߿�)
DECODE�� ������ Ȯ���� �Լ�
CASE �Լ������� �������, ���迬��, ������� ���� �پ��� �񱳰� ����
*/
SELECT NAME, DEPTNO, SAL, 
    CASE WHEN DEPTNO = 101 THEN SAL * 0.1
        WHEN DEPTNO = 102 THEN SAL * 0.2
        WHEN DEPTNO = 103 THEN SAL * 0.3
        ELSE 0
    END BONUS
FROM PROFESSOR;

-- �л� ���̺��� �̸�, �¾ ��, �¾ ���� �б⸦ ����ض�
select * from student;
desc student;
select name, substr(birthdate, 4,2) as month, 
        case when substr(birthdate, 4,2) < 4 then '1/4'
        when substr(birthdate, 4,2) < 7 then '2/4'
        when substr(birthdate, 4,2) < 10 then '3/4'
        when substr(birthdate, 4,2) < 13 then '4/4'
    END quarter
    
FROM STUDENT;
-- �ٸ����
SELECT  name, SUBSTR(birthdate, 4, 2) MONTH,
    concat(TO_CHAR(birthdate, 'Q'), '/4') �б�
FROM student;

/* 01-07. Group �Լ�.pdf  */

select count(comm) from professor where deptno = 101;
select count(*) from professor where deptno = 101 and comm is not null;
select count(job) from emp;
select count( distinct (job)) from emp;
select job from emp;
select count(*) from student;

select avg(weight), sum(weight)
from student
where deptno = 101;

select max(height), min(height)
from student 
where deptno = 102;

select studno, name, height, deptno
from student
where deptno = 102
order by height;

-- ��� ����� �ִ�޿�, �����޿�, �԰� �׸��� ��ձ޿��� ����ϼ���.
select max(sal) as Maximum, min(sal) as Mininum, sum(sal) as Sum, round(avg(sal),0) as Average 
from emp;

select stddev(sal), variance(sal)
from professor;
/*
order by ���� select���� ��õ��� �����͵� �� �� ������ 
group by ���� ��õ��� ���� Į���� �׷��Լ��� �Բ� ����� �� ����
*/
select deptno, count(*), count(comm) 
from professor
group by deptno
order by deptno;

select deptno, avg(sal), min(sal), max(sal)
from professor
group by deptno;

select deptno, profno, sal
from professor 
order by deptno;

--18p
select deptno, grade, count(*), round(avg(weight)) 
from student
where deptno is not null
group by deptno, grade
order by deptno;

--21p
select deptno, sum(sal)
from professor
group by rollup(deptno);

--22p
-- rollup�� ���� �׷� ������ 1,2,3 ������ ó���ȴ�.
select deptno, position, count(*)
from professor
group by rollup(deptno, position);
-- cube �Լ�: �Ұ�� ��ü ����
select deptno, position, count(*)
from professor
group by cube(deptno, position);

select deptno, grade, count(*),
        grouping(deptno) grp_dno, 
        grouping(grade) grp_grade
from student 
group by rollup(deptno, grade);

--grouping set
select deptno, grade, null, count(*)
from student 
group by deptno, grade
union all
select deptno, null, to_char(birthdate, 'YYYY'), count(*)
from student 
group by deptno, to_char(birthdate, 'YYYY');
--���� ����
select deptno, grade, to_char(birthdate, 'YYYY') birthdate, count(*)
from student
group by grouping sets((deptno, grade), (deptno, to_char(birthdate, 'YYYY')));

/* having ��*/
select grade, count(*), round(avg(height)) avg_height, round(avg(weight)) avg_weight
from student 
group by grade
order by avg_height desc;

select grade, count(*), round(avg(height)) avg_height, round(avg(weight)) avg_weight
from student
group by grade
having count(*) > 4
order by avg_height desc;

/* where ���� having ���� �������� 
�����ϸ� where������ ���� �� �ǵ���
�Ʒ� �ΰ� ��. �ǹ������� �ι�°�� �� �ӵ�����*/
select deptno, avg(sal)
from professor
group by deptno
having deptno > 102;

select deptno, avg(sal)
from professor
where deptno > 102
group by deptno;

--�а��� �л��� ��� ������ �� �ִ� ��ո����Ը� ����ض�
select deptno, avg(weight)
from student
group by deptno;

select max(avg(weight)) max_weight
from student 
group by deptno;

select deptno, avg(sal) 
from emp 
where sal >= 1500 
group by deptno 
having avg(sal) >=2000;

--�а��� �л����� �ִ� �Ǵ� �ּ��� �а��� �л� ���� ����Ͽ���
select max(count(studno)) max_cnt, min(count(studno)) min_cnt
from student
group by deptno;

/* join */
/* [����] 01-09. JOIN.pdf */

select * from student;
-- join �� �� �� ���̺� ���������� �ִ� �÷����� �ݵ�� ���̺��.�÷��� ����� ������ �ȳ�. 
-- �������� ���� ���� �÷��� �ӵ��� ���� ���������� ���̺��.�÷��� ���ش�
select student.studno, student.name, student.deptno, department.dname
from student, department
where student.deptno = department.deptno;

-- ���̺� ���������� ����. �������������� �����̺��� ȥ������ �ʴ´�
select s.studno, s.name, s.deptno, d.dname
from student s, department d
where s.deptno = d.deptno;

select s.studno, s.name, s.deptno, d.dname, d.loc
from student s, department d
where s.deptno = d.deptno
and s.name = '������';

--��� ���̺��� DALLAS�� �ٹ��ϴ� ����� ���, �̸�,�μ���ȣ, �μ��̸�, �μ���ġ�� ����϶�
select * from emp;
select * from dept;
select emp.empno, emp.ename, emp.deptno, dept.dname, dept.loc 
from emp, dept 
where dept.deptno = emp.deptno and dept.loc = 'DALLAS';

-- �޿��� 400�̻��� �����̸�, �޿�, �а���ȣ, �а��̸��� ���(professor, department)
select * from professor;
select * from department;
select p.name, p.sal, d.deptno, d.dname 
from professor p, department d
where p.deptno = d.deptno and p.sal >= 400;

-- ������ ������� �� �÷��� �ݵ�� primary key�� �� ��.
-- �л��� �й�, �̸�, �а���ȣ, �а��̸�, �а���ġ, ���������̸�, �޿��� ���(student, professor, department)
select * from student;
select * from professor;
select * from department;
select s.studno �й�, s.name �̸�, s.deptno �а���ȣ, d.dname �а��̸�, d.loc �а���ġ, p.name "���������̸�", p.sal �޿�
from student s, professor p, department d
where s.profno = p.profno and s.deptno = d.deptno;

select s.studno, s.name, d.dname, d.loc
from student s, department d
where s.deptno = d.deptno and s.weight >= 80;

--īƼ�ǰ� ( = cross join) 
select studno, name, s.deptno, d.deptno, dname from student s, department d order by studno;
--���� ���� ��� ����(cross join)
select name, student.deptno, dname, loc 
from student cross join department;
-- equi join
select s.studno, s.name, s.deptno, d.dname, d.loc
from student s, department d
where s.deptno = d.deptno;

--1--
select ename, 
    case when comm is null then 200
        else comm
        end bonus
        from emp;
--2--
select job, sum(sal) payroll 
from emp 
where job != 'PRESIDENT'
group by job
having sum(sal) > 5000;
--3--
select e.ename, e.job, e.deptno, d.dname 
from emp e, dept d 
where e.deptno = d.deptno and d.loc = 'CHICAGO';

--4--
select to_char(sysdate, 'day') from dual; 
select e.ename, e.hiredate,  to_char(e.hiredate, 'DAY') day from emp e, dual order by to_char(e.hiredate-1,'D'); 

--5--
--select  to_char(e.hiredate, 'YYYY') year, count(*) from emp e group by rollup(to_char(e.hiredate, 'YYYY')) order by to_char(e.hiredate, 'YYYY');
--select to_char(hiredate, 'YYYY'), count(*)
--from emp
--group by cube(to_char(hiredate, 'YYYY'));

select *     /* ���� �ּ� ��ĺ�ȯ*/
from (
    select to_char(hiredate, 'YYYY') || '��' hire_year
    from emp
)
pivot(
    COUNT(*) 
    FOR hire_year IN ('1980��', '1981��','1982��','1987��') 
);

select *
from (
    select to_char(hiredate, 'YYYY') hire_year
    from emp
)
pivot(
    COUNT(*) 
    FOR hire_year IN (1980,1981,1982,1987) 
);