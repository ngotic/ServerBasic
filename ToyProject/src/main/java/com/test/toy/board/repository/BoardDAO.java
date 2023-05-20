package com.test.toy.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class BoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO(){
		this.conn = DBUtil.open();
	}

	public int add(BoardDTO dto) {
		String sql = "insert into tblBoard (seq, subject, content, id, regdate, readcount) values (seqBoard.nextVal, ?, ?,?, default, default)";
		
		try {
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			
			return pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	// Board 서블릿이 게시판 목록주세요.
	public List<BoardDTO> list() {
		
		try {
			String sql = "select * from vwBoard"; // 이렇게 뷰로 따로 미리 만든다. 
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			List<BoardDTO > list = new ArrayList<BoardDTO>();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setSeq(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate")); // 알아서 형변환을 해주는 것이다. 
				dto.setReadcount(rs.getString("readcount"));
				dto.setName(rs.getString("name"));
				dto.setIsnew(rs.getDouble("isnew"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {

		}
		return null;
	}
	
	
}
