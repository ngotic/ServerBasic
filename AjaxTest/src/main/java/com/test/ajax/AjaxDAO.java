package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class AjaxDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AjaxDAO() {
		this.conn = DBUtil.open();
	}

	public int count() {
		try {
			String sql = "select count(*) as cnt from tblMemo";// as 를 붙여서 키값을 바꾼다. 
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ResearchDTO getResearch(int seq) {
		
		try {
			String sql = "select * from tblResearch where seq = " + seq;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			if(rs.next()) {
				ResearchDTO dto = new ResearchDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
							
				String[] item = { rs.getString("item1"),
						rs.getString("item2"),
						rs.getString("item3"),
						rs.getString("item4")};
//				dto.setCnt(null);
				String[] cnt = { rs.getString("cnt1"),
						rs.getString("cnt2"),
						rs.getString("cnt3"),
						rs.getString("cnt4")};
				
				dto.setItem(item);
				dto.setCnt(cnt);
				
				return dto;  // 필요하면 얼마든지 가공해서 넣는다. 
			}
		} catch (Exception e) {

		}
		return null;
	}

	public List<AddressDTO> listAddress() {
		
		try {
			
			String sql = "select * from tblAddress";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			List<AddressDTO> list = new ArrayList<AddressDTO>();
			
			while(rs.next()) {
				AddressDTO dto = new AddressDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				list.add(dto);
			}
			return list;
			
		} catch( Exception e ) {
			
			e.printStackTrace();
		}
		
		return null;
	}

	public int checkId(String id) {
		
		try {
			String sql = "select count(*) as cnt from tblUser where id=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs= pstat.executeQuery();
			
			if(rs.next() ) {
				return rs.getInt("cnt");
			}
			
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<ZipCode>  search(String dong)  {
		String sql = "select * from zipcode where dong like '%' || ? || '%'";
		
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dong);
			rs = pstat.executeQuery();
			List<ZipCode> list = new ArrayList<>();
			
			while(rs.next()) {
				ZipCode dto = new ZipCode();
				
				dto.setZip(rs.getString("zip"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setBunji(rs.getString("bunji"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
}
