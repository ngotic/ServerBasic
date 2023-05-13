package com.test.file;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;


// DAO, Data Access Object(DAO 약자는 대문자 적는데 사람마다 다름) 
// - DB 작업 담당자 
// - 데이터 작업 담당자
public class FileDAO { 
	// data 소스에 종류에 따라 파일입출력, xml출력등 db사용 이런걸 할 수 있는 영역단
	// jdbc를 쓸거면 jdbc, 다른거면 다른거
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public FileDAO() {
		this.conn = DBUtil.open();
	}

	public int add(FileDTO dto) {
		
		try {
			String sql = "insert into tblFile (seq, name, filename, regdate) values(seqFile.nextVal, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getFilename());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<FileDTO> list() {
		
		try {
			// 두가지만 가져온다. column을 > 안쓰는거 버려 
			// String sql = "select * from tblFile order by seq desc";
			
			String sql = "select seq, filename from tblFile order by seq desc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List <FileDTO> list = new ArrayList<FileDTO>();
//			System.out.println("this>>"+rs);
			while(rs.next() ) {
//				System.out.println("this---->>"+rs);
				FileDTO dto = new FileDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setFilename(rs.getString("filename"));
				list.add(dto);
			}
			
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return null;
	}

	public FileDTO get(String seq) {
		try {
			
			String sql = "select * from tblFile where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				//레코드 1줄 > DTO 1개
				FileDTO dto = new FileDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setFilename(rs.getString("filename"));
				dto.setRegdate(rs.getString("regdate"));
				return dto;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int edit(FileDTO dto) {
	
		// 단순하다. 원래이름 > 수정안함 > 원래이름으로 덮어쓰기
		// 
		try {
			String sql = "";
			if(dto.getFilename() !=null && !dto.getFilename().equals("")) {
				
//				System.out.println("+++++1");
				sql= "update tblFile set name= ?, filename=? where seq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getName());
				pstat.setString(2, dto.getFilename());
				pstat.setString(3, dto.getSeq());
				
			} else {
//				System.out.println("+++++2"+dto.getName()+","+dto.getSeq());
				sql= "update tblFile set name= ? where seq = ?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getName());
				pstat.setString(2, dto.getSeq());
			}
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			
			
		}
		return 0;
	}

	public int remove(String seq) {
		
		try {
			
			String sql = "delete from tblFile where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			return pstat.executeUpdate();
			
		} catch (Exception e) {

			
		}
		return 0;
	}
	
}
