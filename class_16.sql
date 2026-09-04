DROP DATABASE IF EXISTS relation_practice;
CREATE DATABASE relation_practice;
USE relation_practice;

-- 실습 1 - 코드로 1: 1 관계 만들어 보기

create table tb_person(
	person_id int auto_increment,
	name varchar(50) not null,
    primary key (person_id)
);

create table tb_passport(
		passport_id int auto_increment,
        passport_number varchar(20) not null,
        person_id int unique, -- 이 UNIQUE가 1:1을 만들어 준다.
        primary key (passport_id),
        foreign key(person_id) references tb_person(person_id)
);

insert into tb_person (name) values
('홍길동'),
('김영희'),
('이철수');

insert into tb_passport (passport_number, person_id) values
('p123', 1),
('p456', 2),
('p789', 3);

select * from tb_person;
select * from tb_passport;


-- FK 외래키 유니크 키 설정이 되어 있어 1:1 관계를 보장한다
insert into tb_passport (passport_number, person_id) values
('p100', 1);
-- Error Code: 1062. Duplicate entry '1' for key 'tb_passport.person_id'


-- 실습 2 - 코드로 1: N 관계 만들어 보기
create table tb_customer(
	customer_id int auto_increment,
    name varchar(50) not null,
    primary key (customer_id)
);

create table tb_order(
	order_id int auto_increment,
    product_name varchar(50) not null,
    customer_id int,		-- UNIQUE 가 없기 때문에 1:N 구조
    primary key(order_id),
    foreign key (customer_id) references tb_customer(customer_id)
);

TRUNCATE TABLE tb_order;

insert into tb_customer(customer_id, name) values
(1, '박민지'),
(2, '최재영');

insert into tb_order(order_id, product_name, customer_id) values
(201, '노트북', 1),
(202, '마우스', 1),
(203, '키보드', 2);

select * from tb_customer;
select * from tb_order;


-- 실습 3 - 코드로 N : M 관계 만들어 보기
create table tb_student(
	student_id int auto_increment,
    name varchar(50) not null,
    primary key(student_id)
);

create table tb_course(
	course_id int auto_increment,
    title varchar(50) not null,
    primary key(course_id)
);

create table tb_student_course(
	student_id int,
    course_id int,
    primary key(student_id, course_id),
    foreign key(student_id) references tb_student(student_id),
    foreign key(course_id) references tb_course(course_id)
);

-- tb_student
insert into tb_student(name) values
('홍길동'),
('김영희'),
('박민지');

-- tb_course
insert into tb_course(course_id, title) values
(101, '자바프로그램밍'),
(102, '데이터베이스'),
(103, '웹개발입문');

-- tb_student_course
insert into tb_student_course(student_id, course_id) values
(1, 101),
(1, 102),
(2, 102),
(2, 103),
(3, 101);

select * from tb_course;
select * from tb_student;
select * from tb_student_course;


-- 도전 과제 : 1 : N 관계 테이블 설계 , 1 : 1 관계 직접 테이블 설계, N:M 관계 테이블 설계  

-- 1: n
create table tb_dept(
	dept_id int auto_increment,
    name varchar(50),
    primary key(dept_id)
);

create table tb_emp(
	emp_id int auto_increment,
    name varchar(50) not null,
    dept_id int,
	foreign key(dept_id) references tb_dept(dept_id),
    primary key(emp_id)
);

insert into tb_dept(dept_id, name) values
	(1001, '영업부'),
	(1002, '개발부');

insert into tb_emp(name, dept_id) values
('김업경', 1001),
('홍길동', 1001),
('김갑환', 1002);

select * from tb_people;
select * from tb_emp;

-- 1:1
create table tb_member(
	member_id int auto_increment,
    name varchar(50),
    primary key(member_id)
);

insert into tb_member(name) values
('김업경'),
('홍길동'),
('김갑환');

create table tb_room(
	room_number int auto_increment,
    member_id int unique,
    foreign key(member_id) references tb_member(member_id),
    primary key(room_number)
);

insert into tb_room(room_number, member_id) values
(101, 1),
(102, 2),
(103, 3);

select * from tb_room;

-- n:m
create table tb_ebook(
	ebook_id int auto_increment,
    title varchar(50),
    primary key(ebook_id)
);

create table tb_user(
	user_id int auto_increment,
    name varchar(50),
    primary key(user_id)
); 

create table tb_user_tb_ebook(
	ebook_id int,
    user_id int,
    primary key(ebook_id, user_id),
    foreign key(ebook_id) references tb_ebook(ebook_id),
    foreign key(user_id) references tb_user(user_id)
);
    
insert into tb_ebook(ebook_id, title) values
(801, '오만과 편견'),
(101, '지혜의 저편');

insert into tb_user(name) values
('김업경'),
('홍길동'),
('김갑환');

insert into tb_user_tb_ebook(ebook_id, user_id) values
(101, 1),
(801, 1),
(101, 2),
(101, 3);

select * from tb_ebook;
select * from tb_user;
select * from tb_user_tb_ebook;










