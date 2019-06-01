package com.unicom.dao;

import com.unicom.entity.Blog;
import com.unicom.util.DBUtil;
import com.unicom.util.StaticConstant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: BlogSystem
 * @description: 伪模糊搜索：博客标题或发布过文章的作者昵称
 * @author: Hayden TONG
 * @create: 2019-05-31 16:10
 **/
public class SearchDao {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;
    Integer dataPerPage = StaticConstant.DATA_PER_PAGE;

    public List<Blog> fuzzySearch(String keyword){
        List<Blog> list = new ArrayList<>();
        try {
            sql = "select * from blog525.blog where status = 1 and is_deleted = 0 and concat(title,username) like concat('%',"+keyword+",'%')limit ?,?";

            conn = DBUtil.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Blog blog = new Blog();
                Integer id = rs.getInt(1);
                String title = rs.getString(2);
                String coverImgUrl = rs.getString(3);
                String content = rs.getString(4);
                Integer categoryId = rs.getInt(5);
                Integer views = rs.getInt(8);
                String nickname = rs.getString(10);
                Date updateTime = rs.getDate(13);

                blog.setId(id);
                blog.setTitle(title);
                blog.setCoverImageUrl(coverImgUrl);
                blog.setContent(content);
                blog.setCategoryId(categoryId);
                blog.setViews(views);
                blog.setNickname(nickname);
                blog.setUpdateTime(updateTime);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                DBUtil.close(rs);
                DBUtil.close(pstmt);
                DBUtil.close(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
