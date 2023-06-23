/*   [����] 01-09. JOIN.pdf  */

/* natural join = equi join 
������ Į���� �ڵ����� ã���ش� 
1�� 2�� ���� ������̴�*/
--1--
select p.profno, p.name, p.deptno, d.dname
from professor p , department d
where p.deptno = d.deptno;
--2--
select p.profno, p.name, deptno, d.dname
from professor p natural join department d;

-- natural join �� ���뿭�� ���̺��� ������� �ʰ� where�� = ������ �����Ѵ�
select s.studno, s.name, deptno, d.dname, d.loc
from student s natural join department d;

--�Ʒ� �� ������� ����. join ~using
select s.studno, s.name, deptno, d.dname, d.loc 
from student s join department d
using (deptno);
select studno, name, deptno, dname, loc
from student join department
using (deptno);

/* non-equi join : ���� ����� �÷�(�����)�� ��� join�� �� �ִ�. 
���� �޿��� � ��޿� �ش��ϴ��� ã��. ex) ���ο��ݵ��, �ǷẸ�賳�αݵ�� ��*/
select p.profno, p.name, p.sal, s.grade
from professor p, salgrade s 
where p.sal between s.losal and s.hisal;

-- �л�, �������̺��� �л��̸�, �г�, ��������, ������ ����ض�
select * from student;
select * from professor;
select  s.name �л��̸�, s.grade �г�, p.name ��������, p.position ������������ 
from student s, professor p
where s.profno = p.profno;

/* join �� �ϳ��� Į���̶� null�� ������ �ش� row�� ������� �ʴ´�. 
null���� �ִ� �൵ ����ؾ��� �ʿ䰡 ���� ���� outer join�� ���*/
--���������������� ���� �л��鵵 ���
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
order by p.profno(+);
--�л������� �ȵ� �����Ե� ���
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno(+) = p.profno
order by  s.profno(+);
-- �������������ȵ� �л�, �л������ȵ� ������ ������ 
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
union
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno(+) = p.profno;

-- left outer join, right outer join, full outer join 
-- outer join �� null�� �ִ� ���鵵 �������� ���ؼ� ���
select s.name, s.grade, p.name, p.position
from student s full outer join professor p
on s.profno = p.profno; 

/* self join */
/* ȸ���� ������ � ��� */
select c.deptno, c.dname, c.college, d.dname college_name
from department c, department d
where c.college = d.deptno;
-- where ���� ����� self join���
select dept.dname || '�� �Ҽ��� ' || org.dname
from department dept, department org
where dept.college = org.deptno;
-- join ~on ���� ����� self join ���
select dept.dname || '�� �Ҽ��� ' || org.dname
from department dept join department org
on dept.college = org.deptno;

/*  [����]01-10. SubQuery.pdf  */
-- ��������¥�ٰ� �������� ���������� �켱 �����ؼ� �����ȿ� ������ ������ �����Ѵ�
-- ������ ��������
select name, position
from professor
where position = (select  position 
                  from professor 
                  where name = '������');
select studno, name, grade 
from student
where grade = (select grade         -- ������ �񱳿����� (=)�� �����ϱ� ���ؼ��� ���������� �������  
                from student
                where userid = 'jun123');
                
select * from student;
select * from department;
-- �������� �ȿ����� ���������� ������ ����� �� ����.
select s.studno, s.name, s.grade, d.loc 
from student s, department d 
where s.deptno = d.deptno 
and s.grade = (select grade 
                from student 
                where userid = 'jun123'); 
-- 101�� �а� �л����� ��� �����Ժ��� �����԰� ���� �л��� �̸�, �а���ȣ, �����Ը� ����ض�
select name, deptno, weight
from student 
where weight < (select avg(weight)
                from student
                where deptno = 101)
order by deptno;
-- ��ո����԰� ���� ū �а��� �а���ȣ�� �ִ�����Ը� ���϶�            
select deptno �а���ȣ, avg(weight) �ִ������
from student
group by deptno
having avg(weight) = ( select avg(weight)
                        from student
                        group by deptno);

select name, grade, height
from student
where grade = (select grade from student where studno = 20101)
and height > (select height from student where studno = 20101);

-- ������ ��������
select name, grade, deptno 
from student 
where deptno in (select deptno from department where college = 100);

-- any,all ������ �̿��� ������ ��������
select studno, name, height
from student
where height > any(select height from student where grade = '4');

select studno, name, height from student
where height > all(select height from student where grade = '4');

