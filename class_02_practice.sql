-- 데이터 베이스 생성 (이름)
-- 사용 명령어
-- 데이터 생성, 컬럼 수정, 데이터 조회, 삽입 실습하기

CREATE DATABASE test_02;
USE test_02;

CREATE TABLE test_table_02(
	userName VARCHAR(3) primary KEY,
    birthYear INT NOT NULL,
    mobile VARChAR(13)
);

CREATE TABLE test_table_02_eating(
	userName VARCHAR(3) NOT NULL,
    food VARCHAR(10) NOT NULL,
    eat_day VARCHAR(4) NOT NULL,
    
    FOREIGN KEY (userName) REFERENCES test_table_02(userName)
);

DESC test_table_02;
DESC test_table_02_eating;

INSERT INTO test_table_02_eating VALUES('김갑환', '라면', 0831);
INSERT INTO test_table_02(userName, birthYear, mobile) VALUES ('김갑환', 2002, '010-1234-5678');
INSERT INTO test_table_02_eating VALUES('김갑환', '라면', 0831);

SELECT * FROM test_table_02;
SELECT * FROM test_table_02_eating;

DROP DATABASE test_02;