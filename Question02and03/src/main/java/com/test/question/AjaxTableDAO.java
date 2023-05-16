package com.test.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import lombok.Data;

@Data
public class AjaxTableDAO {
	
	private Connection conn=null;
	private PreparedStatement pstat=null;
	private Statement stat = null;
	private ResultSet rs = null;

	
	
	
}
