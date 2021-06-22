package com.pjh.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pjh.dao.BaseDao;
import com.pjh.entity.USER;

public class UserDao {
	public static int deleteUser(int id) {
		String sql = "delete from user where id=?";
		Object[] params = {id};
		return BaseDao.execIUD(sql, params);
	}
	
	public static int updateUserName(String username, int id) {
		String sql = "update user set username=? where id=?";
		Object[] params = {username,id};
		return BaseDao.execIUD(sql, params);
	}
	
	public static int insert(USER user) {
		String sql = "insert into user value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {
			null,
			user.getUsername(),
			user.getPassword(),
			user.getName(),
			user.getSex(),
			user.getCity(),
			user.getInstitution(),
			user.getMajor(),
			user.getIndustry(),
			user.getEducation(),
			user.getJob(),
			user.getAddress(),
			user.getPost(),
			user.getMobile(),
			user.getPhone(),
			user.getEmail(),
			user.getQq(),
			user.getMsn(),
			user.getStatus()
		};
		return BaseDao.execIUD(sql, params);
	}
	
	public static boolean isExitByUsername(String username) {
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getConn();
		
		PreparedStatement ps = null;
		
		try {
			String sql = "select * from user where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return false;
	}

	public static USER findUserByUsername(String username) {
		USER user = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getConn();
		
		PreparedStatement ps = null;
		
		try {
			String sql = "select * from user where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				user = new USER (
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getString(6),
							rs.getString(7),
							rs.getString(8),
							rs.getString(9),
							rs.getString(10),
							rs.getString(11),
							rs.getString(12),
							rs.getString(13),
							rs.getString(14),
							rs.getString(15),
							rs.getString(16),
							rs.getString(17),
							rs.getString(18),
							rs.getInt(19)
					   );
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		
		return user;
	}
	
	public static int findUserIdByUsername(String username) {
		USER user = null;
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getConn();
		
		PreparedStatement ps = null;
		
		try {
			String sql = "select * from user where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				user = new USER (
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getString(6),
							rs.getString(7),
							rs.getString(8),
							rs.getString(9),
							rs.getString(10),
							rs.getString(11),
							rs.getString(12),
							rs.getString(13),
							rs.getString(14),
							rs.getString(15),
							rs.getString(16),
							rs.getString(17),
							rs.getString(18),
							rs.getInt(19)
					   );
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		
		return user.getId();
	}
}
