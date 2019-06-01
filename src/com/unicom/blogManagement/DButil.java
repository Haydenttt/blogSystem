package com.unicom.blogManagement;

import com.unicom.util.DBUtil;

import java.sql.*;

public class DButil {
	private static Connection con;
	private static PreparedStatement pstm;
	private static ResultSet rs;
	// 2.查询相关的方法
	public static ResultSet select(String sql, Object[] params) {
		con=DBUtil.getConn();
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
		con=DBUtil.getConn();
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
		con=DBUtil.getConn();
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
		con=DBUtil.getConn();
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
	public static void close(){
		try{
			DBUtil.close(rs);
			DBUtil.close(con);
			DBUtil.close(pstm);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}