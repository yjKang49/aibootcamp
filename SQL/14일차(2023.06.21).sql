/* 2023.06.21 */

/*between A and B*/
select name, birthdate from student where birthdate between '81/01/01' and '83/12/31';

/* column in (  ) : column 안에 (해당내용, 해당내용, ...)  */
select name, grade, deptno from student where deptno in (102, 201);

/* 문자를 찾을 때 작은따옴표 ' ' 를 사용. 큰 따옴표 쓰면 에러남. 큰 따옴표 " " 를 별명(alias) 지정할 때 사용*/
select empno, ename, sal, job from emp where (sal between 1500 and 5000) and job NOT IN ('PRESIDENT', 'ANALYSIS');
select empno, ename, sal, job from emp where (sal between 1500 and 5000) and job IN ('PRESIDENT', 'ANALYSIS');

/*칼럼에 저장된 문자열 중에서 like 연산자에서 지정한 문자패턴과 부분적으로 일치하면 참이 되는 연산자*/
select name, grade, deptno from student where name like '김%';
select name, grade, deptno from student where name like '%영';

/* 언더바( _ ) 는 한 글자를 의미. 김x영 인 문자열을 찾아*/
select name, grade, deptno from student where name like '김_영';

select * from student;
select name, grade, deptno, idnum from student where idnum like '______2%';

/* ESCAPE 옵션은 LIKE 연산자에서 사용하는 와일드문자(%,_) 자체를 포함하는 문자열을 검색할 때, 와일드문자를 일반문자처럼 취급하기 위한 옵션 */
insert into student (studno, name) values (33333, '황보_정호');
select * from student where studno = 33333;   /* 확인 */
select name from student where name like '황보\_%' escape '\';

/* NULL의 이해 */
select empno, sal, comm from emp;
select empno, sal + comm from emp;
select empno, sal, comm, sal + comm from emp;

/* NVL, NVL2 */
/* NVL: NULL 인 경우만 지정된 값으로 대치하는 함수. NVL(NULL 판단대상, 'NULL 일때 대체값' )*/
/* NVL2: NULL 의 여부에 따라 지정한 값으로 대치하는 함수. NVL2(NULL 판단대상, 'NOT NULL일때 대체값', 'NULL 일때 대체값) */
SELECT NAME, POSITION, COMM FROM PROFESSOR;

/* IS NULL, IS NOT NULL*/
SELECT NAME, POSITION, COMM FROM PROFESSOR WHERE COMM = NULL;   -- COMM 컬럼에 문자열이 NULL인 행을 출력
SELECT NAME, POSITION, COMM FROM PROFESSOR WHERE COMM IS NULL;  -- COMM 컬럼에 NULL인 행을 출력

-- 1. 사원 테이블에서 
-- 커미션을 받지 않고 급여가 2500이상이고 이름의 세번째 A를 포함하는 
-- 사원의 이름, 급여, 커미션을 출력하세요
SELECT ENAME, SAL, COMM FROM EMP WHERE (SAL >= 2500) AND COMM IS NULL AND (ENAME LIKE '__A%');

-- 2. employees 테이블에서 커미션을 받지 않고 , 급여가 2500 이상이고 퍼스트네임의 세번째 e를 포함하는 사원의 퍼스트네임, 급여, 커미션을 출력하세요
desc employees;

select first_name, salary, commission_pct 
from employees 
where (salary >= 2500) 
and commission_pct is null 
and first_name like '__e%';

select name, sal, comm, sal+comm sal_com
from professor;  -- comm 이 null이면 cal+comm도 null이다.

/*연산자 우선순위*/
select name, grade, deptno
from student
where deptno = 102 
and (grade = '1' or grade = '4');

/* 집합 연산 */
create table stud_heavy
as select * from student
where weight >=70 and grade = '1';

create table stud_101
as select * from student 
where deptno = 101 and grade = '1';

select * from stud_heavy;
select * From stud_101;

/*union 연산은 열의 개수가 같아야한다.*/
select studno, name from stud_heavy
union 
select studno, name from stud_101;

/*union all연산은 중복되는 행도 출력*/
select studno, name from stud_heavy
union all
select studno, name from stud_101;

/*union을 하는데 컬럼의 수가 다르기 때문에 null값 또는 0을 넣어줘야하면 null as column명 from 테이블명 또는 0 as column명*/
select name, userid, 0 as sal from student    /* null을 채우고자 하면, null as sal from student 하면 됨*/
union 
select name, userid, sal from professor;

/* 교집합 */
select name from stud_heavy 
intersect
select name from stud_101;

/*차집합*/
select studno 학번, name 이름
from stud_heavy
minus
select studno, name
from stud_101;

select studno 학번, name 이름 from stud_101
minus 
select studno, name from stud_heavy;

/* 교수 테이블에서전체 교수의 급여를 인상하기 위한 직원명단을 출력하려고 한다. minus 연산을 사용하여 직급이 전임강사인 사람들은 명단에서 제외하세요.*/
desc professor;
select name, position from professor 
minus 
select name, position from professor where position = '전임강사';

