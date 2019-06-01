package com.unicom.register.dao;


import com.unicom.entity.User;
import com.unicom.util.DBCon;

public class UserEditImpl {
	DBCon con=new DBCon();
	
	public boolean edit(User user) {
		
		return con.update("update  users set nickname=?, password=? where username=?",user.getNickname(),user.getPassword(),user.getUsername())>0; 
		//return false;
		
	}

}
