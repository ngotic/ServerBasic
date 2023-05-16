create table tblCategory (
    seq number primary key ,
    name varchar2(50) not null,
    icon varchar2(100) not null,
    color varchar2(10) not null
);


drop table tblCategory;
drop table tblMemo;
create table tblMemo (
    seq number primary key, -- 번호(PK)
    memo varchar2(2000) not null,   -- 메모
    regdate date default sysdate not null, -- 작성시각
    cseq number not null references tblCategory(seq) -- 카메고리
);


drop sequence seqCategory;
create sequence seqCategory;
drop sequence seqMemo;
create sequence seqMemo;

select * from tblCategory;
select * from tblMemo;
insert into tblCategory values(seqCategory.nextVal, '할일', 'check', '#FFC23C');
insert into tblCategory values(seqCategory.nextVal, '장보기', 'shopping_cart', '#34B3F1');
insert into tblCategory values(seqCategory.nextVal, '코딩', 'code', '#00ABB3');

insert into tblMemo values (seqMemo.nextVal, '메모입니다.', default, 1);
commit;

select 
    tblMemo.*,
    (select icon from tblCategory where seq = tblMemo.cseq) as icon,
    (select color from tblCategory where seq = tblMemo.cseq) as color 
from tblMemo order by seq desc;



