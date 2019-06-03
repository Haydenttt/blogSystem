package com.unicom.pagination.dao;

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

    public List<Blog> getAllData(int currentPage,String keyword){
        List<Blog> list = new ArrayList<>();
        try {
            sql = "select * from blog525.blog where status = 1 and is_deleted = 0 and concat(title,username) like concat('%','"+keyword+"','%')limit ?,?";
            conn = DBUtil.getConn();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (currentPage - 1) * dataPerPage);
            pstmt.setInt(2, dataPerPage);
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
                list.add(blog);
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

    //    计算总页数
    public int getTotalPage(String keyword){
        int pageCount = 0;
        try {
            sql = "select count(*) from blog525.blog where status = 1 and is_deleted = 0 and concat(title,username) like concat('%','"+keyword+"','%')";

            conn = DBUtil.getConn();
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while(rs.next()){
                pageCount = rs.getInt(1);
            }
//            计算总页数
            pageCount = pageCount % dataPerPage == 0 ? pageCount / dataPerPage : pageCount / dataPerPage + 1;
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
        return pageCount;
    }
}
