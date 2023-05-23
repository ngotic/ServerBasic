-- dml.sql




-- 회원 
insert into tblUser(id, pw, name, email, lv, pic, profile)
    values ('hong', '1111', '홍길동', 'hong@gmail.com', '1', default, '자바를 공부하는 학생입니다.');

-- 관리자 회원
insert into tblUser(id, pw, name, email, lv, pic, profile)
    values ('admin', '1111', '관리자', 'admin@gmail.com', '3', default, '프로젝트 관리자입니다. 언제든지 연락주세요.');
    
commit;

select * from tblUser;


select * from (select a.*, rownum as rnum from vwBoard a )
    where rnum between 1 and 10;
    
    
select count(*) from tblBoard;
select count(*) as cnt from vwBoard;
    
    
    
select * from tblBoard;
select nvl(max(thread),0 ) as thread from tblBoard;

    
    