package com.unicom.follow;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import com.unicom.entity.Blog;
public class FollowService {

	public List<Blog> qryFollow( Integer id){
		List<Blog> list = new LinkedList<>();
		try {
			
			String sql = "select b.*  from follow a LEFT JOIN  blog  b"
					+ " on  a.followed_name = b.username where a.follower_name = 'user1'";
			Connection conn = JDBCUtils.getConnection();
		    PreparedStatement qryPstmt;
	    	qryPstmt = (PreparedStatement) conn.prepareStatement(sql);
	    	ResultSet rs = qryPstmt.executeQuery();
	    	while(rs.next()){
	    		Blog blog =new Blog();
	    		blog.setId(rs.getInt("id"));
	    		blog.setTitle(rs.getString("title"));
	    		blog.setCoverImageUrl(rs.getString("cover_image_url"));
	    		blog.setContent(rs.getString("content"));
	    		list.add(blog);
	    	}
	    	if(rs != null){
	    		rs.close();
	    	}
	    	qryPstmt.close();
	    	conn.close();
	    
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
}
