DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS member;

create table member(
	id bigint primary key auto_increment,
    email varchar(100) unique,
    name varchar(50) not null,
    phone varchar(20)
);


INSERT INTO member (email, name, phone) VALUES
	(null, '홍길동', '010-1234-5678'),
	('hong@test.com', '홍길동', '010-1234-5678'),
	('kim@test.com', '김영희', '010-2345-6789'),
	('lee@test.com', '이철수', '010-3456-7890');

INSERT INTO member (email, name, phone) VALUES
	(null, '홍길동', '010-1234-5678');
    
select * from member;

-- -----------------
create table orders(
	id bigint primary key auto_increment,
    member_id bigint,
	order_date date,
    amount int,
    foreign key(member_id) references member(id)
);

-- 외래키를 설정 했다면 제약 사항이 발생한다 (무결성, 일괄성)
select * from member;

-- 아래 구문은 왜래키 제약 사항 위한 (6번이란 회원은 member 테이블에 없음)
insert into orders(member_id, order_date, amount)
value (6, '2026-09-01', 1);

insert into orders(member_id, order_date, amount)
value (1, '2026-09-01', 1);

-- 현재 orders 테이블에 member 1인 사람에 데이터가 저장되어 있는 상태다.
-- 삭제 실패 : orders 테이블에 1번 유저의 정보가 남아 있다. 삭제하면 orders 테이블 쓰레기 데이터가 되어 버린다.
delete from member
where id = 1;

select * from orders;

-- 삭제를 하려면 관련된 데이턴를 다 지우고 member 데이블에 1번을 삭제할 수 있다
delete from orders
where member_id = 1;

delete from member
where id = 1;