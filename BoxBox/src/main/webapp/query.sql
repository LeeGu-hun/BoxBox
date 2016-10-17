/* 테이블 구축 */

-- POST 테이블 생성
create table post (
	post_id number(10) primary key,
	post_dong varchar2(60),
	post_gu varchar2(60),
	post_city varchar2(60),
	post_street varchar2(120)
);

-- MEMBER 테이블 생성
create table member (
  	user_id number(6) primary key,
  	user_email varchar2(100),
  	user_name varchar2(30),
  	password varchar2(30),
  	user_phone varchar2(20),
  	user_type number(2),
  	user_amount number(10)
);

-- PLACE 테이블 생성
create table place (
	place_id number(3) primary key,
	place_name varchar2(60),
	constraint post_id_fk foreign key(post_id) references post,
	constraint admin_fk foreign key(user_id) references member
);

-- RENTAL_ITEM 테이블 생성
create table rental_item (
	rental_item_id number(6) primary key,
	rental_category varchar2(60) not null,
	rental_model varchar2(120) not null,
	rental_info varchar2(300),
	rental_fee number(10),
	model_photo varchar2(60)
);

-- RENTAL 테이블 생성
create table rental (
	rental_id number(6) primary key,
	constraint place_id_fk foreign key(place_id) references place,
	constraint rental_item_id_fk foreign key(rental_item_id) references rental_item,
	password varchar2(20),
	rental_empty number(2)
);

-- RENTAL_ORDER 테이블 생성
create table rental_order (
	order_item_id number(6) primary key,
	constraint rental_id_fk foreign key(rental_id) references rental,
	constraint user_id_fk foreign key(user_id) references member,
	order_date date,
	start_time date,
	end_time date,
	order_price number(10),
	extra_end_time date,
	extra_price number(10),
	rental_full number(2)
);

-- COUNT 테이블 생성(계산용 테이블)
create table count (
	cnt number(4)
);

-- RENTAL_FULL 테이블 생성(계산용 테이블)
create table rental_full (
	start_hour number(2),
	full_hour number(1)
)


/* 각 테이블의 primary key에 삽입되는 시퀀스 생성 */

-- MEMBER 테이블의 user_id 칼럼에 삽입될 시퀀스 생성
create sequence seq_member
start with 1 increment by 1;

-- PLACE 테이블의 place_id 칼럼에 삽입될 시퀀스 생성
create sequence seq_place
start with 1 increment by 1;

-- POST 테이블의 post_id 칼럼에 삽입될 시퀀스 생성
create sequence seq_post
start with 1 increment by 1;

-- RENTAL_ITEM 테이블의 rental_item_id 칼럼에 삽입될 시퀀스 생성
create sequence seq_rental_item
start with 1 increment by 1;

-- RENTAL 테이블의 rental_id 칼럼에 삽입될 시퀀스 생성
create sequence seq_rental
start with 1 increment by 1;

-- RENTAL_ORDER 테이블의 order_list_id 칼럼에 삽입될 시퀀스 생성
create sequence seq_order_list
start with 1 increment by 1;


/* 로그인 페이지 */

-- 로그인 버튼
select * from member
where user_email = 'cylee@boxbox.com' and password = '2';

-- 회원가입 버튼
insert into member(user_id, user_email, user_name, password, user_type, user_phone)
values(seq_member.nextval, 'cyrichard@naver.com', '이찬윤', '1', '2', '01077974470');


/* header 부분 */

-- 회원정보 변경 버튼
update member
set user_name = '이찬윤', password = '2'
where user_email = 'cyrichard@naver.com';


/* 사용자 메인 페이지 */

-- 

/* 대여가능물품 조회 페이지 */
-- 예약 -> 추가하기 버튼 : 프로시저 ORDER_CNT(사용자가 선택한 시간에 예약이 가능한지 아닌지 판별해 주는 프로시저 )
create or replace procedure order_cnt (  
  v_rental_id in number,
  v_start_hour in number,
  v_end_hour in number
)
as
begin
	update count set cnt = 0;      
  	for i in v_start_hour .. (v_end_hour - 1) loop       
    	update  count
    	set cnt = cnt + (select count(*) 
        	             from (select *
            	               from rental_order
                	           where rental_id = v_rental_id
                    		   	  and user_id <> 1
                               	  and to_date(to_char(sysdate + 9/24, 'YY/MM/DD'), 'YY/MM/DD HH24:MI:SS') + i/24 >= start_time
                            	  and to_date(to_char(sysdate + 9/24, 'YY/MM/DD'), 'YY/MM/DD HH24:MI:SS') + (i+1)/24 - 1/(24*60*60) <= end_time)
                     	);
  	end loop;
  	commit;  
end;
/

exec order_cnt(2,1,5);

select * from count;

-- 비어있는 시간 조회 버튼 : 프로시저 HOUR_FULL(대여물품에 대하여 오늘 예약 가능한 시간을 표시해 주는 프로시저 )
create or replace procedure hour_full (
  v_rental_id in number
)
as
begin
	delete from rental_full;
    
    for i in 0 .. 23 loop
    	insert into rental_full(start_hour, full_hour)
    	values(i,
        			(select count(*)
            		 from (select * from rental_order
                     	   where rental_id = v_rental_id
                      	   	  and user_id <> 1
                              and to_date(to_char(sysdate + 9/24, 'YY/MM/DD'), 'YY/MM/DD HH24:MI:SS') + i/24 >= start_time
                              and to_date(to_char(sysdate + 9/24, 'YY/MM/DD'), 'YY/MM/DD HH24:MI:SS') + (i+1)/24 - 1/(24*60*60) <= end_time)
                    )
      		  );
    end loop;
    commit;
end;
/

exec hour_full(1);

select full_hour from rental_full;


/* 예약하기 페이지 */

-- 결제 버튼
insert into rental_order
values(seq_order_list.nextval,
	   3, 11,
       to_date(to_char(sysdate, 'YY/MM/DD'), 'YY/MM/DD HH24:MI:SS'),
       to_date(to_char(sysdate, 'YY/MM/DD'), 'YY/MM/DD HH24:MI:SS') + 12/24,
       to_date(to_char(sysdate, 'YY/MM/DD'), 'YY/MM/DD HH24:MI:SS') + 14/24 - 1/(24*60*60),
       (select (14-12) * rental_fee
        from rental_item natural join rental
        where rental_id = 3),
        1,
        '1234');