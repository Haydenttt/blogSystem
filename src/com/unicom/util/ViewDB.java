package com.unicom.util;

import com.unicom.entity.Blog;
import com.unicom.entity.BlogView;
import com.unicom.entity.Comment;
import org.json.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class ViewDB {
    String sql ="select * from comments";

    String sql2 ="select * from comments order by create_time desc";

//    private static final String driver="jdbc:mysql://localhost:3306/blog525";
//    private static final String root="root";
//    private static final String password ="123456";
    //关注
    public String accountIsLikes(int islike){
        System.out.println("db coming");
        String likesql ="select sum(blog_id) as a from follow where is_liked=2 and blog_id="+islike;
        Connection cn =null;
        Statement statement=null;
        ResultSet rs =null;
        JSONObject dbjsonObj = new JSONObject();
        int likeCount =0;
        try {
            cn = DBUtil.getConn();
            //3.1创建执行sql语句的对象，并且执行sql语句
            statement = cn.createStatement();
            //3.2 执行sql语句
            rs = statement.executeQuery(likesql);
            while(rs.next()) {
                likeCount = rs.getInt("a");
            }
            dbjsonObj.put("likeCount",likeCount);
            DBUtil.close(statement);
            DBUtil.close(cn);
            DBUtil.close(rs);
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("test:"+dbjsonObj.toString());
        return dbjsonObj.toString();
    }
    //博客查询
public Blog blogValue(int  blogId){
    String sql11 ="select * from blog where id ="+blogId;
    Connection cn =null;
    Statement statement=null;
    ResultSet rs =null;
   // List<Blog> list=new ArrayList<Blog>();
    Blog blog=new Blog();
    try {
        cn = DBUtil.getConn();
        //3.1创建执行sql语句的对象，并且执行sql语句
        statement = cn.createStatement();
        //3.2 执行sql语句
        rs = statement.executeQuery(sql11);
        while(rs.next()){
            blog.setId(rs.getInt("id"));
            blog.setTitle(rs.getString("title"));
            blog.setCoverImageUrl(rs.getString("cover_image_url"));
            blog.setContent(rs.getString("content"));
            blog.setCategoryId(rs.getInt("category_id"));
            blog.setCategoryName(rs.getString("category_name"));
            blog.setStatus(rs.getBoolean("status"));
            blog.setViews(rs.getInt("views"));
            blog.setIsDeleted(rs.getBoolean("is_deleted"));
            blog.setUsername(rs.getString("username"));
            blog.setNickname(rs.getString("nickname"));
            blog.setCreateTime(rs.getTimestamp("create_time"));
            blog.setUpdateTime(rs.getTimestamp("update_time"));
            //list.add(blog);
        }
        DBUtil.close(statement);
        DBUtil.close(cn);
        DBUtil.close(rs);
    } catch (SQLException e) {
        e.printStackTrace();
    }catch (Exception e){
        e.printStackTrace();
    }
    return blog;
}
    //String sql2 ="update user set username=\"eee\",password=\"555\",name=\"李五\" where uid=\"3\"";
    public boolean blogViewUpdate(int  blogId,int count){
        System.out.println("test count:"+count);
        String viewsql ="update blog set views="+count+" where id="+blogId;
        int num=0;
        Connection cn =null;
        Statement statement=null;
        try {
            cn = DBUtil.getConn();
            //3.1创建执行sql语句的对象，并且执行sql语句
            statement = cn.createStatement();
            //3.2 执行sql语句
            num  = statement.executeUpdate(viewsql);
            if(num>0){
                return true;
            }
            DBUtil.close(statement);
            DBUtil.close(cn);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //按博客id获取博客主要信息
    public List<BlogView> blogParById(int blogId){
      //  String bd = String.valueOf(blogId);//+blogId
        String sql3 ="select * from blog where id ="+blogId;
        Connection cn =null;
        Statement statement=null;
        ResultSet resultSet =null;
        List<BlogView> list = new ArrayList<BlogView>();
        try {
           // DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DBUtil.getConn();
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
            DBUtil.close(statement);
            DBUtil.close(cn);
            DBUtil.close(resultSet);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    //获取博客主要信息，与评论表关联的几个主要字段
    public List<BlogView> blogPar(int blogId){
        Connection cn =null;
        Statement statement=null;
        ResultSet resultSet =null;
        List<BlogView> list = new ArrayList<BlogView>();
        try {
          //  DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DBUtil.getConn();
            //3.1创建执行sql语句的对象，并且执行sql语句
            statement = cn.createStatement();
            //3.2 执行sql语句
            String sql1 ="select * from blog ="+blogId;
            resultSet = statement.executeQuery(sql1);
            while (resultSet.next()){
                BlogView bv = new BlogView();
                bv.setId(resultSet.getInt("id"));
                bv.setTitle(resultSet.getString("title"));
                bv.setCoverImageUrl(resultSet.getString("cover_image_url"));
                bv.setContent(resultSet.getString("content"));
                list.add(bv);
            }
            DBUtil.close(statement);
            DBUtil.close(cn);
            DBUtil.close(resultSet);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
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
          //  DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DBUtil.getConn();
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
            DBUtil.close(statement);
            DBUtil.close(cn);
            DBUtil.close(resultSet);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
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
           // DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DBUtil.getConn();
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
                Date replyCreateTime = resultSet.getDate("update_time");
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
            DBUtil.close(statement);
            DBUtil.close(cn);
            DBUtil.close(resultSet);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    public void addIsLikes(int blogId,String followerName,String followedName){
        Connection cn =null;
        PreparedStatement preparedStatement =null;
        try {
            cn = DBUtil.getConn();
           // String addLikeSql = "insert into comments values(null,followerName,followedName,blogId,2,0,now(),now())";
            String addLikeSql = "insert into follow values(null,?,?,?,?,?,now(),now())";
            preparedStatement = cn.prepareStatement(addLikeSql);
            preparedStatement.setString(1,followerName);
            preparedStatement.setString(2,followedName);
            preparedStatement.setInt(3,blogId);
            preparedStatement.setInt(4,2);
            preparedStatement.setInt(5,0);
            int num = preparedStatement.executeUpdate();
            if (num>0){
                System.out.println("插入操作成功");
            }
            //4.释放资源
            DBUtil.close(preparedStatement);
            DBUtil.close(cn);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
//    public int ofIsLikes(){
//        Connection cn =null;
//        PreparedStatement preparedStatement =null;
//        try {
//            cn = DBUtil.getConn();
//            // String addLikeSql = "insert into comments values(null,followerName,followedName,blogId,2,0,now(),now())";
//            String addLikeSql = "select COUNT(id) from follow where blog_id=? and is_liked=1 and is_cancelled=0";
//            preparedStatement = cn.prepareStatement(addLikeSql);
//            preparedStatement.setString(1,followerName);
//            preparedStatement.setString(2,followedName);
//            preparedStatement.setInt(3,blogId);
//            preparedStatement.setInt(4,2);
//            preparedStatement.setInt(5,0);
//            int num = preparedStatement.executeUpdate();
//            if (num>0){
//                System.out.println("插入操作成功");
//            }
//            //4.释放资源
//            DBUtil.close(preparedStatement);
//            DBUtil.close(cn);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
    //添加评论
    public void AddComment(int blogIds,String comments) {

        Connection cn =null;
        PreparedStatement preparedStatement =null;
        try {
            //1.加载数据库驱动
           // DriverManager.registerDriver(new Driver());
            //2.获得连接  ?characterEncoding=utf-8&serverTimezone=UTC
            cn = DBUtil.getConn();
            //3 执行sql语句
            String sqlAdd = "insert into comments values(null,?,?,?,?,?,now(),now(),?,?,?,?)";
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
            DBUtil.close(preparedStatement);
            DBUtil.close(cn);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBClose.release(preparedStatement,cn);
        }
       // return list;
    }
}