/* 정렬(sort) - order by */
select name, grade, tel 
from student 
order by name;

select name, grade, tel 
from student 
order by grade desc;

/* 모든 사원의 이름과 급여 및 부서번호를 출력하는데, 부서번호로 결과를 정렬한 다음 급여에 대해서는 내림차순으로 정렬하라 */
select ename, job, deptno, sal from emp
order by deptno, sal desc;    -- 부서번호는 오름차순, 급여는 내림차순

select ename, job, deptno, sal from emp
order by 3, 4 desc, 1;    -- 3번째 칼럼 우선정렬, 그다음 4번째 칼럼 내림차순정렬, 첫번째 칼럼 정렬
--부서번호가 10또는 30이고 부서번호와 이름을 오름차순 정렬하여 직원이름과 부서번호 출력
select ename, deptno from emp where deptno in (10, 30) order by deptno, ename;
-- 직원 이름, 고용일을 출력. 단 89년에 입사
select ename, hiredate from emp where hiredate like '89%'; 
-- 보너스를 받는 모든 사원에 대해서 이름, 급여 그리고 보너스를 출력하는 질의문을 형성하라. 단 급여와 보너스에 대해서 내림차순 정렬
select  ename, sal, comm from emp where comm is not null and comm != 0 order by sal desc, comm desc;
-- 보너스가 급여의 20% 이상이고 부서번호가 30인 많은 모든 사원에 대해서 이름, 급여 그리고 보너스를 출력하는 질의문을 형성
select ename, sal, comm from emp where comm >= sal*0.2 and deptno = 30;

select EMPNO AS 사번, ENAME AS "사원의 이름", JOB AS 직무, SAL AS 급여 FROM EMP 
where (sal between 1600 and 5000) and (JOB NOT IN ('PRESIDENT', 'ANALYST')) AND COMM >= SAL*0.1
ORDER BY JOB DESC, SAL DESC;

create table ex_type ( c char(10), v varchar2(10));
insert into ex_type values ( 'sql', 'sql');
desc ex_type;
select * from ex_type where c = 'sql';  --desc로 확인하기전에는 차이를 알 수 없다.
select * from ex_type where c = v;   --데이터 타입이 다르기 때문에 c=v는 false가 나온다.
/*
소수는 NUMBER(precision, scale) 형식으로 입력
precision: 소수점을 포함하는 전체 자리수
scale: 소수점의 자리수
*/
select sysdate from dual;   --sysdate: 시스템의 날짜와 시간 반환

-- rowid는 데이터베이스 전체에서 중복되지 않는 유일한 값.특정 레코드에 랜덤으로 엑세스하기 좋음.가장빠른방법
select rowid, empno, ename from emp;
select rowid, empno ename from emp where rowid = 'AAAE5oAAEAAAAGsAAA';
select rowid, name from professor;    -- rowid 라고 찍어줘야지 보임
select rowid, name from student;

-- rownum: 어마어마한 데이터에서 몇백 건만 빠르게 보여달라고 할때 사용)
-- timestamp 데이터타입
create table ex_time
(id     number(2),
basictime   timestamp,
standardtime    timestamp with time zone,
localtime       timestamp with local time zone);
insert into ex_time values(1, sysdate, sysdate, sysdate);
set linesize 300    -- line의 길이를 변경. 출력하는 테이블의 크기에 영향
select * from ex_time;

/* DUAL 테이블 
데이터 딕셔너리와 함께 oracle에 의해 자동으로 생성되는 테이블이다. 사용자 SYS의 스키마에 있지만 모든 사용자는 DUAL이라는 이름으로 접근할 수 있다. 
sys 가 소유한 테이블 데이터가 있는 테이블에서 유래하지 않는 상수값, 의사열, 표현식 등의 값을 단 한번만 돌리거나 
현재날짜, 시각을 알고자할 때 일시적 산술, 날짜 연산 등에 주로 사용
속도가 굉장히 빠르다
*/
select dummy from dual;
select 20*30 from student;   --sql은 반드시 테이블 필요
select 20*30 from dual;
select sysdate from dual;
--어제, 오늘, 내일 출럭
select sysdate-1 as YESTERDAY, sysdate as TODAY, sysdate+1 as TOMORROW from dual;

/* initcap함수: 인수로 입력되는 칼럼이나 표현식의 문자열에서 첫번째 영문자를 대문자로 변환하는 함수 */
initcap(empr | column)
select name, userid, initcap(userid) from student where name = '김영균';

select * from emp;
select empno, ename from emp where initcap(ename) = 'Smith';   --ename의 모든 데이터를 바꿔놓고 비교

/* lower함수, upper함수*/
select userid, lower(userid),upper(userid) from student where studno = 20101;
select ename, job, deptno from emp where lower(job) = 'manager' order by ename;

/* length 함수 */
select dname, length(dname), lengthb(dname) from department;    --length는 문자수, lengthb는 바이트수를 반환한다

--오라클에서 캐릭터 셋이 AL32UTF8 인경우 한글을 한 자당 3바이트씩 인식한다
--현재 캐릭터셋 확인
SELECT *
FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

