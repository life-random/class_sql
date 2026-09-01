-- DCL (Data Control language) - 권한을 관리 한다.alter

-- 사용자 생성 (사람, 시스템에게 줄 수 있음
-- localhost는 내 컴퓨터 안에서 접근하는 계정
-- 외부에서 접근 하려면 *, 192.168.4.12 처럼 IP 주소를 명시할 수 있다.
-- CREATE USER 'user1'@'*' IDENTIFIED BY 'password123';

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- 새로 생성한 user1에 조회 권한을 부여 -> school.student 테이블에 조회 권한만 부여함
-- 조회 권한 부여
GRANT SELECT ON school.student TO 'user1'@'localhost';
-- 권한 확인
SHOW GRANTS FOR 'user1'@'localhost';
-- INSERT 권한 부여 (user@localhost 계정)
GRANT INSERT ON school.student TO 'user1'@'localhost';
-- 확인 개념 : GRANT는 권한을 덮어쓰기 하는 것이 아니라 더해지는 개념이다.
-- 쉼표를 사용해서 한 번에 권한을 부여할 수 있다
GRANT UPDATE, DELETE ON school.student TO 'user1'@'localhost';

-- 외부에서 접근할 수 있는 계정을 생성하자
CREATE USER 'user1'@'%' IDENTIFIED BY 'password123';
SHOW GRANTS FOR 'user1'@'%';
GRANT SELECT ON school.student TO 'user1'@'%';

-- -----------------------------------------------------------------------------
-- 권한 회수
-- -----------------------------------------------------------------------------
REVOKE INSERT, UPDATE, DELETE ON school.student FROM 'user1'@'localhost';

-- 계정 삭제
DROP USER 'user1'@'localhost';

-- 계정 확인
SELECT USER();

-- 현재 USER 목록 확인
SELECT CURRENT_USER();

-- 도전 과제 1. (외부에서 접근할 수 있ㄴ느 계정 생성하고 권한 관리 해서 테스트)
CREATE USER 'user2'@'%' IDENTIFIED BY 'password123';
SHOW GRANTS FOR 'user2'@'%';
GRANT SELECT ON school.student TO 'user2'@'%';
GRANT DELETE, UPDATE, INSERT ON school.student TO 'user2'@'%';













