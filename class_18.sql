
-- inner join 특수한 형태 (cross join)
select *
from tb_student
join tb_grade;	-- join (inner join 을 의미)
-- on 조건식 		-- 현재 join 구문이 on 조건절이 없는 상태이다 -> cross join
 
SELECT * FROM tb_grade;
select count(*) from tb_grade;
SELECT * FROM tb_student;
select count(*) from tb_student;
-- 6 * 6 = 36 조합이 나오게 됨
-- 위 내용의 의미 없는 조합이다. 가능한 ON 절을 반드시 사용하자alter

select tb_student.no, tb_student.name, tb_student.grade, 
tb_grade.grade, tb_grade.score
from tb_student
inner join tb_grade
on tb_grade.grade = tb_student.grade;


SELECT s.no, s.name, s.gender, s.age, s.grade, g.score
FROM tb_student s
INNER JOIN tb_grade g
ON s.grade = g.grade;

-- 실습 2 : Outer Join 방향 먼저 개념 잡기
SELECT s.name, g.score 
FROM tb_student s LEFT JOIN tb_grade g 
ON s.grade = g.grade;

SELECT g.score, s.name 
FROM tb_student s LEFT JOIN tb_grade g 
ON s.grade = g.grade;

CREATE TABLE tb_club (
    club_id   INT PRIMARY KEY,
    club_name VARCHAR(20)
);

INSERT INTO tb_club VALUES 
(1, '축구부'), (2, '밴드부');

ALTER TABLE tb_student 
ADD COLUMN club_id INT,
ADD FOREIGN KEY (club_id) REFERENCES tb_club(club_id);

UPDATE tb_student 
SET club_id = 1 
WHERE no = 20170001;  -- 조이

UPDATE tb_student 
SET club_id = 2 
WHERE no = 20170020;  -- 앤드류

UPDATE tb_student 
SET club_id = 1 
WHERE no = 20180800;  -- 데이지
-- 다나, 스카이, 제임스는 동아리 없음 (club_id 가 NULL)

SELECT * FROM tb_club;
SELECT * FROM tb_student;

-- 학생 정보 + 등급 점수 + 동아리 이름
select s.*, g.score, c.club_name
from tb_student s left join tb_grade g
on s.grade = g.grade
left join tb_club c
on s.club_id = c.club_id;


-- LEFT JOIN 연습 : 상황 - 학생 명단이 다 나와야 합니다
select *
from tb_student s left join tb_grade g
on s.grade = g.grade;

-- RIGHT JOIN 연습 : 상황 - 모든 등급이 나와야 합니다
select *
from tb_student s right join tb_grade g
on s.grade = g.grade;

-- 연습 문제
-- 1. inner join을 이용하여 등급이 'A' 또는 'B'인 학생 조회
select s.name, s.age, s.grade, g.score
from tb_student s left join tb_grade g
on s.grade = g.grade
where s.grade in ('A', 'b');

-- 2. LEFT JOIN 을 사용하여 모든 남학생(gender = 'M')의 이름, 등급, 점수를 조회하세요. 
-- 등급이 없는 학생도 표시되어야 합니다.
select s.name, s.grade, g.score
from tb_student s left join tb_grade g
on s.grade = g.grade
where s.gender = 'M';






