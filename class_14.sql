use employees;

select * from employees_copy;
desc employees_copy;

show index from employees_copy;

select  * from employees_copy
where gender = 'M';

-- gender 에 인덱스 추가
alter table employees_copy
add index idx_gender (gender);



select  * from employees_copy
where first_name = 'Georgi';

select  * from employees_copy
where emp_no = '15689';

-- 실습 인덱스 키 직접 만들기
drop index idx_gender on employees_copy;

alter table employees_copy
add index idx_birth_date (birth_date);

-- 참고 : 쿼리 앞에 EXPLAIN을 사용하면 쿼리 실행 계획을 바로 확인할 수 있습니다.
explain select * from employees_copy
where last_name = 'Zielinsgi';