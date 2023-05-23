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
	private String ccnt;  // 댓글 개수인데 계산할거 없으니까 이렇게 처리 > 현재글에 달린 댓글 개수
	
	private int thread; // 
	private int depth;  //
}
