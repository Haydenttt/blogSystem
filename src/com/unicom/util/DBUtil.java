package com.unicom.util;

import java.sql.*;

/**
 * @program: BlogSystem
 * @description: 数据库连接、断开
 * @author: Hayden TONG
 * @create: 2019-05-28 15:45
 **/
public class DBUtil {
    //数据库连接对象
    private static Connection conn = null;
    //连接数据库驱动名
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    //连接数据库URL
    private static final String URL = "jdbc:mysql://localhost:3306/blog525?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    //数据库用户名
    private static final String USER_NAME = "root";
    //用户密码
    private static final String PASSWORD = "123456";

    /**
     * 得到连接
     * @return 连接对象
     */
    public static Connection getConn(){
//        try {
        try {
            Class.forName(DRIVER_NAME);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("DB DRIVER FAILURE!");
        }
        try {
            conn = DriverManager.getConnection(URL,USER_NAME,PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB CONNECTION FAILURE!");
        }
        return conn;
    }

    /**
     * 关闭结果集对象
     * @param rs 结果集
     * @throws SQLException
     */
    public static void close(ResultSet rs) throws SQLException{
        if(rs != null){
            rs.close();
            rs = null;
        }
    }
    /**
     * 关闭Statement对象
     * @param Statement 处理数据的对象
     * @throws SQLException
     */
    public static void close(Statement Statement) throws SQLException{
        if(Statement != null){
            Statement.close();
            Statement = null;
        }
    }
    /**
     * 关闭PreparedStatement对象
     * @param pstmt 处理数据的对象
     * @throws SQLException
     */
    public static void close(PreparedStatement pstmt) throws SQLException{
        if(pstmt != null){
            pstmt.close();
            pstmt = null;
        }
    }

    /**
     * 关闭连接对象
     * @param conn 连接对象
     * @throws SQLException
     */
    public static void close(Connection conn) throws SQLException{
        if(conn != null){
            conn.close();
            conn = null;
        }
    }
}
