-- script.sql

drop table tblFile;

create table tblFile (
    seq number primary key,          -- 번호(PK)
    name varchar2(30) not null,      -- 작성자
    filename varchar2(50) not null,  -- 파일명(하드에 저장되는 이름)
--    orgfilename varchar2(50) not null // 하드에 있는거만 기억하면 되니까
    regdate date default sysdate not null
);

create sequence seqFile;

select seq, filename from tblFile order by seq desc;

select * from tblFile;

-- 첨부파일 > 데이터베이스 관리
-- 1. 파일을 직접 DB에 저장 > 바이너리 저장
-- 2. 파일은 하드에 저장 > DB에는 파일명(텍스트)만 저장 > 주로 사용시!!
-- > 데이터베이스에 저장하면 약간의 처리과정이 있다. 속도가 느리다.
-- > 내가 직접 서버운영, 오라클 설치 > 컴터, 오라클 사야한다. 비싸다.
-- > 컴터를 어따가 놔야함? UPS라는게 있음 바뗴리, 전기나가면 보조바뗴리 몇분동안 버텨준다. 그러면
-- 와서 안전하게 꺼준다. 전원 안전장치, 그것도 전문적으로 관리하는 게 있음 1번방식은 돈이 든다. 그래서 잘 안한다.
-- DB에 문자열 저장하는게 좋다. 