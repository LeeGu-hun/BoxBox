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

-- 지역 선택(콤보상자)
select distinct po.post_city || '-' || po.post_gu || '-' || po.post_dong as "지역"
from place pl, post po
where pl.post_id = po.post_id
order by "지역";

-- 지역에 따른 관리소 선택(콤보상자)
select distinct place_name
from place pl, post po
where pl.post_id = po.post_id
	and po.post_city = '부산광역시'  
	and po.post_gu = '동구'
	and po.post_dong = '초량동';

-- 대여가능 물품 검색 버튼
select r.rental_id,p.post_gu,pl.place_name,i.rental_category,i.rental_model,i.rental_info,i.rental_fee,i.model_photo
from rental_item i,place pl, post p ,rental r
where  p.POST_ID = pl.POST_ID
	and pl.PLACE_ID=r.PLACE_ID
	and r.RENTAL_ITEM_ID = i.RENTAL_ITEM_ID
	and pl.PLACE_NAME = '부산역관리소';

	
/* 대여가능물품 조회 페이지 */
	
-- 예약시간 조회 버튼
select r.RENTAL_ID, p.post_gu, pl.PLACE_NAME,
	to_char(o.start_time, 'YYYY/MM/DD') as order_date, 
	to_char(o.start_time, 'YYYY/MM/DD HH24') as start_time,
	to_char(o.end_time+1/(24*60*60), 'YYYY/MM/DD HH24:MI') as end_time,
	i.rental_category, i.rental_model, i.rental_info, i.model_photo,
	i.rental_fee,O.RENTAL_FULL
from place pl,post p,rental r, rental_item i, rental_order o
where pl.PLACE_ID = r.PLACE_ID
	and p.POST_ID = pl.POST_ID
	and r.RENTAL_ID = o.RENTAL_ID
	and i.RENTAL_ITEM_ID = r.RENTAL_ITEM_ID
	and r.RENTAL_ID = 1
	and o.rental_full = 1
	and o.START_TIME > sysdate - 50
order by pl.PLACE_ID, r.RENTAL_ID, o.start_time;

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


/* My Rental 페이지 */

-- 자신의 예약 내역 조회 
select r.rental_id, pl.place_name, ro.order_price,
	to_char(ro.order_date, 'MM.DD') || ' ' || to_char(ro.start_time, 'HH24') || '시-' || to_char(ro.end_time, 'HH24') || '시' as "예약시간",
	ri.RENTAL_CATEGORY, ri.MODEL_PHOTO, ro.PASSWORD
from place pl, rental r, rental_item ri, rental_order ro, member m
where pl.place_id = r.place_id
	and r.rental_item_id = ri.rental_item_id
	and r.rental_id = ro.rental_id
	and m.user_id = ro.user_id
	and m.user_id = 11
	and ro.rental_full = 1
order by "예약시간";

-- 반납 버튼
update rental_order
set rental_full = 0
where order_list_id = 3;


/* 관리자 페이지 : 관리소 조회 */
-- 관리소 조회 버튼



/* 관리자 페이지 : 관리소 및 대여 추가 */

-- 관리소추가 버튼
insert into place(place_id, place_name, post_id, user_id)
values(
  seq_place.nextval,
  '중앙공원관리소', 
  (select post_id from post
   where post_city = '부산광역시' and post_gu = '중구'
     and post_dong = '영주동' and post_street = '중앙공원로'),
  2
);

-- 대여추가 버튼
insert into rental(rental_id, place_id, rental_item_id)
values
  (seq_rental.nextval,
   (select place_id from place
    where place_name = '부산역관리소'),
   (select rental_item_id from rental_item
    where rental_info = '강민호 실사 포수미트')
);