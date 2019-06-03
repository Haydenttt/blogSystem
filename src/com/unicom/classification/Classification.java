package com.unicom.classification;

import com.unicom.entity.Blog;
import com.unicom.homepage.DButil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: BlogSystem
 * @description: 分类
 * @author: Hayden TONG
 * @create: 2019-05-27 09:04
 **/
public class Classification {

    public static List<Blog> getBlogByCategory(String category) throws SQLException {
        String sql = "select * from blog where category_name = ?";
        ResultSet rs = DButil.select(sql, new Object[]{category});
        List<Blog> blogList = new ArrayList<>();
        while (rs.next()){
            Blog blog = new Blog();
            blog.setId(rs.getInt("id"));
            blog.setTitle(rs.getString("title"));
            blog.setCoverImageUrl(rs.getString("cover_image_url"));
            blog.setContent(rs.getString("content"));
            blog.setCategoryId(rs.getInt("category_id"));
            blog.setCategoryName(rs.getString("category_name"));
            blog.setStatus(rs.getBoolean("status"));
            blog.setViews(rs.getInt("views"));
            blog.setUsername(rs.getString("username"));
            blog.setNickname(rs.getString("nickname"));
            blog.setIsDeleted(rs.getBoolean("is_deleted"));
            blog.setCreateTime(rs.getDate("create_time"));
            blog.setUpdateTime(rs.getDate("update_time"));
            blogList.add(blog);
        }
        return blogList;
    }
}
