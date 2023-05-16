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