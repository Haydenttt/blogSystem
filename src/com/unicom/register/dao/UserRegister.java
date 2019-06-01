package com.unicom.register.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;



import com.unicom.util.DBCon;

import javafx.scene.chart.PieChart.Data;

public class UserRegister {
	
	
	
	DBCon con=new DBCon();
//	public boolean i(String username, String password,String nickname,String gender,String email) throws SQLException {
//		
//		boolean flag=false;
//		String sql="insert into users values(username=? and password=? and nickname=? and gender=? and email=? and creat_time=?) ";
//		boolean rs=con.insert(sql,username,password,nickname,gender,email,new Date());
//		if (rs) {
//			flag=true;
//		}
//		else {
//			flag=false;
//		}
//		
//		return flag;
//		
//	}
	public Boolean insert(String username, String password,boolean gender, String nickname,String email) {
		// TODO Auto-generated method stub
//		boolean flag=false;
//		String sql="insert into users (username,password,nickname,email)values(username=? and password=? and nickname=? and  email=?) ";
////		CheckIn date=new CheckIn(new Date(0));
////		,date.getFormatTime("YYYY-MM-DD HH:MM:ss")
//		boolean rs=con.insert(sql,username,password,nickname,email);
//		if (rs) {
//			flag=true;
//		}
//		else {
//			flag=false;
//		}
//		
//		return flag;
//		
//	}   
	return con.update("insert into users (username,password,nickname,email,gender,create_time) values (?,?,?,?,?,now())",username,password,nickname,email,gender)>0;
	
	}
}
