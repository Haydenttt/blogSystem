package com.unicom.blogManagement;

import com.unicom.entity.Blog;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: BlogSystem
 * @description: 我的
 * @author:
 * @create: 2019-05-27 09:03
 **/
public class BlogManagementDAO {
    public List<Blog> BlogList(ResultSet rs){
        List<Blog> list=new ArrayList<Blog>();
        try {
            while(rs.next()){
                Blog blog=new Blog();
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
                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public List<Blog> findCategoryByUsername(String username,String category){
        ResultSet rs;
        List<Blog> list;
        if(category.equals("all")){
            String sql="select * from blog where username=? and status=1 and is_deleted=0";
            Object[] params={username};
            rs=DButil.select(sql, params);
            list=BlogList(rs);
        }else{
            String sql="select * from blog where username=? and category_name=? and status=1 and is_deleted=0";
            Object[] params={username,category};
            rs=DButil.select(sql, params);
            list=BlogList(rs);
        }
        DButil.close();
        return list;
    }

    public List<Blog> findDraftByUsername(String username){
        ResultSet rs;
        List<Blog> list;
        System.out.println(username);
        String sql="select * from blog where username=? and status=0 and is_deleted=0";
        Object[] params={username};
        rs=DButil.select(sql, params);
        list=BlogList(rs);
        System.out.println(list.size());
        DButil.close();
        return list;
    }

    public void deleteBlogByID(int id){
        String sql="update blog set is_deleted=1 where id=?";
        Object[] params={id};
        DButil.update(sql, params);
        DButil.close();
    }

    public void updateBlogByID(int id){
        String sql="update blog set status=1 where id=?";
        Object[] params={id};
        DButil.update(sql, params);
        DButil.close();
    }

    public void deleteDraftByID(int id){
        String sql="update blog set is_deleted=1 where id=?";
        Object[] params={id};
        DButil.update(sql, params);
        DButil.close();
    }

    public int findLikes(int id){
        String sql="select COUNT(id) from follow where blog_id=? and is_liked=1 and is_cancelled=0";
        Object[] params={id};
        ResultSet rs=DButil.select(sql, params);
        int likes=0;
        try {
            while(rs.next()){
                likes=rs.getInt("COUNT(id)");
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        DButil.close();
        return likes;
    }
}
