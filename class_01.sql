
-- 데이터 집합 생석(DB생성)
CREATE DATABASE db_tenco_market;
-- 어떤 데이터 베이스를 사용할지 선택
USE db_tenco_market;

-- 데이터 집합 삭제
DROP DATABASE db_tenco_market;

-- 대소문자 주의
-- 키워드(SELECT, CREATE) 등 컬럼명은 대소문자를 구분하지 않는다.
-- 하지만 주의! 데이터베이스명과 테이블명은 운영체제에 따라 다를 수 있다 (즉 대소문자 구분 할 수도 있음)
-- Windows (구별하지 않음)
-- Linus : 구별함
-- 그래서 만들 때 쓴 이름 그대로 쓰는 습관을 들여야 한다.

-- 도전 과제 1. 다른 이름으로 DB 생성 및 삭제 해보기
CREATE DATABASE db_test_01;
USE db_test_01;
DROP DATABASE db_test_01;

-- 실습 코드 1 (테이블 설계하기)
CREATE TABLE userTBL(
	userName VARCHAR(10) NOT NULL PRIMARY KEY,
    birthYear int NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile VARCHAR(12)
);

SHOW TABLES;
DESC userTBL;

CREATE TABLE buyTBL(
	userName VARCHAR(10) NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
	FOREIGN KEY (userName) REFERENCES userTBL(userName)
);

SHOW TABLES;
DESC buyTBL;

-- -------------------------------------------------------------
-- 테이블 정보 조회
SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- 고객 테이블에 데이터 삽입(등록, 저장)
INSERT INTO userTBL VALUES('김철수', 1995, '서울', '010-1234-1234');
-- 오류 발생 mobile 칼럼의 Type의 글자수 제한 초과

-- 컬럼에 대한 제약을 수정해 보자.
ALTER TABLE userTBL MODIFY COLUMN mobile VARCHAR(13);

-- 다시 데이터 입력
INSERT INTO userTBL VALUES('김철수', 1995, '서울', '010-1234-1234');
-- 데이블 조회
SELECT * FROM userTBL;
-- 추가 고객 등록하기 (컬럼명을 직접 명시해서 삽입)
INSERT INTO userTBL (userName, birthYear, addr) VALUE ('이영희', 1998, '부산');

-- 중복되 이름 저장해보기 (현재 userName PK 임) ALTER
INSERT INTO userTBL (userName, birthYear, addr) VALUES ('이영희', 1998, '부산');
-- 오류 발생 기본키가 중복됨

-- 구매 테이블 조회
SELECT * FROM buyTBL;
SELECT userName, prodName, price, amount FROM buyTBL;

-- 구매 테이블 데이터 삽입
INSERT INTO buyTBL VALUES ('김철수', '운동화', 30000, 1);
SELECT * FROM buyTBL;

-- 고객테이블 구매테이블은 현재 FK 키로 제약 설정이 되어 있다. (userName) <--- 구매 테이블 컬럼 이름
INSERT INTO buyTBL VALUES ('홍길동', '컴퓨터', 1300000, 1);
-- 고객 데이블에 없는 사람은 구매 기록을 남길 수 없다 (왜? 현재 FK로 제약 설정이 되어서이다.)

INSERT INTO buyTBL(userName, prodName, price, amount)
	VALUES ('이영희', '컴퓨터', 1500000, 1);