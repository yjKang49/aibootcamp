select * from student;  
select * from professor;
select * from department;
select * from salgrade;
select * from tab;   --이 계정이 가지고 있는 모든 테이블--

DESC STUDENT;
DESC PROFESSOR;
DESC DEPARTMENT;
SELECT DEPTNO, DNAME, COLLEGE, LOC FROM DEPARTMENT;
SELECT DNAME, DEPTNO FROM DEPARTMENT;
--1--
SELECT STUDNO, NAME, WEIGHT FROM STUDENT;
--2--
SELECT PROFNO, NAME, SAL FROM PROFESSOR;

--DISTINCT 중복제외
select distinct deptno from student;
select distinct deptno from professor;
select distinct position from professor; 
select distinct count(position) from professor;
select * from professor;
select distinct deptno, grade from student;

--별명 부여방법--
-- original 컬럼 + 공백 +  별명
-- original 컬럼 + as + 별명
select dname dept_name, deptno as DN from department;

--학생 테이블에서 이름, 학번, 학과 번호를 출력하세요--
desc student;
select name as 이름, studno as 학번, deptno as 학과번호 from student;

--컬럼 별명부여 예시. 공백이나 특수문자 포함시 큰따옴표로 감싼다 --
select dname "Department Name", deptno "부서번호#" from department;
select name 교수이름, sal "급여$", deptno "학과 번호No" from professor;

--합성(concatenation)연산자 ( || )
-- 하나의 갈럼과 다른 칼럼, 산술 표현식 또는 상수값과 연결하여 하나의 칼럼처럼 출력할 경우에 사용.
-- 학생 테이블에서 학번과 이름 칼럼을 연결하여 "Student"라는 별명으로 하나의 칼럼처럼 연결하여 출력하여라
select studno || ' ' || name "Student" from student;

--사원 테이블(emp)에서 열 레이블이 Employee and Title 이고, 콤마와 공백으로 구분된, 이름과 직무(job)를 연결되도록 출력하세요.
DESC EMP;
SELECT ENAME || ',' || JOB AS "Employee and Title" from emp;

--산술연산자(+,-,*,/)
select name, weight, weight*2.2 as weight_pound from student; --이름, 몸무게, 몸무게파운드로 환산(1kg=2.2pound)

--사원테이블(EMP)에서 사원번호, 이름, 직업, 급여 그리고 22% 증가된 급여를 출력하세요. 증가된 급여의 열 레이블은 New Salary 입니다.
select empno, ename, job, sal, sal*1.22 as "New Salary", sal*1.22 - sal as increase from emp;

--where 조건절--
select studno, name, deptno, grade from student where grade = '1';  -- grade는 varchar2(1) 데이터타입이므로 이게 정확한 답.
select studno, name, deptno, grade from student where grade = 1;   -- 숫자1은 ''하지 않아도 됨(오라클이 자동변환). 정확한 답은 아님.
select * from student where name='조명훈';

select name, position, sal 
from professor 
where position = '부교수';

select studno, name, grade, deptno, weight
from student
where weight <= 70;

select studno, name, weight, deptno from student where grade='1' and weight >= 70; 
select studno, name, weight, deptno, grade from student where (grade = '1' or weight >= 70);  --괄호를 정확히 해주는게 이론상 정확
select name, sal, position from professor where position='교수' and sal >=300;

--not 연산자--
select  studno, name, weight, deptno from student where not deptno = 101;
select  studno, name, weight, deptno from student where not deptno = 101 and weight >= 70;

--sql 연산자--
--between 연산자: a between b, in 연산자: a in [a,b,c,d,...], 포함하는 문자찾기: like %
select studno, name, weight from student where weight between 50 and 70;

--연습문제
/*
1. 사원테이블에서 사원명 칼럼의 별명은 Name, 급여*12는 Annual Salary로 부여하여 출력해 보세요. (결과가 아래와 같이 나오도록)
  Name       Annual Salary
  ---------- -------------
  SMITH               9600
  ALLEN              19200
2. 사원테이블의 사원명과 급여를 아래와 같은 포맷으로 출력해 보세요. (결과가 아래와 같이 나오도록)
  MONTHLY
  --------------------------------------
  SMITH: 1 Month salary = 800
  ALLEN: 1 Month salary = 1600
  WARD: 1 Month salary = 1250
3. 101번과 202번 학과에 속하지 않는 모든 교수의 이름과 학과번호를 출력하세요.
4. $2850 이상인 사원의 이름과 급여를 출력하세요.
5. $1250~$2800을 받고 20번 부서에 속하지 않는 사원의 이름과 급여를 출력하세요.
열의 레이블을 Employee와 Monthly Salary로 하세요.(결과는 아래와 같도록)
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

