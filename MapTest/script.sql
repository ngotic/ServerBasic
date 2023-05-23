-- 장소등록
create table tblPlaceCategory (
    seq number primary key,
    name varchar2(100) not null,
    marker varchar2(50) not null
);


create table tblPlace (

    seq number primary key,      -- 번호(pk)
    name varchar2(100) not null, -- 장소
    lat number not null,         -- 위도
    lng number not null,         -- 경도
    cseq number not null references tblPlaceCategory(seq)
);

create sequence seqPlaceCategory;
create sequence seqPlace;
drop sequence seqPlaceCategory;
drop sequence seqPlace;
delete from tblPlaceCategory;
drop table tblPlaceCategory;
drop table tblPlace;

insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '맛집', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '카페', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '운동', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '빵집', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '술집', 'default');
select * from tblPlaceCategory;
select * from tblPlace;

commit;


select * from tblPlace;
commit;


SELECT * FROM PRODUCT_COMPONENT_VERSION;