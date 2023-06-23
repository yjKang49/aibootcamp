/*   [기초] 01-09. JOIN.pdf  */

/* natural join = equi join 
공통인 칼럼을 자동으로 찾아준다 
1과 2는 같은 결과값이다*/
--1--
select p.profno, p.name, p.deptno, d.dname
from professor p , department d
where p.deptno = d.deptno;
--2--
select p.profno, p.name, deptno, d.dname
from professor p natural join department d;

-- natural join 은 공통열의 테이블을 명시하지 않고 where의 = 조건을 삭제한다
select s.studno, s.name, deptno, d.dname, d.loc
from student s natural join department d;

--아래 두 결과값은 같다. join ~using
select s.studno, s.name, deptno, d.dname, d.loc 
from student s join department d
using (deptno);
select studno, name, deptno, dname, loc
from student join department
using (deptno);

/* non-equi join : 서로 공통된 컬럼(연결고리)이 없어도 join할 수 있다. 
각각 급여가 어떤 등급에 해당하는지 찾기. ex) 국민연금등급, 의료보험납부금등급 등*/
select p.profno, p.name, p.sal, s.grade
from professor p, salgrade s 
where p.sal between s.losal and s.hisal;

-- 학생, 교수테이블에서 학생이름, 학년, 지도교수, 직급을 출력해라
select * from student;
select * from professor;
select  s.name 학생이름, s.grade 학년, p.name 지도교수, p.position 지도교수직급 
from student s, professor p
where s.profno = p.profno;

/* join 은 하나의 칼럼이라도 null이 있으면 해당 row는 출력하지 않는다. 
null값이 있는 행도 출력해야할 필요가 있을 때는 outer join을 사용*/
--지도교수배정받지 못한 학생들도 출력
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
order by p.profno(+);
--학생배정이 안된 교수님들 출력
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno(+) = p.profno
order by  s.profno(+);
-- 지도교수배정안된 학생, 학생배정안된 교수님 모두출력 
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
union
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno(+) = p.profno;

-- left outer join, right outer join, full outer join 
-- outer join 은 null이 있는 값들도 가져오기 위해서 사용
select s.name, s.grade, p.name, p.position
from student s full outer join professor p
on s.profno = p.profno; 

/* self join */
/* 회사의 조직도 등에 사용 */
select c.deptno, c.dname, c.college, d.dname college_name
from department c, department d
where c.college = d.deptno;
-- where 절을 사용한 self join방법
select dept.dname || '의 소속은 ' || org.dname
from department dept, department org
where dept.college = org.deptno;
-- join ~on 절을 사용한 self join 방법
select dept.dname || '의 소속은 ' || org.dname
from department dept join department org
on dept.college = org.deptno;

/*  [기초]01-10. SubQuery.pdf  */
-- 서브쿼리짜다가 오류나면 서브쿼리를 우선 실행해서 쿼리안에 오류가 없는지 점검한다
-- 단일행 서브쿼리
select name, position
from professor
where position = (select  position 
                  from professor 
                  where name = '전은지');
select studno, name, grade 
from student
where grade = (select grade         -- 단일행 비교연산자 (=)를 실행하기 위해서는 서브쿼리의 결과값이  
                from student
                where userid = 'jun123');
                
select * from student;
select * from department;
-- 서브쿼리 안에서는 메인쿼리의 별명을 사용할 수 없다.
select s.studno, s.name, s.grade, d.loc 
from student s, department d 
where s.deptno = d.deptno 
and s.grade = (select grade 
                from student 
                where userid = 'jun123'); 
-- 101번 학과 학생들의 평균 몸무게보다 몸무게가 적은 학생의 이름, 학과번호, 몸무게를 출력해라
select name, deptno, weight
from student 
where weight < (select avg(weight)
                from student
                where deptno = 101)
order by deptno;
-- 평균몸무게가 가장 큰 학과의 학과번호와 최대몸무게를 구하라            
select deptno 학과번호, avg(weight) 최대몸무게
from student
group by deptno
having avg(weight) = ( select avg(weight)
                        from student
                        group by deptno);

