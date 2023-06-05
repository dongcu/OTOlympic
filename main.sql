create database project2;
use project2;
create table user(
	userid varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300) not null,
    usernick varchar(300) not null,
    zipcode varchar(300) not null,
    addr varchar(1000),
    addrdetail varchar(1000),
    addretc varchar(300),
    email varchar(600) not null,
    phone varchar(300),
    duedate datetime
);
update user set userpw = 1 where userid = 'apple';
insert into user (userid, userpw, username, usernick, zipcode, email) values ('admin', 1, 1, 1, 1, 1);
alter table user modify column duedate date;

create table f_board(
	b_num int primary key auto_increment,
    b_title varchar(1000) not null,	
	b_writer varchar(300) not null,	
	b_date datetime default now(),	
	b_content text not null,	
	b_like int,	
	view_cnt int default 0
);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (1, '제목1', 'apple', '테스트 내용1', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (2, '제목2', 'apple', '테스트 내용2', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (3, '제목3', 'apple', '테스트 내용3', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (4, '제목4', 'apple', '테스트 내용4', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (5, '제목5', 'apple', '테스트 내용5', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (6, '제목6', 'apple', '테스트 내용6', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (7, '제목7', 'apple', '테스트 내용7', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (8, '제목8', 'apple', '테스트 내용8', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (9, '제목9', 'apple', '테스트 내용9', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (10, '제목10', 'apple', '테스트 내용10', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (11, '제목11', 'apple', '테스트 내용11', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (12, '제목12', 'apple', '테스트 내용12', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (13, '제목13', 'apple', '테스트 내용13', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (14, '제목14', 'apple', '테스트 내용14', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (15, '제목15', 'apple', '테스트 내용15', 1);
insert into f_board (b_num, b_title, b_writer, b_content, view_cnt) values (16, '제목16', 'banana', '테스트 내용16', 1);
select b_num, b_title, b_writer, b_date, view_cnt from f_board where b_writer = 'apple' order by b_num desc;
select * from f_board b join f_comment c on b.b_num = c.c_num order by c_date desc limit 0, 5;

create table f_comment(
	c_num int primary key auto_increment,
	c_writer varchar(300) not null,
	c_contents text not null,
	c_date datetime default now(),
	c_like int,
	b_num int
);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글1', 1);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글2', 1);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글3', 1);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글4', 1);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글5', 1);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글6', 1);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글7', 1);
insert into f_comment(c_writer, c_contents, b_num) values('apple', '테스트 댓글8', 16);

create table ex_board(
	ex_num int primary key auto_increment,	
	ex_title varchar(1000) not null,	
	ex_writer varchar(300) not null,	
	ex_date datetime default now(),	
	ex_content text not null,	
	ex_like int default 0,	
	view_cnt int default 0
);
insert into ex_board (ex_title, ex_writer, ex_content) values ('제목1', 'apple', '테스트 내용1');
insert into ex_board (ex_title, ex_writer, ex_content) values ('제목1', 'banana', '테스트 내용1');

create table exc_comment(
	exc_num int primary key auto_increment,
	exc_writer varchar(300) not null,
	exc_contents text not null,
	exc_date datetime default now(),
	exc_like int,
	ex_num int
);
insert into exc_comment(exc_writer, exc_contents, ex_num) values('apple', '테스트 댓글1', 1);
insert into exc_comment(exc_writer, exc_contents, ex_num) values('apple', '테스트 댓글1', 14);

create table notice(
	notice_num int primary key auto_increment,
	notice_title varchar(1000) not null,
	notice_contents varchar(3000) not null,
	notice_date datetime default now(),
	view_cnt int default 0
);

create table admin_reservation(
	rv_num int primary key auto_increment,
	rv_date date,
	rv_time varchar(300),
	rv_title varchar(300),
    rv_limit int not null,
    rv_headCnt int default 0
);
insert into admin_reservation values (3, '2023-02-04', '09:10 ~ 10:00', '줌바', 20, 0);
insert into admin_reservation values (4, '2023-01-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (5, '2022-12-04', '09:10 ~ 10:00', '요가', 20, 1);
insert into admin_reservation values (6, '2022-10-04', '09:10 ~ 10:00', '에어로빅', 20, 1);
insert into admin_reservation values (7, '2022-09-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (8, '2022-04-04', '09:10 ~ 10:00', '필라테스', 20, 1);
insert into admin_reservation values (9, '2022-02-04', '09:10 ~ 10:00', '필라테스', 20, 1);
insert into admin_reservation values (10, '2022-01-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (11, '2021-12-04', '09:10 ~ 10:00', '스피닝', 20, 1);
insert into admin_reservation values (12, '2021-11-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (13, '2021-11-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (14, '2021-11-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (15, '2021-11-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (16, '2021-11-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation values (17, '2021-11-04', '09:10 ~ 10:00', '줌바', 20, 1);
insert into admin_reservation (rv_date, rv_time, rv_title, rv_limit) values ('2023-02-11', '09:10 ~ 10:00', '줌바', 20);
insert into admin_reservation (rv_date, rv_time, rv_title, rv_limit) values ('2023-02-26', '09:10 ~ 10:00', '줌바', 20);
insert into admin_reservation (rv_date, rv_time, rv_title, rv_limit) values ('2023-01-26', '09:10 ~ 10:00', '줌바', 20);


create table reservation(
	userid varchar(300),
    rv_num int
);
insert into reservation values ('apple', 3);
insert into reservation values ('apple', 4);
insert into reservation values ('apple', 5);
insert into reservation values ('apple', 6);
insert into reservation values ('apple', 7);
insert into reservation values ('apple', 8);
insert into reservation values ('apple', 9);
insert into reservation values ('apple', 10);
insert into reservation values ('apple', 11);
insert into reservation values ('apple', 12);
insert into reservation values ('apple', 13);
insert into reservation values ('apple', 14);
insert into reservation values ('apple', 15);
insert into reservation values ('apple', 16);
insert into reservation values ('apple', 20);
insert into reservation values ('apple', 32);

select * from admin_reservation a join reservation r on a.rv_num = r.rv_num where userid = 'apple' and rv_date > now();

create table message(
	msg_num int primary key auto_increment,
	sender varchar(300),
	title varchar(300),
    contents varchar(5000),
    reception char(1) check(reception in ('O','X')) default 'X',
    time datetime,
    receiver varchar(300)
);

create table product(
   pronum varchar(300) primary key,
    orderid varchar(30) not null,
    userid varchar(300),
    itemname varchar(300) not null,
    totalamount varchar(300),
    taxfree varchar(300),
    month int
);
insert into product (pronum, orderid, itemname, totalamount, taxfree, month) values ('p1001','1001','MembershipGold', '200000', '20000', 12);
insert into product (pronum, orderid, itemname, totalamount, taxfree, month) values ('p1002','1002','MembershipSilver', '150000', '15000', 6);
insert into product (pronum, orderid, itemname, totalamount, taxfree, month) values ('p1003','1003','MembershipBronze', '50000', '5000', 2);

select version();