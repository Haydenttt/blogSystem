package com.unicom.util;
import com.unicom.entity.BlogView;
import com.unicom.entity.Comment;
import java.sql.*;
import com.mysql.jdbc.Driver;
import java.util.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class ViewDB {

    String sql ="select * from comments";
    String sql2 ="select * from comments order by create_time desc";
    String sql1 ="select * from blog";

    private static final String driver="jdbc:mysql://localhost:3306/blog525";
    private static final String root="root";
    private static final String password ="123456";
    //按博客id获取博客主要信息
    public List<BlogView> blogParById(int blogId){
      //  String bd = String.valueOf(blogId);//+blogId
        String sql3 ="select * from blog where id ="+blogId;
        Connection cn =null;
        Statement statement=null;
        ResultSet resultSet =null;
        List<BlogView> list = new ArrayList<BlogView>();
        try {
            DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DriverManager.getConnection(driver,
                    root,password);
            //3.1创建执行sql语句的对象，并且执行sql语句
            statement = cn.createStatement();
            //3.2 执行sql语句
            resultSet = statement.executeQuery(sql3);
            while (resultSet.next()){
                BlogView bv = new BlogView();
                bv.setId(resultSet.getInt("id"));
                bv.setTitle(resultSet.getString("title"));
                bv.setCoverImageUrl(resultSet.getString("cover_image_url"));
                bv.setContent(resultSet.getString("content"));
                list.add(bv);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBClose.release(statement,cn,resultSet);
        }
        return list;
    }
    //获取博客主要信息，与评论表关联的几个主要字段
    public List<BlogView> blogPar(){
        Connection cn =null;
        Statement statement=null;
        ResultSet resultSet =null;
        List<BlogView> list = new ArrayList<BlogView>();
        try {
            DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DriverManager.getConnection(driver,
                    root,password);
            //3.1创建执行sql语句的对象，并且执行sql语句
            statement = cn.createStatement();
            //3.2 执行sql语句
            resultSet = statement.executeQuery(sql1);
            while (resultSet.next()){
                BlogView bv = new BlogView();
                bv.setId(resultSet.getInt("id"));
                bv.setTitle(resultSet.getString("title"));
                bv.setCoverImageUrl(resultSet.getString("cover_image_url"));
                bv.setContent(resultSet.getString("content"));
                list.add(bv);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBClose.release(statement,cn,resultSet);
        }
        return list;
    }
    //查询评论
    public List<Comment> SelectComment() {
        Connection cn =null;
        Statement statement=null;
        ResultSet resultSet =null;
        List<Comment> list = new ArrayList<Comment>();
        try {
            //1.加载数据库驱动
            DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DriverManager.getConnection(driver,
                    root,password);
            //3.1创建执行sql语句的对象，并且执行sql语句
            statement = cn.createStatement();
            //3.2 执行sql语句
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Comment comment = new Comment();
                int id=resultSet.getInt("id");
                int blogId = resultSet.getInt("blog_id");
                String commentator =resultSet.getString("commentator");
                String email = resultSet.getString("email");
                String websiteUrl = resultSet.getString("website_url");
                String commentBody = resultSet.getString("comment_body");
                Date createTime = resultSet.getDate("create_time");
                String replyBody =resultSet.getString("reply_body");
                Date replyCreateTime = resultSet.getDate("reply_create_time");
                //comment对象属性初始化
                comment.setId(id);
                comment.setBlogId(blogId);
                comment.setCommentator(commentator);
                comment.setEmail(email);
                comment.setWebsiteUrl(websiteUrl);
                comment.setCommentBody(commentBody);
                comment.setCreateTime(createTime);
                comment.setReplyBody(replyBody);
                int isComments = resultSet.getInt("is_comments");
                if (isComments==0){
                    comment.setIsComments(true);
                }else {
                    comment.setIsComments(false);
                }
                //将comment对象存入list中
                list.add(comment);
            }
            //4.释放资源
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBClose.release(statement,cn,resultSet);
        }
        return list;
    }
    //查询评论按时间倒序
    public List<Comment> SelectCommentByTime() {
        Connection cn =null;
        Statement statement=null;
        ResultSet resultSet =null;
        List<Comment> list = new ArrayList<Comment>();
        try {
            //1.加载数据库驱动
            DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DriverManager.getConnection(driver,
                    root,password);
            //3.1创建执行sql语句的对象，并且执行sql语句
            statement = cn.createStatement();
            //3.2 执行sql语句
            resultSet = statement.executeQuery(sql2);
            while (resultSet.next()) {
                Comment comment = new Comment();
                int id=resultSet.getInt("id");
                int blogId = resultSet.getInt("blog_id");
                String commentator =resultSet.getString("commentator");
                String email = resultSet.getString("email");
                String websiteUrl = resultSet.getString("website_url");
                String commentBody = resultSet.getString("comment_body");
                Date createTime = resultSet.getDate("create_time");
                String replyBody =resultSet.getString("reply_body");
                Date replyCreateTime = resultSet.getDate("reply_create_time");
                //comment对象属性初始化
                comment.setId(id);
                comment.setBlogId(blogId);
                comment.setCommentator(commentator);
                comment.setEmail(email);
                comment.setWebsiteUrl(websiteUrl);
                comment.setCommentBody(commentBody);
                comment.setCreateTime(createTime);
                comment.setReplyBody(replyBody);
                int isComments = resultSet.getInt("is_comments");
                if (isComments==0){
                    comment.setIsComments(true);
                }else {
                    comment.setIsComments(false);
                }
                //将comment对象存入list中
                list.add(comment);
            }
            //4.释放资源
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBClose.release(statement,cn,resultSet);
        }
        return list;
    }
    //添加评论
    public void AddComment(int blogIds,String comments) {

        Connection cn =null;
        PreparedStatement preparedStatement =null;
        try {
            //1.加载数据库驱动
            DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog525",
                    "root","123456");
            //3 执行sql语句
            String sqlAdd = "insert into comments values(null,?,?,?,?,?,now(),?,?,now(),?,?)";
            preparedStatement = cn.prepareStatement(sqlAdd);
            preparedStatement.setInt(1,blogIds);
            preparedStatement.setString(2,"zhangsan");
            preparedStatement.setString(3,"123@qq.com");
            preparedStatement.setString(4,"img/1.jpeg");
            preparedStatement.setString(5,comments);
            preparedStatement.setString(6,"");
            preparedStatement.setString(7,"");
            preparedStatement.setInt(8,1);
            preparedStatement.setInt(9,0);
            int num = preparedStatement.executeUpdate();
            if (num>0){
                System.out.println("插入操作成功");
            }
            //4.释放资源
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBClose.release(preparedStatement,cn);
        }
       // return list;
    }
}
