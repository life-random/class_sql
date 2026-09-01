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