-- ddl.sql


drop table tblUser;
-- 회원
create table tblUser(
    id varchar2(50) primary key,
    pw varchar2(50) not null,
    name varchar2(50) not null,
    email varchar2(100) not null,
    lv char(1) not null,
    pic varchar2(100) default 'pic.png' not null ,
    profile varchar2(500) not null
);

-- 게시판
create table tblBoard(
    seq number primary key,                          -- 번호(PK) 
    subject varchar2(300) not null,                  -- 제목
    content varchar2(4000) not null,                 -- 내용
    id varchar2(30) not null references tblUser(id), -- 아아디(FK)
    regdate date default sysdate not null,           -- 작성시각
    readcount number default 0 not null              -- 읽음
);


select * from tblBoard;
create sequence seqBoard;

drop table tblBoard;
drop sequence seqBoard;

select regdate from tblBoard;

-- 뷰로 만들자 
create or replace view vwBoard
as
select seq, subject, id, readcount, 
    (select name from tblUser where id = tblBoard.id  ) as name,
    (sysdate - regdate) as isnew,
    case when to_char(sysdate, 'yyyy-mm-dd') = to_char(regdate, 'yyyy-mm-dd') 
    	then to_char(regdate, 'hh24:mi:ss')
    else
    	to_char(regdate, 'yyyy-mm-dd')
    end as regdate,
    (select count(*) from tblComment where bseq = tblBoard.seq) as ccnt,
    content, -- 컬럼을 하나 추가했다. 이건 화면엔 안보여줄 것이다. 근데 이 컬럼에 있어야 우리가 만든 select절에 여기에 content 컬럼을 조건으로 걸 수 있다. 
    depth
from tblBoard order by thread desc;


select * from vwBoard

commit;


select to_char(regdate, 'hh24:mi:ss') from tblBoard;


select 
    tblBoard.*,
    (select name from tblUser where id = tblBoard.id) as name
from tblBoard 
    where seq = 21;
    -- 칼럼서브쿼리 ★


create table tblComment (
    seq number primary key,                          --번호(PK)
    content varchar2(2000) not null,                 --댓글내용
    regdate date default sysdate not null,           -- 작성시각
    id varchar2(50) not null references tblUser(id), --아아디(FK)
    bseq number not null references tblBoard(seq)
);

select * from tblBoard;
select * from tblComment;

drop table tblComment;
create sequence seqComment;

select * from tblComment;


drop table tblComment;
drop table tblBoard;


delete from tblBoard;
commit;
-- 답변형 게시판 로직 ! 
create table tblBoard(
    seq number primary key,                          -- 번호(PK) 
    subject varchar2(300) not null,                  -- 제목
    content varchar2(4000) not null,                 -- 내용
    id varchar2(30) not null references tblUser(id), -- 아아디(FK)
    regdate date default sysdate not null,           -- 작성시각
    readcount number default 0 not null,              -- 읽음
    thread number not null,                           -- 답변형(정렬)
    depth number not null                             -- 답변형(출력)
);

select * from tblBoard;