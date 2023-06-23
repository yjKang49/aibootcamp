/* 2023.06.22 */
/* 01-06 SQL 함수.pdf */
select sysdate, last_day(sysdate), next_day(sysdate, '일') from dual;
select sysdate, last_day(sysdate), next_day(sysdate, 1) from dual;

/* sysdate는 datetime 데이터형식인데 char로 바꿈 */
select to_char(sysdate, 'YY/MM/DD HH24:MM:SS') NORMAL, 
        to_char(trunc(sysdate), 'YY/MM/DD HH24:MM:SS') trunc,
        to_char(round(sysdate), 'YY/MM/DD HH24:MM:SS') round   -- round 함수는 정오를 넘으면 다음날 출력
from dual;

select to_char(hiredate, 'YY/MM/DD HH24:MM:SS') hiredate,
        to_char(round(hiredate, 'dd'), 'YY/MM/DD') round_dd,
        to_char(round(hiredate, 'mm'), 'YY/MM/DD') round_mm,
        to_char(round(hiredate, 'yy'), 'YY/MM/DD') round_yy
from professor
where deptno = 101;

-- grade는 varchar 타입인데 1을 넣어도 인식됨. 묵시적인 데이터타입 변환. 단점: 속도가 느려짐.
-- 해당 컬럼의 정확한 데이터타입을 이용해야 속도가 느려지지 않음. 
select * from student where grade = 1;   
select * from student where grade = '1';   
desc student;

select studno, birthdate 생일, TO_CHAR(birthdate, 'YY-MM') birthdate
from student
where name = '전인하';

select name, grade, TO_CHAR(birthdate, 'Day Month Mon DD, YYYY') birthdate
from student 
where deptno = 102;

alter session set NLS_LANGUAGE = AMERICAN;
alter session set NLS_LANGUAGE = KOREAN;
DESC SESSION;

/*날짜타입은 데이터타입으로 변경*/
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
TO_NUMBER 함수는 숫자로 구성된 문자열을 숫자 데이터로 변환하기 위한 함수
*/
SELECT TO_NUMBER('1') FROM DUAL;


-- 6월이라고 입력하려면 alter session set NLS_LANGUAGE = KOREAN; 해야함
-- 문자와 날짜가 섞인 문자열을 날짜데이터로 바꿈
SELECT NAME, HIREDATE 
FROM PROFESSOR 
WHERE HIREDATE = TO_DATE('june 01, 01', 'MONTH DD, YY');   

select sysdate - TO_DATE('19980409', 'YYYY/MM/DD') as "Lived day" from dual; --지금까지 며칠 살았나요?

SELECT sysdate - TO_DATE('19980409', 'YYYY/MM/DD') as "Lived day", 
    ROUND(MONTHS_BETWEEN(SYSDATE, TO_DATE('19980409','YYYY/MM/DD'))) as "Lived month"
from dual;

SELECT TO_CHAR( TO_DATE(SUBSTR(IDNUM,1,6), 'YYMMDD'), 'YY/MM/DD') BIRTHDATE 
FROM student;

/* NVL( expression1, expression2 ) : NULL을 0또는 다른 값으로 변환하기 위한 함수 
expression1 은 NULL을 포함하는 표현식 또는 칼럼
expression2 는 NULL을 대체하는 값
*/ --중요
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

/* 사원의 이름, 보너스 열을 출력하고 보너스를 받지 않는 사람은 'NO'가 나오도록 함*/
select ename, NVL2(COMM, TO_CHAR(COMM), 'NO') comm2
from emp;
desc emp;

/*교수 테이블에서 이름의 바이트수와 사용자아이디의 바이트 수를 비교해서 같으면 null을 반환하고 같지않으면 이름의 바이트 수를 반환하여라*/
SELECT NAME, USERID, LENGTHB(name), LENGTHB(userid), 
nullif(LENGTHB(NAME), LENGTHB(USERID)) nullif_result
from professor;

/* COALESCE */
/*교수 테이블에서 보직수당이 null이 아니면 보직수당을 출력하고, 보직수당이 null이고 급여가 null 이 아니면 급여를 출력, 
보직수당과 급여가 null이면 0을출력하라*/
select name, comm, sal, coalesce(comm, sal, 0) co_result
from professor;

/* DECODE (중요)*/
select name, deptno, decode(deptno, 101, '컴퓨터공학과', 102, '멀티미디어학과', 201, '전자공학과', '기계공학과') dname
from professor;
/* 학생테이블에서 학과번호와 이름, 학과명을 출력하되 101번 학과 학생만 'Computer Science'로 출력하고 
101번이 아닌 학생들이 학과명을 'ETC' 출력 */
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, 'Computer Science', 'ETC') 학과명 
FROM STUDENT
WHERE name NOT IN ('황보_정호', '강유정');

/* CASE 함수(중요)
DECODE의 개념을 확장한 함수
CASE 함수에서는 산술연산, 관계연산, 논리연산과 같은 다양한 비교가 가능
*/
SELECT NAME, DEPTNO, SAL, 
    CASE WHEN DEPTNO = 101 THEN SAL * 0.1
        WHEN DEPTNO = 102 THEN SAL * 0.2
        WHEN DEPTNO = 103 THEN SAL * 0.3
        ELSE 0
    END BONUS
