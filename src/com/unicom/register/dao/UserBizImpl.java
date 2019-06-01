package com.unicom.register.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.unicom.entity.User;

import com.unicom.util.DBCon;

public class UserBizImpl {
	
	DBCon con=new DBCon();
	public boolean query(String username, String password) {
		
		boolean flag=false;
		String sql="select * from users where username=? and password=?";
		ResultSet rs=con.query(sql,username,password);
		try {
			if (rs.next()) {
				flag=true;
			}
			else {
				flag=false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
		
		    
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
