-- 앞 차시에서 만든 shop 이 남아있으면 지우고 시작
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

-- 회원 테이블 생성 (PRIMARY KEY, UNIQUE KEY 사용)
CREATE TABLE member (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  join_date DATE NOT NULL
);

-- 상품 테이블 생성 (PRIMARY KEY 사용)
CREATE TABLE product (
  product_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  stock INT NOT NULL
);

-- 주문 테이블 생성 (FOREIGN KEY 사용)
CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  product_id INT,
  quantity INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (member_id) REFERENCES member(id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 회원 데이터 삽입
INSERT INTO member (email, name, phone, join_date) VALUES
('hong@test.com', '홍길동', '010-1234-5678', '2023-01-15'),
('kim@test.com', '김영희', '010-2345-6789', '2023-02-20'),
('lee@test.com', '이철수', '010-3456-7890', '2023-03-10');

-- 상품 데이터 삽입
INSERT INTO product (product_id, name, price, stock) VALUES
(1, '노트북', 1500000, 50),
(2, '스마트폰', 800000, 100),
(3, '헤드폰', 200000, 200);

-- 주문 데이터 삽입
INSERT INTO orders (member_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2023-03-25'),
(2, 2, 2, '2023-04-02'),
(3, 3, 3, '2023-04-03');

-- user 테이블 설계

create table user(
	id int primary key auto_increment,
	username varchar(50) unique,
    email varchar(50) unique, 
    password varchar(50) not null,
    created_at timestamp default now()
);


-- 정상 데이터
INSERT INTO user (username, email, password)
VALUES ('gildong', 'gildong@test.com', 'pass123');

-- 중복된 username
INSERT INTO user (username, email, password)
VALUES ('gildong', 'gildong2@test.com', 'pass234');
-- ERROR 1062 (23000): Duplicate entry 'gildong' for key 'username'

-- 중복된 email
INSERT INTO user (username, email, password)
VALUES ('hong', 'gildong@test.com', 'pass345');
-- ERROR 1062 (23000): Duplicate entry 'gildong@test.com' for key 'email'

select * from user;

create table category(
	category_id int primary key auto_increment,
    name varchar(50) not null
);

alter table product
add column category_id int,
add constraint fk_category_id
foreign key(category_id) references category(category_id);

alter table orders
add index idx_order_date (order_date);

insert into category(name)
values('전자제품'),
	('가전제품');
    
select * from category;

update product
set category_id = 1;

select * from product;

insert into member (email, name, phone, join_date) VALUES
('park@test.com', '박민지', '010-4567-8901', '2023-04-05');

select * 
from member
where join_date > '20230301';

select * 
from product
where price >= 500000;

update member
set phone = '010-9999-0000'
where name = '이철수';

select * 
from member
where name = '이철수';

update product
set price = (price * 1.1)
where stock < 100;

select *
from product;


delete from orders
where order_date < '20230401';

select *
from orders
where order_date < '20230401';

delete from product
where stock = 0;

select *
from product;

-- 중복된 이메일 삽입 시도
INSERT INTO user (username, email, password)
VALUES ('hong', 'gildong@test.com', 'pass345');

-- 존재하지 않는 회원의 주문 추가 시도
INSERT INTO orders (member_id, product_id, quantity, order_date) VALUES
(10, 1, 1, '2023-03-25');

-- orders 테이블에서  member_id와 order_date로 복합 인덱스 생성
alter table orders
add index idx_member_id_order_date (member_id, order_date);

select *
from orders;
-- key 컬럼에서 어떤 인덴스가 표시되는지 확인
explain select * from orders;


-- 새로운 사용자 생성 및 권한 부여
create user 'test_user'@'localhost' identified by '1234';
grant select on shop.* to 'test_user'@'localhost';

-- 권한 확인
show grants for 'test_user'@'localhost';

-- 권한 회수
revoke select on shop.* from 'test_user'@'localhost';

create table movies(
	id int primary key auto_increment,
    title varchar(50),
    director varchar(50),
    release_date date,
    genre varchar(10),
    rating decimaL(4,2)
);

insert into movies(title, director, release_date, genre, rating) values
('괴물', '봉준호', '2006-07-27', '드라마', 8.28),
('극한직업', '이병헌', '2019-01-23', '사극', 9.20),
('명량', '김한민', '2014-07-30', '사극', 9.17),
('신과함께-죄와 벌', '김용화', '2017-12-20', '판타지', 7.56),
('밀양', '임권택', '2016-09--07', '드라마', 7.76),
('반도', '연상호', '2020-07-15', '액션', 6.71),
('베테랑', '류승완', '2015-08-15', '액션', 8.49),
('변호인', '양우석', '2013-12-18', '드라마', 8.41),
('군함도', '류승완', '2017-07-26', '사극', 8.01),
('암살', '최동훈', '2015-07-22', '액션', 8.37);

select * from movies;








