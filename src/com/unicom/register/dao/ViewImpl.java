package com.unicom.register.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.regexp.internal.recompile;
import com.unicom.entity.Blog;

import com.unicom.entity.Follow;
import com.unicom.util.DBCon;

public class ViewImpl {
	DBCon con=new DBCon();
	public List<Blog> query5() {

		List<Blog> list=new ArrayList<Blog>();
		//boolean flag=false;
		String sql="select * from blog order by views desc  LIMIT 6";
		ResultSet rs=con.query(sql);

		try {
			while (rs.next()) {

				Blog blog=new Blog();
				blog.setTitle(rs.getString("title"));
				blog.setViews(rs.getInt("views"));
				list.add(blog);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String sql="select id from users where follower_id=?;
		return list;
	}

	public List<Follow> query6() {

		List<Follow> list = new ArrayList<Follow>();
		//boolean flag=false;
		String sql = "select count(blog_id) as a  from follow where is_liked=1 group by blog_id  limit 6";
		ResultSet rs = con.query(sql);

		try {
			while (rs.next()) {

				Follow follow = new Follow();

				follow.setId(rs.getInt("a"));
				list.add(follow);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String sql="select id from users where follower_id=?;
		return list;




	}

	public int query4(String username) {

		//boolean flag=false;
		String sql="select count(id) as a from blog where username=?";
		ResultSet rs=con.query(sql,username);
		int i=0;
		try {
			if (rs.next()) {
				i=rs.getInt("a");
			}
			else {
				System.out.println("有错");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String sql="select id from users where follower_id=?;
		return i;
	}
	public int  query(String username) {
		// TODO Auto-generated method stub
		//List<Blog> list=new ArrayList <Blog> ();
	  int i=0;
		ResultSet rs=con.query("select sum(views) as a from blog where username=?", username);
		 
		try {
			if (rs.next()) {
				i=rs.getInt("a");
				System.out.println(i);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public int  query1(Boolean is_liked) {
		// TODO Auto-generated method stub
		//List<Blog> list=new ArrayList <Blog> ();
	  int i=0;
		ResultSet rs=con.query("select sum(blog_id) as a from follow where is_liked=?", false);
		 
		try {
			if (rs.next()) {
				i=rs.getInt("a");
				System.out.println(i);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
   public int query3(String username) {
		
		//boolean flag=false;
		String sql="select id from users where username=?";
		ResultSet rs=con.query(sql,username);
		int i=0;
		try {
			if (rs.next()) {
				i=rs.getInt("id");
			}
			else {
				System.out.println("错误");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String sql="select id from users where follower_id=?;
		return i;

	}
	public int  query2(Boolean is_liked,String username) {
		// TODO Auto-generated method stub
		//List<Blog> list=new ArrayList <Blog> ();
	int flat=query3(username);
	    int i=0;
		ResultSet rs=con.query("select sum(blog_id) as a from follow where is_liked=? and follower_name=?", true,username);
		 
		try {
			if (rs.next()) {
				i=rs.getInt("a");
				System.out.println(i);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
