package com.test.toy.user.repository;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
			String sql = "select * from tblUser where id = ? and pw = ?";
			
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

}
