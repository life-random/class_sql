use employees;

-- DB 파악, 어떤 테이블이 존재, 어떤 의미인지 파악

-- 1일 1쿼리를 진행 (스스로 문제를 만들어서 디스코드 채널 sql-연습문제 올려주세요)
-- 단, employees DB 안에서 문제 생성 (진도 기준으로 1문제 올려주기)
-- 오늘은 SELECT 구문 WHERE만 문제

-- 2026-09-01

select *
from departments;

select *
from dept_manager;

select *
from dept_emp;

select *
from employees;

select *
from salaries;

select *
from titles;



select *
from dept_emp
where to_date != '9999-01-01';
-- dept_emp 테이블에서 to_date가 9999-01-01이 아닌 값을 출력하세요

select *
from employees
where date_format(birth_date, '%m') = '09';


-- 2026-09-02
-- dept_emp 테이블에서 from_date가 2000년도 이상 이면서 to_date가 '9999-01-01'가 아닌 값을 출력하세요
select *
from dept_emp
where from_date >= '2000-01-01'
and to_date != '9999-01-01';

create table employees_copy like employees;

alter table employees_copy
add column email varchar(50) default '이메일이 등록되지 않았습니다';

select * from employees_copy;

update employees_copy
set hire_date = '1990-10-31'
where gender = 'F';

select *
from employees_copy
where first_name = 'Aleksandar'
and hire_date > '1950-01-01'
and  hire_date < '1950-12-31';

-- 2026-09-03
-- inner join
select *
from dept_manager d inner join titles t
on d.emp_no = t.emp_no;

-- employees db와 inner join을 활용하여 아래의 결과가 출력되도록 해주세요.🪴
-- 요청사항)
-- from_date가 '1985-02-03' 또는 '1985-02-05'인 사원의 emp_no와 dept_no 조회

select emp_no, dept_no
from  dept_emp
where from_date in ('1985-02-05', '1985-02-03');


-- left join과 light join 비교
-- right join
SELECT
      e.emp_no          -- 직원 번호
    , e.first_name      -- 직원 이름
    , e.last_name       -- 직원 성
    , de.dept_no        -- 부서 번호
    , d.dept_name       -- 부서명
    , de.from_date      -- 부서 시작일
FROM
    departments d       -- 부서 테이블
RIGHT JOIN
    dept_emp de         -- 직원과 부서 중간 테이블
        ON d.dept_no = de.dept_no
RIGHT JOIN
    employees e         -- 직원 테이블
        ON de.emp_no = e.emp_no
WHERE
    e.emp_no BETWEEN 10001 AND 10100;

-- left join
select 
	e.emp_no,
	e.first_name,
    e.last_name,
    de.dept_no,
    d.dept_name,
    de.from_date
from employees e left join dept_emp de
on e.emp_no = de.emp_no
left join departments d
on de.dept_no = d.dept_no
where e.emp_no between 10001 and 10100;

-- inner join을 사용해서 employees와 salaries 테이블을 결합하고 
-- salary가 70000 이상인 직원의 emp_no, first_name, last_name, salary를 조회하세요.
select e.emp_no, e.first_name, e.last_name, s.salary
from employees e inner join salaries s
on e.emp_no = s.emp_no
where s.salary >= 70000;

-- left outer join을 사용해서 모든 직원의 emp_no, first_name, 
-- last_name, salary를 조회하세요.
-- (employees 테이블을 왼쪽 테이블로 사용하고, emp_no를 기준으로 salaries와 연결하세요.)

select e.emp_no, e.first_name, e.last_name, sum(s.salary)
from employees e left join salaries s
on e.emp_no = s.emp_no
group by e.emp_no;

-- employees 와 salaries을 이용하여 outer 조인 후
-- emp_no와 salary의 sum()값을 구하시오

-- select sum(합계 할 값)
-- on절 밑에 group by를 이용하면 구할 수 있습니다
-- 예) group by 합계의 기준이 될 조건







