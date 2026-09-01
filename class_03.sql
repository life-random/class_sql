-- DML 사용하기
-- 

-- 데이터 추가 (INSERT) 한 건
INSERT INTO student(student_id, name, grade, major, phone)
	VALUES(1001, '김철수', 2, '컴퓨터공학', '010-1234-1234');

-- 데이터 추가 (INSERT) 여러 건
INSERT INTO student(student_id, name, grade, major, phone)
	VALUES(1002, '이영희', 1, '경영학', '010-1234-1234'),
		(1003, '박민준', 2, '전자공학', '010-1234-1234'),
		(1004, '홍길동', 4, '생명공학', '010-1234-1234');
        
-- 데이터 조회 (SELECT)
SELECT name, major FROM student;
SELECT name, major FROM student WHERE grade = 1;

-- 데이터 수정 (UPDATE)
-- 수정 질의어 에서 WHERE 절이 없으면 전체 행(row)을 수정하라는 명령어라서 가능한 절대 WHERE 사용하면 안된다
UPDATE student SET major = '컴공'; -- WHERE 없는 UPDATE 구문은 가능한 사용하지 말자.
UPDATE student SET grade = 4 WHERE student_id = '1001';

-- 데이터 삭제 (DELETE)
-- 삭제 질의어를 사용할 때도 반드시 WHERE절 두번 세번 확인하자.
DELETE FROM student;
-- 특이 사항. 삭제 쿼리는 없던 데이터 삭제 요청을 하더라도 오류가 아니다alter
DELETE FROM student WHERE student_id = 1004;
DELETE FROM student WHERE grade = 2;

