-- CONCAT 함수: 첫번째 문자와 두번재 문자를 연결
SELECT CONCAT(CONCAT(CONCAT(NAME, '의 직책은 '), POSITION),'이다') FROM PROFESSOR;

-- SUBSTR 함수: 문자열의 일부를 추출하는 함수 (중요). SUBSTR(column명, 시작하는 인덱스, 추출개수)
SELECT NAME, IDNUM, SUBSTR(IDNUM, 1,6) BIRTH_DATE, SUBSTR(IDNUM, 3,2) BIRTH_MON
FROM STUDENT 
WHERE GRADE = '1' AND SUBSTR(idnum, 7, 1) = 2;  --여학생만

select * from emp;
select INITCAP(ename) as Name, LENGTH(ename) as Length from emp 
where substr( ename, 1,1) in ('J','A','M');   -- (J,A,M)이 아니라 각각 ''해줘야함

-- INSTR('대상문자열', '검색문자', 검색시작위치, 매칭대상횟수)
SELECT DNAME, INSTR(DNAME, '과') FROM DEPARTMENT;

--LPAD, RPAD 
SELECT POSITION, LPAD(position, 10, '*') lpad_position, userid, RPAD(userid, 12, '*') rpad_userid
FROM professor;

-- LTRIM, RTRIM
SELECT LTRIM('xyxXxyLAST WORD', 'xy') FROM DUAL;
SELECT DNAME, RTRIM(dname, '과') from department;

-- round(m,n): m을 소수점 n자리수까지 반올림, trunc: 버림, mod(m,n): m을 n으로 나눈 나머지, ceil: 올림, floor: 내림
-- 교수 테이블에서 101학과 교수의 일급을 계산(월 근무일은 22일) 하여 
--소수점 첫째자리와 셋째 자리에서 반올림한 값과 소수점 왼쪽 첫째 자리에서 반올림(버림)한 값을 출력하여라
select name, sal, sal/22, round(sal/22), round(sal/22, 2), round(sal/22, -1) from professor where deptno = 101;
select name, sal, sal/22, trunc(sal/22), trunc(sal/22,2), trunc(sal/22,2) from professor where deptno = 101;

-- 교수 테이블에서 101번 학과 교수의 급여를 보직수당으로 나눈 나머지를 계산하여 출력하여라
select name, sal, comm, MOD(sal, comm) from professor where deptno = 101;
-- ceil(n), floor(n) : n보다 큰 가장 작은 정수, n 보다 작은 가장 큰 정수
select ceil(19.7), floor(12.345) from dual;

--날짜함수
select name, hiredate, hiredate+30, hiredate+60 from professor where profno = 9908;
select sysdate from dual;   --오늘날짜
select profno, hiredate, months_between(sysdate, hiredate) tenure, add_months(hiredate, 6) review from professor
where months_between(sysdate, hiredate) < 365;

/*
1. 학생 테이블에서 이름이 '진'으로 끝나고, 지도교수가 배정되지 않는 101번 학과 학생의
아이디, 이름, 학년, 학과 번호를 출력하세요.
2. MANAGER이거나 SALESMAN이며 급여가 $1500, $3000 또는 5000이 아닌 모든 사원에 대해서
이름, 업무, 그리고 급여를 출력하세요.(결과가 아래와 같이 나오도록)
 ENAME      JOB              SAL
----------- --------- ----------
 JONES      MANAGER         2975
 BLAKE      MANAGER         2850
             .
             .
3. 사원 테이블에서 2월에 입사한 사원을 출력해 보세요.(substr 사용)
4. 직급이 'manager'인 사원을 검색하려고 아래와 같은 질의문을 작성하였으나,'선택된 레코드가 없습니다.'라고 나옴
   이유를 설명하고 직급이 'manager'인 사원을 검색하도록 질의문을 수정해 보세요.
SELECT 	empno, ename ,job
FROM	emp
WHERE 	job='MANAGER';   manager를 MANAGER로 바꿈
5. 사원 테이블에서 사원 번호, 이름, 급여 그리고 12% 증가된 급여를 모두 출력하세요.(소수점 3째 자리에서 반올림)
(아래와 같은 결과가 나오도록)
  EMPNO ENAME             SAL New Salary   Increase
------- ---------- ---------- ---------- ----------
   7369 SMITH             800        960        160
   7499 ALLEN            1600       1920        320
   7521 WARD             1250       1500        250

*/
--1--
select userid, name, grade, deptno from student where name like '%진' and deptno = 101 and profno is null;
--2--
select * from emp;
select ename, job, sal from emp where job in ('MANAGER', 'SALESMAN') AND SAL NOT IN (1500,3000,5000);
--3--
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,4,2) = 02;
--4--
SELECT 	empno, ename ,job
FROM	emp
WHERE 	job='MANAGER';   --manager를 MANAGER로 바꿈
--5--
select empno, ename, sal, sal*1.12 as "New Salary", round(sal*1.12 - sal, 2) as "Increase" from emp;