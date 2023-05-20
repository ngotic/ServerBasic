package com.test.toy.board.repository;

import lombok.Data;

@Data
public class BoardDTO {
	private String seq;
	private String subject;
	private String content;
	private String id;
	private String regdate;
	private String readcount;
	
	
	// ------------ DB에 없는 필드도 DTO에 담을 수 있다.
	private String name;  // 작성자 이름 
	private double isnew; // 최신글인지 확인
}
