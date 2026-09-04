DROP DATABASE IF EXISTS self_join;
CREATE DATABASE self_join;
USE self_join;

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department    VARCHAR(20) NOT NULL,
    salary        INT NOT NULL,        -- 연봉, 만원 단위
    manager_id    INT                  -- 상급자의 employee_id. 없으면 NULL
);

INSERT INTO employees VALUES
(1, '김민수', '경영', 9000, NULL),
(2, '박지훈', '개발', 7000, 1),
(3, '이서연', '영업', 6500, 1),
(4, '최준호', '개발', 5000, 2),
(5, '정하윤', '개발', 5500, 2),
(6, '강도현', '영업', 4800, 3);

SELECT * FROM employees;

-- 1. 계층 구조 조회 (셀프 조인 활용)
-- 즉, 각 직원에 상급자 이름을 조회 (결과 집합)
select e.*, m.*
from employees e left join employees m	-- 매니저 이름을 찾기 위한 사본 테이블
on e.manager_id = m.employee_id;

select e.*, m.employee_name
from employees e left join employees m	-- 매니저 이름을 찾기 위한 사본 테이블
on e.manager_id = m.employee_id;

-- left join을 사용하는 이유
-- 최고 상급자가 사라짐
SELECT e.employee_name AS 직원,
       m.employee_name AS 상급자
FROM employees e
INNER JOIN employees m ON e.manager_id = m.employee_id;

-- 상급자의 상급자까지 찾기
select e.*, m.employee_name, m.manager_id , m2.employee_name
from employees e left join employees m	-- 매니저 이름을 찾기 위한 사본 테이블
on e.manager_id = m.employee_id
left join employees m2
on m.manager_id = m2.employee_id;

-- 용도 2. 같은 테이블 안에서 다른 행을 비교할 수 있다
-- 1. 같은 부서에서, 나보다 연봉이 높은 사람
select e.employee_name as 직원,
		e.salary as 내연봉,
        h.employee_name as 더높은사람,
        h.salary as 상대연봉
from employees e join employees h
	on e.department = h.department
    and e.salary < h.salary
order by e.employee_name, e.salary desc, h.salary;

-- ON 조건을 두 개 써야 하는 이유
-- 1. 만약 JOIN 연산에서 ON절리 없으면 --> 크로스 조인
select *
from employees e join employees m;
-- on <-- 사용하지 않음

-- 2-1. 부서 조건만 있으면
SELECT e.employee_name AS 직원, h.employee_name AS 상대
FROM employees e
JOIN employees h ON e.department = h.department
WHERE e.department = '개발'
ORDER BY e.employee_name, h.employee_name;

-- 2-2. on조건에서 연봉만 있는 경우 확인
select e.*, h.employee_name
from employees e join employees h
	on e.salary < h.salary -- 부서 상관 없이 나보다 연봉 높은 사람
where e.employee_name = '강도현'
order by e.employee_name, e.salary desc, h.salary;

