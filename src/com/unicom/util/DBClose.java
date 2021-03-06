package com.unicom.util;

import java.sql.*;

public class DBClose {
    //释放资源
    public static void release(Statement statement, Connection connection){
        if(statement !=null){
            try {
                statement.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            statement=null;
        }
        if(connection !=null){
            try {
                connection.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            connection=null;
        }
    }
    public static void release(Statement statement, Connection connection, ResultSet resultSet){
        if(resultSet !=null){
            try {
                resultSet.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            resultSet=null;
        }
        if(statement !=null){
            try {
                statement.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            statement=null;
        }
        if(connection !=null){
            try {
                connection.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            connection=null;
        }
    }
    public static void release(PreparedStatement statement, Connection connection){
        if(statement !=null){
            try {
                statement.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            statement=null;
        }
        if(connection !=null){
            try {
                connection.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            connection=null;
        }
    }
}
