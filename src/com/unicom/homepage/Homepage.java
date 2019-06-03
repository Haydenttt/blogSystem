/**
 * @Author: lp
 * @Date: 0527
 * @Version 1.0
 */
package com.unicom.homepage;

import com.unicom.entity.Blog;
import com.unicom.entity.User;
import com.unicom.util.DateUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * @Author: lp
 * @Date: 2019/5/27 20:02
 * @Version 1.0
 * <p>
 * 首页逻辑类
 */
public class Homepage {

    /**
     * 倒序获取blog列表
     *
     * @return blog的list
     */
    public static List<Blog> getBlogList() throws SQLException {
        List<Blog> blogList = new ArrayList<>();
        String sql = "Select * from blog order by create_time desc limit 8";//暂定一页列表展示10条
        ResultSet rs = DButil.select(sql, null);
        while (rs.next()) {
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

    /**
     * 根据id获取博客用户信息
     *
     * @param username 登录用户名（唯一）
     * @return 用户对象
     */
    public static User getUserByUsername(String username) throws SQLException {
        String sql = "select * from users where username = ?";
        ResultSet rs = DButil.select(sql, new Object[]{username});
        User user = new User();
        if (rs.next()) {//判断结果集是否为空
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setNickname(rs.getString("nickname"));
            user.setGender(rs.getBoolean("gender"));
            user.setEmail(rs.getString("email"));
            user.setAvatar(rs.getString("avatar"));
            user.setCreateTime(rs.getDate("create_time"));
        }
        return user;
    }

    /**
     * 根据博客id获取博客信息
     *
     * @param blogId
     * @return
     * @throws SQLException
     */
    @SuppressWarnings("Duplicates")
    public static Blog getBlogById(int blogId) throws SQLException {
        String sql = "select * from blog where id= ?";
        ResultSet rs = DButil.select(sql, new Object[]{blogId});
        Blog blog = new Blog();
        if (rs.next()) {
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
        }
        return blog;
    }

    /**
     * 根据博客Id和编辑时间获取博客信息
     *
     * @param blogId
     * @return
     * @throws SQLException
     */
    public static Blog getBlogByIdAndTime(int blogId, String dateToday) throws SQLException {
        String sql = "select * from blog where id= ? and update_time > ?";
        ResultSet rs = DButil.select(sql, new Object[]{blogId, dateToday});
        Blog blog = new Blog();
        if (rs.next()) {
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
            return blog;
        } else {
            return null;
        }
    }

    /**
     * @param isLoggedIn       用户当前登录状态
     * @param loggedInUsername 当前已登录的用户名，未登录则为空
     * @return 获取首页上右边栏的用户信息；
     * 若当前已有用户登录，则展示当前用户信息；
     * 否则随机展示n个最热博主中一个的信息
     * 最热博主为被收藏数最多的博主
     */
    public static Map<String, Object> getHomepageUser(boolean isLoggedIn, String loggedInUsername) throws SQLException {
        Map<String, Object> resultMap = new HashMap<>();
        if (isLoggedIn) {
            String sql = "SELECT count(followed_name) as attention from follow where followed_name = ?";
            ResultSet rs = DButil.select(sql, new Object[]{loggedInUsername});
            int attention = 0;
            if (rs.next()) {
                attention = rs.getInt("attention");
            }
            resultMap.put("user", getUserByUsername(loggedInUsername));
            resultMap.put("attention", attention);
            return resultMap;
        } else {
            //设定获取当前最热门博主的个数
            int topUserCount = 5;
            String sql = "SELECT followed_name, count(*) as attention from follow where is_cancelled=0 and is_liked=2 Group by followed_name ORDER BY attention desc limit ?";
            ResultSet rs = DButil.select(sql, new Object[]{topUserCount});

            List<User> topUserList = new ArrayList<>();
            Map<String, Integer> attentionMap = new HashMap<>();
            while (rs.next()) {
                String userName = rs.getString("followed_name");
                topUserList.add(getUserByUsername(userName));
                attentionMap.put(userName, rs.getInt("attention"));
            }
            //打乱list顺序,将list中的第一个热门博主对象和关注量存入map中，返回
            Collections.shuffle(topUserList);
            resultMap.put("user", topUserList.get(0));
            resultMap.put("attention", attentionMap.get(topUserList.get(0).getUsername()));
            return resultMap;
        }
    }

    /**
     * 获取首页右边栏的博文分类数据
     *
     * @return 返回一个list, 元素是键值对为 目录名-value,目录博文数量-value 的map
     * @throws SQLException
     */
    public static List<Map<String, Object>> getCategoryCount() throws SQLException {
        String sql = "SELECT category_name, count(category_name) AS category_count FROM  blog GROUP BY category_name ORDER BY category_count DESC";
        ResultSet rs = DButil.select(sql, null);
        List<Map<String, Object>> categoryCountList = new ArrayList<>();
        while (rs.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("category", rs.getString("category_name"));
            map.put("count", rs.getInt("category_count"));
            categoryCountList.add(map);
        }
        return categoryCountList;
    }

    /**
     * 获取当前最热门的几篇微博的信息，数量暂定10，随机获取其中的4篇，并进行博文发布时间的处理
     * 热门计算方式：收藏量+点赞量最多
     *
     * @return
     * @throws SQLException
     */
    public static List<Map<String, Object>> getTopBlogList() throws SQLException {
        //选取当前最热门的博文数量
        int topBlogCount = 10;
        //设定要展示的博文数量
        int subBlogCount = 4;
        String sql = "SELECT blog_id, count(*) as attention from follow where is_cancelled=0 and (is_liked=0 or is_liked=1) Group by blog_id ORDER BY attention desc limit ?";
        ResultSet rs = DButil.select(sql, new Object[]{topBlogCount});
        List<Map<String, Object>> topBlogList = new ArrayList<>();
        while (rs.next()) {
            Blog blog = getBlogById(rs.getInt("blog_id"));
            Map<String, Object> map = new HashMap<>();
            map.put("blog", blog);
            //将博文创建时间处理后存入map中
            map.put("time", DateUtil.getCompareTime(blog.getCreateTime().getTime()));
            topBlogList.add(map);
        }
        Collections.shuffle(topBlogList);//将list顺序打乱
        //返回最热门的博文中前subBlogCount条数据，如果博文条数小于subBlogCount，则返回全部数据
        return topBlogList.subList(0, topBlogList.size() < subBlogCount ? topBlogList.size() : subBlogCount);
    }

    /**
     * 首页轮播图展示编辑时间在最近3天的点赞量+收藏量最高的博文
     * @return
     * @throws SQLException
     */
    public static List<Blog> getTopRankBlog() throws SQLException {
        String topBlogsql = "SELECT blog_id, count(*) as attention from follow where is_cancelled=0 and (is_liked=0 or is_liked=1) Group by blog_id ORDER BY attention desc";
        //获取所有博文的点赞量+收藏量的和
        ResultSet topRankBlogRs = DButil.select(topBlogsql, null);
        List<Blog> topRankBlogList = new ArrayList<>();
        //统计的时间区间为过去三天
        int topRankBlogCount = 30;
        //获取3天前的日期
        String startDate = DateUtil.dateCalcByDay(-topRankBlogCount);
        while (topRankBlogRs.next()) {
            if (getBlogByIdAndTime(topRankBlogRs.getInt("blog_id"), startDate) != null) {
                topRankBlogList.add(getBlogByIdAndTime(topRankBlogRs.getInt("blog_id"), startDate));
            }
        }
        Collections.shuffle(topRankBlogList);
        return topRankBlogList.subList(0, topRankBlogCount > topRankBlogList.size() ? topRankBlogList.size() : topRankBlogCount);
    }
}
