package com.unicom.follow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import com.unicom.entity.Blog;
import com.unicom.util.DBUtil;

public class FollowService {

	public List<Blog> qryFollow(String username){
		List<Blog> list = new LinkedList<>();
		try {
			
			String sql = "select b.*  from follow a LEFT JOIN  blog  b"
					+ " on  a.followed_name = b.username where a.follower_name = ?";
			Connection conn = DBUtil.getConn();
		    PreparedStatement qryPstmt;
	    	qryPstmt = conn.prepareStatement(sql);
	    	qryPstmt.setString(1, username);
	    	ResultSet rs = qryPstmt.executeQuery();
	    	while(rs.next()){
	    		Blog blog =new Blog();
	    		blog.setId(rs.getInt("id"));
	    		blog.setTitle(rs.getString("title"));
	    		blog.setCoverImageUrl(rs.getString("cover_image_url"));
	    		blog.setContent(rs.getString("content"));
	    		blog.setUsername(rs.getString("username"));
	    		list.add(blog);
	    	}
			DBUtil.close(conn);
			DBUtil.close(qryPstmt);
			DBUtil.close(rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
