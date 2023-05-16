-- 설문조사
create table tblResearch (
    seq number primary key,
    question varchar2(300) not null,
    item1 varchar2(300) not null,
    item2 varchar2(300) not null,
    item3 varchar2(300) not null,
    item4 varchar2(300) not null,
    cnt1 number default 0 not null, 
    cnt2 number default 0 not null, 
    cnt3 number default 0 not null, 
    cnt4 number default 0 not null
    );
select * from tblResearch;

insert into tblResearch values (1, '가장 자신있는 프로그래밍 언어는?',
                                   'JAVA',
                                   'C#',
                                   'PYTHON',
                                   'Dart', default, default, default, default);



-- 이걸 바로 바꿔도 현재 보고 있는 페이지에 반영이 안된다.
-- 우리는 복사본을 본다. > 새로고침을 하면 반영이 된다. 
update tblResearch set
    cnt1 = 5,
    cnt2 = 8,
    cnt3 = 5,
    cnt4 = 3
        where seq = 1;
        
                                   
commit;


select * from tblAddress;


select * from tblUser;


select '['||zip||'] '|| sido ||' '|| gugun ||' '|| dong||' '||bunji from zipcode where dong='개포4동';

drop table zipcode;

create table zipcode
(
  zip varchar2(7) not null,
  sido varchar2(50) not null,
  gugun varchar2(100) not null,
  dong varchar2(200) not null,
  bunji varchar2(200) null
);

select '['||zip||'] '|| sido ||' '|| gugun ||' '|| dong||' '||bunji as address from zipcode where dong='개포4동';



create table ajaxTable
(
  seq number primary key,
  x number not null,
  y number not null,
  ck char(1) not null
);

create sequence tableseq;
select * from zipcode where dong LIKE '%개포%';
select * from ajaxTable;

select '['||zip||'] '|| sido ||' '|| gugun ||' '|| dong||' '||bunji as address from zipcode where dong LIKE '%개포%';


insert into ajaxTable values(tableseq.nextVal, 0, 0, 0);
insert into ajaxTable values(tableseq.nextVal, 1, 0, 0);
insert into ajaxTable values(tableseq.nextVal, 2, 0, 0);
insert into ajaxTable values(tableseq.nextVal, 3, 0, 0);
insert into ajaxTable values(tableseq.nextVal, 4, 0, 0);

insert into ajaxTable values(tableseq.nextVal, 0, 1, 0);
insert into ajaxTable values(tableseq.nextVal, 1, 1, 0);
insert into ajaxTable values(tableseq.nextVal, 2, 1, 0);
insert into ajaxTable values(tableseq.nextVal, 3, 1, 0);
insert into ajaxTable values(tableseq.nextVal, 4, 1, 0);

insert into ajaxTable values(tableseq.nextVal, 0, 2, 0);
insert into ajaxTable values(tableseq.nextVal, 1, 2, 0);
insert into ajaxTable values(tableseq.nextVal, 2, 2, 0);
insert into ajaxTable values(tableseq.nextVal, 3, 2, 0);
insert into ajaxTable values(tableseq.nextVal, 4, 2, 0);

insert into ajaxTable values(tableseq.nextVal, 0, 3, 0);
insert into ajaxTable values(tableseq.nextVal, 1, 3, 0);
insert into ajaxTable values(tableseq.nextVal, 2, 3, 0);
insert into ajaxTable values(tableseq.nextVal, 3, 3, 0);
insert into ajaxTable values(tableseq.nextVal, 4, 3, 0);

insert into ajaxTable values(tableseq.nextVal, 0, 4, 0);
insert into ajaxTable values(tableseq.nextVal, 1, 4, 0);
insert into ajaxTable values(tableseq.nextVal, 2, 4, 0);
insert into ajaxTable values(tableseq.nextVal, 3, 4, 0);
insert into ajaxTable values(tableseq.nextVal, 4, 4, 0);

update ajaxTable set ck = (select case when ck = 1 then 0 else 1 end as ckTo from ajaxTable where x=1 and y=1) where x=1 and y=1;
select case when ck = 1 then 0 else 1 end as ckTo from ajaxTable where x=1 and y=1;

select * from ajaxTable;

commit;











