package com.test.mvc;


// tblAddress > 레코드 1개를 담을 수 있는 객체
// Address Value Object
public class AddressVO {
	
	private String seq;
	private String name;
	private String age;
	private String tel;
	private String address;
	
	
	
	@Override
	public String toString() {
		return "AddressVO [seq=" + seq + ", name=" + name + ", age=" + age + ", tel=" + tel + ", address=" + address
				+ "]";
	}
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
