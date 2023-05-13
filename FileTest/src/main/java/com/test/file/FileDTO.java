package com.test.file;

// VO vs DTO 
// - 데이터를 저장하는 객체
// - VO : Value Object
//   - DB에서 가져온 데이터를 보관
//   - 읽기 전용 > 리터럴(상수)
//   - 고치면 안됨 수정하는 순간 VO가 아니다. > setter를 정의하지 않음 

// DTO는 수정가능
// - DTO : Data Transfer Object
//   - 계층간에 데이터를 전송할 때 사용되는 도구(택배상자)
//   - 컨트롤러라는 계층이 뷰에게 보낼 때 택배상자(택배 상자)
//   - 하나의 계층에서 또다른 계층에서 전송할 떄만든 클래스인데 한 눈에 알아보기 쉽게 이름을 붙임  

// 보통 VO든 DTO든 둘중에 하나쓰기하는데 ... 
// 목록보기 : DB > DAO > (VO) > 컨트롤러 > (VO) > JSP
// 글쓰기 : JSP > 컨트롤러 > (DTO) > DAO > DB

// VO든 DTO든 둘 중 하나를 결정해야 함 가독성 때문에 그렇다. 

//AddressVO
//AddressDTO 가 범용성이 높다. 잘 모르겠으면 DTO를 붙인다.

//tblFile 테이블의 내용을 전달하기 위한 상자  
public class FileDTO { // 메서드는 필요 없다.  
	private String seq;
	private String name;
	private String filename;
	private String regdate;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
