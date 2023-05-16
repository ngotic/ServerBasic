package com.test.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.my.DBUtil;


public class ZipCodeDAO {
	
	
	private Connection conn=null;
	private PreparedStatement pstat=null;
	private Statement stat = null;
	private ResultSet rs = null;
			
	public ZipCodeDAO() {
		this.conn = DBUtil.open();
	}

	public String list(String dong){
		
			
		if(dong.equals(""))	 return null;
			                                                                                                     // ★★★★ 쪼개서 더했다. 문자열 더하기 문자열 더하기로 만든다. 그냥 무름표다. 변수가 아니다.  
		String sql = "select '['||zip||'] '|| sido ||' '|| gugun ||' '|| dong||' '||bunji as address from zipcode where dong LIKE '%'||?||'%'";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dong);
			rs = pstat.executeQuery();
			
			String temp = "[";
			while(rs.next()) {
				temp += "{";
				String address = rs.getString("address");
				temp += String.format("\"address\": \"%s\" ", address);
				temp += "},";
			}
			temp = temp.substring(0, temp.length()-1);
			temp += "]";
			
			if(temp.equals("]"))
				return null;
			
			return temp;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	
	
}
