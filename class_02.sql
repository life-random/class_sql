
-- 데이터 베이스 생성
CREATE DATABASE school;
USE school;

-- 테이블 생성
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL,
    phone VARCHAR(20)
);
-- 테이블 구조 확인
-- DESC student;
-- SELECT * FROM student;
-- SHOW TABLES;

-- DDL (컬럼 추가)
ALTER TABLE student ADD COLUMN email VARCHAR(100);

-- DDL (컬럼 수정 : 타입이나 길이만 바꾸기)
-- phone 길이가 20 인데 --> 30 변경
ALTER TABLE student MODIFY COLUMN phone VARCHAR(30);

-- DDL (컬럼 수정 : 이름까지 바꾸기 (CHANGE))
-- email을 email_address 로 바꾸면서 길이도 150으로 늘린다.
ALTER TABLE student CHANGE COLUMN email email_address VARCHAR(150) NOT NULL;

-- DDL (컬럼 수정 : 이름만 변경) 8.0 버전 이상 에서는 RENAME 사용한다.alter
ALTER TABLE student RENAME COLUMN email_address TO email;

-- DDL (컬럼 삭제)
ALTER TABLE student DROP COLUMN email;

-- DDL (테이블 삭제)
DROP TABLE student;

-- DDL (데이터 베이스 삭제)
DROP DATABASE school;
DROP DATABASE db_tenco_market;


