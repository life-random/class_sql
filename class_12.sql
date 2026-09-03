DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS member;

CREATE TABLE member (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20)
);

INSERT INTO member (email, name, phone) VALUES
	('hong@test.com', '홍길동', '010-1234-5678'),
	('kim@test.com', '김영희', '010-2345-6789'),
	('lee@test.com', '이철수', '010-3456-7890');
    
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  order_date DATE,
  amount INT,
  FOREIGN KEY (member_id) REFERENCES member(id)
);

INSERT INTO orders (member_id, order_date, amount) VALUES
(1, '2023-10-01', 50000),
(2, '2023-10-02', 75000),
(3, '2023-10-03', 30000);
    
-- 실습 하기
select * from member;
select * from orders;

-- 1. 중복 이메일 삽일 시도
insert into member(email, name, phone)
values('kim2@test.com', '홍길동2', '010-1234-1234');    
    
-- 2. 존재하지 않는 회원의 주문 삽입
insert into orders(member_id, order_date, amount)
values(1000, 20260901, 10);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`type_practice`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`))

-- 3. 회원 삭제 시도(참조된 데이터)
delete from member
where id = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`type_practice`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`))

-- 4. 외래키 삭제 하는 방법
alter table orders
drop foreign key orders_ibfk_1;
    
-- 5. 테이블 생성 이후에 외래키를 추가하는 방법
alter table orders
add constraint fk_member
foreign key(member_id) references member(id);

alter table orders

drop foreign key fk_member;

-- cascade 설정 됨. 부모 테이블에 참조된 대상ㅇ이 관련된 데이터 자동으로 다 삭제
alter table orders
add constraint fk_member
foreign key(member_id) references member(id)
on delete cascade on update cascade;

-- 오류 없이 잘 삭제 됨
delete from member
where id = 1;

select * from member;
select * from orders;