FROM PROFESSOR;

-- 학생 테이블에서 이름, 태어난 달, 태어난 달의 분기를 출력해라
select * from student;
desc student;
select name, substr(birthdate, 4,2) as month, 
        case when substr(birthdate, 4,2) < 4 then '1/4'
        when substr(birthdate, 4,2) < 7 then '2/4'
        when substr(birthdate, 4,2) < 10 then '3/4'
        when substr(birthdate, 4,2) < 13 then '4/4'
    END quarter
    
FROM STUDENT;
-- 다른방법
SELECT  name, SUBSTR(birthdate, 4, 2) MONTH,
    concat(TO_CHAR(birthdate, 'Q'), '/4') 분기
FROM student;

/* 01-07. Group 함수.pdf  */

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

-- 모든 사원의 최대급여, 최저급여, 함계 그리고 평균급여를 출력하세요.
select max(sal) as Maximum, min(sal) as Mininum, sum(sal) as Sum, round(avg(sal),0) as Average 
from emp;

select stddev(sal), variance(sal)
from professor;
/*
order by 절은 select절에 명시되지 않은것도 쓸 수 있지만 
group by 절에 명시되지 않은 칼럼은 그룹함수와 함께 사용할 수 없다
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
-- rollup에 대한 그룹 집합은 1,2,3 순서로 처리된다.
select deptno, position, count(*)
from professor
group by rollup(deptno, position);
-- cube 함수: 소계와 전체 개수
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
--위와 같음
select deptno, grade, to_char(birthdate, 'YYYY') birthdate, count(*)
from student
group by grouping sets((deptno, grade), (deptno, to_char(birthdate, 'YYYY')));

/* having 절*/
select grade, count(*), round(avg(height)) avg_height, round(avg(weight)) avg_weight
from student 
group by grade
order by avg_height desc;

select grade, count(*), round(avg(height)) avg_height, round(avg(weight)) avg_weight
from student
group by grade
having count(*) > 4
order by avg_height desc;

/* where 절과 having 절의 성능차이 
웬만하면 where절에서 연산 다 되도록
아래 두개 비교. 실무에서는 두번째가 더 속도빠름*/
select deptno, avg(sal)
from professor
group by deptno
having deptno > 102;

select deptno, avg(sal)
from professor
where deptno > 102
group by deptno;

--학과별 학생의 평균 몸무게 중 최대 평균몸무게를 출력해라
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

--학과별 학생수가 최대 또는 최소인 학과의 학생 수를 출력하여라
select max(count(studno)) max_cnt, min(count(studno)) min_cnt
from student
group by deptno;

/* join */
/* [기초] 01-09. JOIN.pdf */

select * from student;
-- join 할 때 두 테이블에 공통적으로 있는 컬럼명은 반드시 테이블명.컬럼명 써줘야 오류가 안남. 
-- 공통으로 있지 않은 컬럼도 속도를 위해 관습적으로 테이블명.컬럼명 써준다
select student.studno, student.name, student.deptno, department.dname
from student, department
where student.deptno = department.deptno;

-- 테이블 별명지정과 조인. 별명지정했으면 원테이블명과 혼용하지 않는다
select s.studno, s.name, s.deptno, d.dname
from student s, department d
where s.deptno = d.deptno;

select s.studno, s.name, s.deptno, d.dname, d.loc
from student s, department d
where s.deptno = d.deptno
and s.name = '전인하';

--사원 테이블에서 DALLAS에 근무하는 사원의 사번, 이름,부서번호, 부서이름, 부서위치를 출력하라
select * from emp;
select * from dept;
select emp.empno, emp.ename, emp.deptno, dept.dname, dept.loc 
from emp, dept 
where dept.deptno = emp.deptno and dept.loc = 'DALLAS';

-- 급여가 400이상인 교수이름, 급여, 학과번호, 학과이름을 출력(professor, department)
select * from professor;
select * from department;
select p.name, p.sal, d.deptno, d.dname 
from professor p, department d
where p.deptno = d.deptno and p.sal >= 400;

-- 조인의 연결고리가 될 컬럼은 반드시 primary key로 쓸 것.
-- 학생의 학번, 이름, 학과번호, 학과이름, 학과위치, 지도교수이름, 급여를 출력(student, professor, department)
select * from student;
select * from professor;
select * from department;
select s.studno 학번, s.name 이름, s.deptno 학과번호, d.dname 학과이름, d.loc 학과위치, p.name "지도교수이름", p.sal 급여
from student s, professor p, department d
where s.profno = p.profno and s.deptno = d.deptno;

select s.studno, s.name, d.dname, d.loc
from student s, department d
where s.deptno = d.deptno and s.weight >= 80;

--카티션곱 ( = cross join) 
select studno, name, s.deptno, d.deptno, dname from student s, department d order by studno;
--위와 같은 결과 나옴(cross join)
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

select *     /* 위의 주석 행렬변환*/
from (
    select to_char(hiredate, 'YYYY') || '년' hire_year
    from emp
)
pivot(
    COUNT(*) 
    FOR hire_year IN ('1980년', '1981년','1982년','1987년') 
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