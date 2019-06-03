package com.unicom.dao;
import com.unicom.entity.Comment;
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
 * @description: 分页
 * @author: HXM
 * @create: 2019-06-01 17:00
 */
public class CommentPaginationDao {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;
    Integer dataPerPage = StaticConstant.DATA_PER_PAGE;
    public List<Comment> getAllData(int currentPage,int bId){
        List<Comment> list = new ArrayList<>();
        try {
//            查询blog表中所有已发布且未被删除的博客信息
            //String sql2 ="select * from comments order by create_time desc";
            sql = "select * from blog525.comments where blog_id="+bId+" and is_deleted = 0 limit ?,?";
            System.out.println("sql:"+sql);
            conn = DBUtil.getConn();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (currentPage - 1) * dataPerPage);
            pstmt.setInt(2, dataPerPage);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Comment comment = new Comment();
                Integer id = rs.getInt(1);
                Integer blogId = rs.getInt(2);
                String commentator = rs.getString(3);
                String commentBody = rs.getString(6);
                Date createTime = rs.getDate(7);
                Date updateTime = rs.getDate(8);
                Integer isDeleted = rs.getInt(12);

                comment.setId(id);
                comment.setBlogId(blogId);
                comment.setCommentator(commentator);
                comment.setCommentBody(commentBody);
                comment.setCreateTime(createTime);
                comment.setUpdateTime(updateTime);
                if(isDeleted==0){
                    comment.setIsDeleted(false);
                }else {
                    comment.setIsDeleted(true);
                }
                list.add(comment);
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
    public int getTotalPage(){
        int pageCount = 0;
        try {
            sql = "select count(*) from blog525.comments where is_deleted = 0";

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
