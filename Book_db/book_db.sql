# 도서 테이블 만들기
create table book(
	book_id int auto_increment primary key,
	title varchar(100)  not null,
    pub varchar(100) not null,
	pub_date datetime,
	author_id int,
    constraint book_fk foreign key(author_id)
    references author(author_id)
);
# 작가 테이블 만들기
create table author(
	author_id int auto_increment primary key,
	author_name varchar(100) not null,
	author_desc varchar(500)
);
# 작가 등록
insert into author
values (null, '이문열','경북 영양');
insert into author
values (null, '박경리','경상남도 통영');
insert into author
values (null, '유시민','17대 국회의원');
insert into author
values (null, '기안84','기안동에서 산 84년생');
insert into author
values (null, '강풀','온라인 만화가 1세대');
insert into author
values (null, '김영하','알쓸신잡');

select *
from author;

# 도서 등록
insert into book
values (null, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book
values (null, '삼국지', '민음사', '2002-03-01', 1);
insert into book
values (null, '토지', '마로니에북스', '2012-08-15', 2);
insert into book
values (null, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
insert into book
values (null, '패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book
values (null, '순정만화', '재미주의', '2011-08-03', 5);
insert into book
values (null, '오직두사람', '문학동네', '2017-05-04', 6);
insert into book
values (null, '26년', '재미주의', '2012-02-04', 5);

select *
from book;

# 강풀 author_desc 수정
update author
set author_name = '강풀',
	author_desc = '서울특별시'
where author_id = 5;

select *
from author;

# 기안_84 삭제
delete from author
where author_id = 4;
-- 삭제되지 않는 이유: book 테이블에서 사용한 자료에 author_id 가 반드시 들어가기 때문에
-- 해당 작가 아이디에 해당하는 정보들은 꼭 필요한 정보를 잃게 되어 워크벤치에서 기본적으로 거부한다.