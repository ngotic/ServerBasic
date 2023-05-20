package com.test.ajax;

import lombok.Data;

@Data
public class Ex13DTO {
	private String seq;
	private String name;
	private String price;
	private String color;
	private String pic;
}
//seq number primary key,        -- 번호(PK)
//name varchar2(100) not null,   -- 상품명
//price number not null,         -- 가격
//color varchar2(50) not null,   -- 색상
//pic varchar2(100) default 'pic.png' not null -- 사진