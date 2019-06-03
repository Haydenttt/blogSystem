/**
 * 
 */
package com.unicom.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * @author 李婉茹
 * 数据库增删改查
 * 2019/6/3
 */
public class DBCon {
	private Connection conn;
	/**
	 * 数据库链接
	 */
	private PreparedStatement ps;
	/**
	 *
	 */
	private ResultSet rs;

	/**
	 * ResultSet结果集
	 *
	 * @return 数据库连接
	 */
	public Connection openConn() {
		conn=DBUtil.getConn();
		return  conn;
	}

	/**
	 * 关闭数据库
	 */
	public void closeAll() {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if (ps != null)
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}


	/**
	 * 数据库的增删改功能
	 *
	 * @param //sql数据库增加的数据功能
	 * @param paras
	 * @return 返回一个整数 有数据返回非空数值
	 */
	public int update(String sql, Object... paras) {
		int resu = 0;

		openConn();
		try {

			ps = conn.prepareStatement(sql);

			if (paras != null) {
				for (int i = 0; i < paras.length; i++) {
					ps.setObject(i + 1, paras[i]);
				}
			}
			//閹笛嗩攽SQL閹稿洣鎶�
			resu = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return resu;
	}

	// 增加方法
	public boolean insert(String sql, Object... paras) {
		boolean flat = false;
		openConn();
		try {
			ps = conn.prepareStatement(sql);
			if (paras != null) {
				for (int i = 0; i < paras.length; i++) {
					ps.setObject(i + 1, paras[i]);
					System.out.println(paras[i]);
				}
			}
			int f = ps.executeUpdate();
			if (f > 0) {
				System.out.println("成功插入" + f + "条数据");
				flat = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flat;

	}

	/**
	 * 数据库的查询方法
	 *
	 * @param
	 * @param paras
	 * @return 返回结果集
	 */
	public ResultSet query(String sql, Object... paras) {

		openConn();
		try {

			ps = conn.prepareStatement(sql);

			if (paras != null) {
				for (int i = 0; i < paras.length; i++) {
					ps.setObject(i + 1, paras[i]);
				}
			}

			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

}