-- EXISTS, NOT EXISTS   **�߿�**
select profno, name, sal, comm, sal+nvl(comm, 0)
from professor
where exists ( select profno
            from professor
            where comm IS NOT NULL);

select 1 userid_exist
from dual 
where NOT EXISTS( select userid 
                from student 
                where userid = 'goodstudent');
                
-- �����÷� ��������
select name, grade, weight
from student
where (grade, weight) in (select grade, min(weight) from student group by grade);

select * from professor;
select * from department;
-- �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�, �Ի���, �а����� ����ϼ���. �Ի��ϼ����� ����
select p.profno as " ���� No", p.name as ������, p.hiredate �Ի���, d.dname �а��� from professor p, department d where p.deptno = d.deptno order by p.hiredate;
-- unpairwise
select name, grade, weight 
from student 
where grade in (select  grade from student group by grade)
and weight in (select min(weight) from student group by grade);

-- Black �� ���� �μ��� �ִ� ��� ����� ���ؼ� ��� �̸��� �Ի����� ���÷����ض�
select ename, hiredate
from emp where deptno = (select deptno from emp where initcap(ename) = 'Blake');

/* [����] 01-11. ����Ÿ���۾�.pdf */
-- insert
insert into student 
values(10110, 'ȫ�浿', 'hong', '1', '8501011143098', '85/01/01', '041)123-456', 170,70,101,9903);

select * from student;
select studno, name from student where studno = '10110';
commit;

insert into department(deptno, dname) values (300,'������к�');
select * from department;

insert into professor(profno, name, position, hiredate, deptno)
values (9920, '������', '������', to_date('2006/01/01', 'YYYY/MM/DD'), 102);
commit;
select * from professor 
where profno = 9920;

insert into professor values (9910, '��̼�', 'white', '���Ӱ���', 200, sysdate, 10,101);
commit;
select * from professor
where profno = 9910;
-- t_student ���̺� ����
create table t_student as select * from student where 1 = 0;  -- where 1=0�� ��������. ���̺��� ������ ���� �����Ϸ��� Ʋ�� ������ 
-- t_student ���̺�� insert
insert into t_student select * from student;
commit;
--���� ����
create table height_info (
studno      number(5),
name        varchar2(10),
height      number(5,2));

create table weight_info (
studno      number(5),
name        varchar2(10),
height      number(5,2));

insert all
into height_info values (studno, name, height)
into weight_info values (studno, name, height)
select studno, name, height, weight
from student
where grade >= '2';

select * from height_info;
select * from weight_info;
--���᳡
-- delete�� �����͸� ����. ���̺� Ʋ�� ��������
delete from height_info;
delete from weight_info;

commit;
select * from height_info;
select * from weight_info;

-- insert all ����
-- p.25
insert all
when height > 170 then 
    into height_info values (studno, name, height)
when weight > 70 then
    into weight_info values (studno, name, weight)
select  studno, name, height, weight
from student
where grade >='2';

select * from height_info;
select * from weight_info;

delete from height_info;
delete from weight_info;
commit;
select * from height_info;
select * from weight_info;

-- ���� all/first�� �޶�����. ù��° when ���Ǹ����ϴ°��� insert �� ��
-- ù��° when�� �ش��ϴ� ������� �����ϰ� ������ ����� �߿��� �ι�° when ������ �����ϴ� ������� insert�Ѵ�.
insert first
when height > 170 then 
    into height_info values (studno, name, height)
when weight > 70 then
    into weight_info values (studno, name, weight)
select  studno, name, height, weight
from student
where grade >='2';

/* 1. �а��� �л����� �ִ��� �а���ȣ, �а���, �л� ���� ����ϼ���. */
select s.deptno as �а���ȣ, d.dname as �а���, count(*) 
from student s, department d 
where s.deptno = d.deptno 
group by s.deptno, d.dname
having count(*) = (select max(count(*)) from student group by student.deptno);

/* 2. Sales�μ��� �ٹ��ϴ� ����� ���� last_name, job_id, �μ���ȣ, �μ��̸��� last_name ������ ����ϼ���.(���-34��) */
select e.last_name, e.job_id, e.department_id, d.department_name 
from employees e, departments d
where e.department_id = d.department_id and department_name = 'Sales'
order by last_name;

/* 3. oxford���� �ٹ��ϴ� ��� ����� ���� last_name, job, �μ���ȣ, �μ��̸�, �μ���ġ(city)�� ����ϼ���.(���-34��) */
select e.last_name, e.job_id, e.department_id, d.department_name, l.city 
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and l.city = 'Oxford';