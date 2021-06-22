package com.pjh.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
	private static final String connectionURL = "jdbc:mysql://127.0.0.1:3306/demand?useUnicode=true&characterEncoding=GB18030&useSSL=false&serverTimezone=GMT&allowPublicKeyRetrieval=true";
	private static final String username = "root";
	private static final String password = "123456";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	public static Connection getConn() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(connectionURL, username, password);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return conn;
	}

	public static int execIUD(String sql, Object[] params) {
		int count = 0;
		Connection conn = BaseDao.getConn();

		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			
			count = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(null, ps, conn);
		}
		return count;
	}

	public static void closeAll(ResultSet rs, PreparedStatement ps, Connection conn) {
		try {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
		}
	}
}
