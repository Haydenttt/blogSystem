package com.unicom.classification;

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

public class ClassificationPagination {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;
    Integer dataPerPage = StaticConstant.DATA_PER_PAGE;

    public List<Blog> getAllData(int currentPage, String category) {
        List<Blog> list = new ArrayList<>();
        try {
//            查询blog表中所有已发布且未被删除的博客信息
            sql = "select * from blog where status = 1 and is_deleted = 0 and category_name=? limit ?,?";

            conn = DBUtil.getConn();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category);
            pstmt.setInt(2, (currentPage - 1) * dataPerPage);
            pstmt.setInt(3, dataPerPage);

            rs = pstmt.executeQuery();
            while (rs.next()) {
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
        } finally {
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
    public int getTotalPage(String category) {
        int pageCount = 0;
        try {
            sql = "select count(*) from blog525.blog where status = 1 and is_deleted = 0 and category_name=?";

            conn = DBUtil.getConn();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                pageCount = rs.getInt(1);
            }
//            计算总页数
            pageCount = pageCount % dataPerPage == 0 ? pageCount / dataPerPage : pageCount / dataPerPage + 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
