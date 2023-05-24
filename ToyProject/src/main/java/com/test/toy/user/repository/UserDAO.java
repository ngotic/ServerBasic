package com.test.toy.user.repository;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.test.my.DBUtil;

public class UserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO(){
		this.conn = DBUtil.open();
	}
	
	
	public int register(UserDTO dto) {
		
		try {
			String sql = "insert into tblUser (id, pw, name, email, pic, profile, lv) values (?, ?, ?, ?, ? ,? , 1 )";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getPic());
			pstat.setString(6, dto.getProfile());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}


	public UserDTO login(UserDTO dto) {
		try {
			String sql = "select * from tblUser where id = ? and pw = ?  and ing='y'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			
			if (rs.next()) {
				UserDTO result = new UserDTO();
				
				// 이정도만 넘기자 
				result.setId(rs.getString("id"));
				result.setLv(rs.getString("lv"));

				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public UserDTO get(String id) {
		
		try {

			String sql = "select * from tblUser where id = '"+ id + "'";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				UserDTO dto = new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setLv(rs.getString("lv"));
				dto.setPic(rs.getString("pic"));
				dto.setProfile(rs.getString("profile"));
				

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
		
	}

	// DAO의 메소드 1개 > 딱 1개의 SQL만 실행할 것 !! 
	public Map<String, String> getCount(String id) {
		// TODO Auto-generated method stub
		
		try {
			Map<String, String > map = new HashMap<String, String>();
			String sql ="select count(*) as cnt from tblBoard where id =? ";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			if(rs.next()) {
				map.put("bcount", rs.getString("cnt"));
			}
			
			sql ="select count(*) as cnt from tblComment where id =? ";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			if(rs.next()) {
				map.put("ccount", rs.getString("cnt"));
			}
	
			rs.close();
			pstat.close();
			
			return map;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public int unregister(String id) {
		
		try {
			String sql = "update tblUser set pw='x', name='x', email='x',pic='x',profile='x', ing='x' where id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}
