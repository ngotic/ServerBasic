package com.test.question;

import lombok.Data;

@Data
public class Question05DTO {
	private String seq;
	private String name;
	private String tel;
	private String address;
}

//seq number primary key,
//name varchar2(20) not null,
//tel varchar2(20) not null,
//address varchar2(100) not null