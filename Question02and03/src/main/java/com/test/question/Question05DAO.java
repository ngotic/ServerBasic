package com.test.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class Question05DAO {

	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	private ResultSet rs = null;

	public Question05DAO() {
		this.conn = DBUtil.open();
	}
	
	public List<Question05DTO> listTable() {
		
		List<Question05DTO> list = new ArrayList<Question05DTO>();
		String sql = "select * from ajaxList order by seq";
		
		try {
			pstat = conn.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery();
			
			while(rs.next()) {
				Question05DTO dto = new Question05DTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addList(Question05DTO dto) {
		String sql = "insert into ajaxList values(listseq.nextVal, ?, ?, ?) ";
		
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTel());
			pstat.setString(3, dto.getAddress());
			return pstat.executeUpdate();
			
		} catch (Exception e) {

		}
		return 0;
	
	}

}
