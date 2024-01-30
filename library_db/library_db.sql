# 계정생성
# 계정명 : manager 비밀번호 : book
create user 'manager'@'%' identified by 'book';

# manager 계정이 library_db 의 모든 권한을 부여받는다
grant all privileges on library_db.* to 'manager'@'%';

# library.db 데이터베이스 생성
create database library_db
	default character set utf8mb4
	collate utf8mb4_general_ci
    default encryption = 'n';
    
# library_db 데이터베이스 사용
use library_db;
    
# Book 테이블 생성
create table book(
	book_id	int	auto_increment primary key,
    title	varchar(100),
    pubs	varchar(100),
    pub_date date,
    author varchar(100)
);

# Member 테이블 생성
create table membership(
	member_no int auto_increment primary key,
    member_name	varchar(100),
	phone_number varchar(100),
	address varchar (200),
    age int,
    member_id varchar(100),
    member_pw varchar(100)
);
# History 테이블 생성
create table history(
	book_rent date,
    book_return date,
    member_id varchar(100),
    book_id int not null
    constraint  history_fk foreign key(member_id)
    references 	membership(member_id)
	constraint	history_fk2 foreign key(book_id)
    references  book(book_id));
	
                
# book 내 데이터 입력
insert into book
values(null, '퓨처 셀프', '상상스퀘어', '2023-08-30', '벤저민 하디');   
insert into book
values(null, '세이노의 가르침', '데이원', '2023-03-02', '세이노');   
insert into book
values(null, '이처럼 사소한 것들', '다산책방', '2023-11-27', '클레어 키건');   
insert into book
values(null, '도둑맞은 집중력', '어크로스', '2023-04-28', '요한 하리');   
insert into book
values(null, '아이는 무엇으로 자라는가', '포레스트북스', '2023-12-18', '버지니아 사티어');   
insert into book
values(null, '역행자', '웅진지식하우스', '2023-05-29', '자청');   
insert into book
values(null, '모순', '쓰다', '2013-04-01', '양귀자');   
insert into book
values(null, '트렌드 코리아 2024', '미래의창', '2023-10-12', '김난도');   
insert into book
values(null, '메리골드 마음 사진관', '북로망스', '2024-01-12', '윤정은');   
insert into book
values(null, '아주 희미한 빛으로도', '문학동네', '2023-08-07', '최은영');   
insert into book
values(null, '맡겨진 소녀', '다산책방', '2023-04-21', '클레어 키건');   
insert into book
values(null, '최소한의 한국사', '프런트페이지', '2023-06-21', '최태성');   
insert into book
values(null, '사자왕 형제의 모험', '창비', '2015-07-10', '아스트리드 린드그렌');   
insert into book
values(null, '레버리지', '다산북스', '2023-02-15', '롭 무어');   
insert into book
values(null, '마케터의 무기들', '예미', '2024-02-10', '윤진호');   
insert into book
values(null, '트러스트', '문학동네', '2023-02-24', '에르난 디아스');  
insert into book
values(null, '의학의 대가들', '상상스퀘어', '2023-09-27', '앤드루 램');    
insert into book
values(null, '놀라움의 힘', '상상스퀘어', '2024-01-03', '마이클 루셀');    
insert into book
values(null, '불멸의 지혜', '스노우폭스북스', '2023-12-20', '윌러스 델로이드 와틀즈');    
insert into book
values(null, '인생은 순간이다', '다산북스', '2023-11-15', '김성근');                
    
select *
from book;

# membership 내 데이터 입력
insert into membership
values(null, '김수빈', '010-1111-1111', '서울', '27', 'ksb123', '1234');
insert into membership
values(null, '이은빈', '010-2222-2222', '경기도', '25', 'leb123', '1234');
insert into membership
values(null, '이미지', '010-3333-3333', '서울', '28', 'lmj123', '1234');
insert into membership
values(null, '문이규', '010-4444-4444', '경기도', '32', 'meg123', '1234');
insert into membership
values(null, '김복영', '010-5555-5555', '서울', '35', 'kby123', '1234');
insert into membership
values(null, '정원태', '010-6666-6666', '대전', '22', 'jwt123', '1234');
insert into membership
values(null, '성지우', '010-7777-7777', '대구', '20', 'sjw123', '1234');
insert into membership
values(null, '박석진', '010-8888-8888', '부산', '24', 'psj123', '1234');
insert into membership
values(null, '허소미', '010-9999-9999', '광주', '25', 'hsm123', '1234');
insert into membership
values(null, '심유석', '010-1234-1234', '서울', '32', 'sys123', '1234');

delete from membership
where member_id = 3;

select *
from membership;





    