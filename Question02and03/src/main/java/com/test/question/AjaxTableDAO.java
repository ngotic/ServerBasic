package com.test.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.my.DBUtil;

import lombok.Data;

@Data
public class AjaxTableDAO {

	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	private ResultSet rs = null;

	public AjaxTableDAO() {
		this.conn = DBUtil.open();
	}

	
	public int updateTableAdd(String x, String y, String ck) {
		try {
			
			String sql;
			
			if (ck.equals("1")) {
				sql = "update ajaxTable set ck = (select case when ck = 0 or ck = 2 then 1 else 0 end as ckTo from ajaxTable where x=? and y=?) where x=? and y=?";
			}
			else if(ck.equals("2")) {
				sql = "update ajaxTable set ck = (select case when ck = 0 or ck = 1 then 2 else 0 end as ckTo from ajaxTable where x=? and y=?) where x=? and y=?";
			} else {
				sql = "update ajaxTable set ck = 0 ";
			}
				
			pstat = conn.prepareStatement(sql);
			
			if(ck.equals("1") || ck.equals("2")) {
				pstat.setString(1, x);
				pstat.setString(2, y);
				pstat.setString(3, x);
				pstat.setString(4, y);
			}
			
			System.out.println("test");
			
			return pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int updateTable(String x, String y) {

		try {
			String sql = "update ajaxTable set ck = (select case when ck = 1 then 0 else 1 end as ckTo from ajaxTable where x=? and y=?) where x=? and y=?";
			System.out.println("test");
			pstat = conn.prepareStatement(sql);

			
			pstat.setString(1, x);
			pstat.setString(2, y);
			pstat.setString(3, x);
			pstat.setString(4, y);
			return pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}

	public String readTable() {
		
		try {
			String temp = "[";
			String sql = "select * from ajaxTable";
			pstat = conn.prepareStatement(sql);
			ResultSet rs= pstat.executeQuery();
			
			
			while(rs.next()) {
				temp += "{";
				String x = rs.getString("x");
				String y =rs.getString("y");
				String ck =rs.getString("ck");
				temp += String.format(" \"x\":\"%s\", \"y\":\"%s\", \"ck\" :\"%s\" ", x, y, ck);
				temp += "},";
			}
			temp = temp.substring(0, temp.length()-1);
			temp += "]";
			return temp;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	

}
