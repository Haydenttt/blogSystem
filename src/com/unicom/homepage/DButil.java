package com.unicom.homepage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class DButil {
	private static Connection con;
	private static Statement state;
	private static PreparedStatement pstm;
	private static ResultSet rs;
	// 1.连接数据库的方法
	public static void getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog525?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 2.查询相关的方法
	public static ResultSet select(String sql, Object[] params) {
		getConnection();
		try {
			pstm = con.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstm.setObject(i + 1, params[i]);
				}
			}
			rs = pstm.executeQuery();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 3.增加方法
	public static void insert(String sql, Object[] params) {
		getConnection();
		try {
			pstm = con.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstm.setObject(i + 1, params[i]);
					System.out.println(params[i]);
				}
			}
			int f = pstm.executeUpdate();
			if (f > 0) {
				System.out.println("成功插入" + f + "条数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	// 4.删除方法
	public static void delete(String sql, Object[] params) {
		getConnection();
		try {
			pstm = con.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstm.setObject(i + 1, params[i]);
				}
			}
			int f = pstm.executeUpdate();
			if (f > 0) {
				System.out.println("成功删除了" + f + "条数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 5.修改方法
	public static void update(String sql, Object[] params) {
		getConnection();
		try {
			pstm = con.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstm.setObject(i + 1, params[i]);
				}
			}
			int f = pstm.executeUpdate();
			if (f > 0) {
				System.out.println("成功修改了" + f + "条数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 6.关闭数据库连接
	public static void close() {
		try {
			if (con != null) {
				con.close();
			}
			if (pstm != null) {
				pstm.close();
			}
			if (state != null) {
				state.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {}
	}
}