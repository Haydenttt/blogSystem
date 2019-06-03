package com.unicom.follow;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 获取数据库连接
 * @author XuetingOu
 */
public class JDBCUtils {

    private static final String driverClass;
    private static final String url;
    private static final String username;
    private static final String password;
    static {
        //Properties properties = new Properties();
        //InputStream inputStream = JDBCUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
        // System.out.println(JDBCDemo2.class.getClassLoader().getResource(""));
        /*try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        driverClass = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/blog525?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        username = "root";
        password = "root";
    }


    //建立连接
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        //加载驱动
        Class.forName(driverClass);
        //获取连接
        Connection connection = DriverManager.getConnection(url,username,password);
        return connection;

    }
    //释放资源
    public static void release(Statement statement, Connection connection){
        if (statement!=null){
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            statement=null;
        }
        if (connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            connection=null;
        }
    }
    public static void release(ResultSet resultSet, Statement statement, Connection connection){
        if (resultSet!=null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            resultSet=null;
        }
        if (statement!=null){
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            statement=null;
        }
        if (connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            connection=null;
        }
    }
}