select name, grade, height
from student
where grade = (select grade from student where studno = 20101)
and height > (select height from student where studno = 20101);

-- 다중행 서브쿼리
select name, grade, deptno 
from student 
where deptno in (select deptno from department where college = 100);

-- any,all 연산자 이용한 다중행 서브쿼리
select studno, name, height
from student
where height > any(select height from student where grade = '4');

select studno, name, height from student
where height > all(select height from student where grade = '4');

-- EXISTS, NOT EXISTS   **중요**
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
                
-- 다중컬럼 서브쿼리
select name, grade, weight
from student
where (grade, weight) in (select grade, min(weight) from student group by grade);

select * from professor;
select * from department;
-- 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름, 입사일, 학과명을 출력하세요. 입사일순으로 정렬
select p.profno as " 교수 No", p.name as 교수명, p.hiredate 입사일, d.dname 학과명 from professor p, department d where p.deptno = d.deptno order by p.hiredate;
-- unpairwise
select name, grade, weight 
from student 
where grade in (select  grade from student group by grade)
and weight in (select min(weight) from student group by grade);

-- Black 와 같은 부서에 있는 모든 사원에 대해서 사원 이름과 입사일을 디스플레이해라
select ename, hiredate
from emp where deptno = (select deptno from emp where initcap(ename) = 'Blake');

/* [기초] 01-11. 데이타조작어.pdf */
-- insert
insert into student 
values(10110, '홍길동', 'hong', '1', '8501011143098', '85/01/01', '041)123-456', 170,70,101,9903);

select * from student;
select studno, name from student where studno = '10110';
commit;

insert into department(deptno, dname) values (300,'생명공학부');
select * from department;

insert into professor(profno, name, position, hiredate, deptno)
values (9920, '최윤식', '조교수', to_date('2006/01/01', 'YYYY/MM/DD'), 102);
commit;
select * from professor 
where profno = 9920;

insert into professor values (9910, '백미선', 'white', '전임강사', 200, sysdate, 10,101);
commit;
select * from professor
where profno = 9910;
-- t_student 테이블 생성
create table t_student as select * from student where 1 = 0;  -- where 1=0은 거짓정보. 테이블의 구조만 빨리 복사하려고 틀만 가져감 
-- t_student 테이블로 insert
insert into t_student select * from student;
commit;
--연결 시작
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
--연결끝
-- delete는 데이터만 삭제. 테이블 틀은 남아있음
delete from height_info;
delete from weight_info;

commit;
select * from height_info;
select * from weight_info;

-- insert all 예시
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

-- 위와 all/first만 달라졌음. 첫번째 when 조건만족하는것을 insert 한 후
-- 첫번째 when에 해당하는 사람들은 제외하고 나머지 사람들 중에서 두번째 when 조건을 만족하는 사람들을 insert한다.
insert first
when height > 170 then 
    into height_info values (studno, name, height)
when weight > 70 then
    into weight_info values (studno, name, weight)
select  studno, name, height, weight
from student
where grade >='2';

/* 1. 학과별 학생수가 최대인 학과번호, 학과명, 학생 수를 출력하세요. */
select s.deptno as 학과번호, d.dname as 학과명, count(*) 
from student s, department d 
where s.deptno = d.deptno 
group by s.deptno, d.dname
having count(*) = (select max(count(*)) from student group by student.deptno);

/* 2. Sales부서에 근무하는 사원에 대해 last_name, job_id, 부서번호, 부서이름을 last_name 순으로 출력하세요.(결과-34건) */
select e.last_name, e.job_id, e.department_id, d.department_name 
from employees e, departments d
where e.department_id = d.department_id and department_name = 'Sales'
order by last_name;

/* 3. oxford에서 근무하는 모든 사원에 대해 last_name, job, 부서번호, 부서이름, 부서위치(city)를 출력하세요.(결과-34건) */
select e.last_name, e.job_id, e.department_id, d.department_name, l.city 
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and l.city = 'Oxford';