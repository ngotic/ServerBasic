package com.test.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class CatDAO {
	
	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	private ResultSet rs = null;

	public CatDAO() {
		this.conn = DBUtil.open();
	}

	public List<CatDTO> loadCat() {
		String sql= "select * from ajaxCat";
		try {
			pstat = conn.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery();
			
			List<CatDTO> list = new ArrayList<CatDTO>();
			
			while(rs.next()) {
				CatDTO cdto = new CatDTO();
				cdto.setId( rs.getString("id") );
				cdto.setX(rs.getString("x"));
				cdto.setY(rs.getString("y"));
				list.add(cdto);
			}
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	public int updateCatPoint(CatDTO dto) {
		String sql = "update ajaxCat set x = ?, y = ?  where id = ?";
		
		try {
			System.out.println(dto.getX() + dto.getY() +dto.getId() );
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getX());
			pstat.setString(2, dto.getY());
			pstat.setString(3, dto.getId());
			
			return pstat.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
	

}
