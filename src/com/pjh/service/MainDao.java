package com.pjh.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;

import com.pjh.dao.BaseDao;
import com.pjh.entity.CHARTS;
import com.pjh.entity.MAIN;
import com.pjh.entity.USER;
import com.sun.crypto.provider.AESParameters;

public class MainDao {
	public static int updateUserStatus(int id, int role) {
		String sql = "update user set status=? where id=?";
		Object[] params = {role,id};
		return BaseDao.execIUD(sql, params);
	}
	
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
	
	public static int deleteMainById(int id) {
		String sql = "delete from main where id=?";
		Object[] params = {id};
		return BaseDao.execIUD(sql, params);
	}

	public static int updateMain(int status, String check, int management, int id) {
		String sql = "update main set status=?,check1=?,management=? where id=?";
		Object[] params = {status,check,management,id};
		return BaseDao.execIUD(sql, params);
	}
	public static int updateMain2(int status, String check, int id) {
		String sql = "update main set status2=?,check2=? where id=?";
		Object[] params = {status,check,id};
		return BaseDao.execIUD(sql, params);
	}
	public static int insert(MAIN main) {
		String sql = "insert into main value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {
			null,
			main.getName(),
			main.getGk(),
			main.getAddress(),
			main.getArea(),
			main.getWebsite(),
			main.getEmail(),
			main.getLperson(),
			main.getPost(),
			main.getContact(),
			main.getPhone(),
			main.getMobile(),
			main.getFax(),
			main.getAttract(),
			main.getIntroduction(),
			main.getTechdemand(),
			main.getBegin(),
			main.getEnd(),
			main.getMain(),
			main.getKey(),
			main.getExpect(),
			main.getKeyword(),
			main.getTotalsum(),
			main.getFix(),
			main.getCoinstitution(),
			main.getType(),
			main.getClassify(),
			main.getField(),
			main.getDetails(),
			main.getIndustry(),
			main.getWho(),
			main.getStatus(),
			main.getCheck(),
			main.getStatus2(),
			main.getCheck2(),
			main.getManagement()
		};
		return BaseDao.execIUD(sql, params);
	}
	public static ArrayList<MAIN> selectMainAll() {
		ArrayList<MAIN> list = new ArrayList<>();
		// 声明结果集
		ResultSet rs = null;
		// 获取连接对象
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		String sql = "";
		sql = "select * from main";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MAIN main = new MAIN (
							rs.getInt("id"), 
							rs.getString("name"), 
							rs.getString("gk"), 
							rs.getString("address"), 
							rs.getString("area"), 
							rs.getString("website"), 
							rs.getString("email"), 
							rs.getString("lperson"), 
							rs.getString("post"), 
							rs.getString("contact"), 
							rs.getString("phone"), 
							rs.getString("mobile"), 
							rs.getString("fax"), 
							rs.getString("attract"), 
							rs.getString("introduction"), 
							rs.getString("techdemand"), 
							rs.getString("begin"), 
							rs.getString("end"), 
							rs.getString("main"), 
							rs.getString("key"), 
							rs.getString("expect"), 
							rs.getString("keyword"), 
							rs.getInt("totalsum"), 
							rs.getString("fix"), 
							rs.getString("coinstitution"), 
							rs.getString("type"), 
							rs.getString("classify"), 
							rs.getString("field"), 
							rs.getString("details"), 
							rs.getString("industry"), 
							rs.getString("who"),
							rs.getInt("status"),
							rs.getString("check1"),
							rs.getInt("status2"),
							rs.getString("check2"),
							rs.getInt("management")
						);
				list.add(main);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return list;
	}
	
	public static ArrayList<USER> searchUserManage(int cpage, int count, String sql) {
		ArrayList<USER> list = new ArrayList<>();
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String t = " limit " + (cpage - 1) * count + "," + count;
			sql = sql + t;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				USER user = new USER (
							rs.getInt("id"), 
							rs.getString("username"), 
							rs.getString("password"), 
							rs.getString("name"), 
							rs.getString("sex"), 
							rs.getString("city"), 
							rs.getString("institution"), 
							rs.getString("major"), 
							rs.getString("industry"), 
							rs.getString("education"), 
							rs.getString("job"), 
							rs.getString("address"), 
							rs.getString("post"), 
							rs.getString("mobile"), 
							rs.getString("phone"), 
							rs.getString("email"), 
							rs.getString("qq"), 
							rs.getString("msn"), 
							rs.getInt("status")
						);
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return list;
	}
	
	public static ArrayList<MAIN> searchMainManage(int cpage, int count, String sql) {
		ArrayList<MAIN> list = new ArrayList<>();
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String t = " limit " + (cpage - 1) * count + "," + count;
			sql = sql + t;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MAIN main = new MAIN (
							rs.getInt("id"), 
							rs.getString("name"), 
							rs.getString("gk"), 
							rs.getString("address"), 
							rs.getString("area"), 
							rs.getString("website"), 
							rs.getString("email"), 
							rs.getString("lperson"), 
							rs.getString("post"), 
							rs.getString("contact"), 
							rs.getString("phone"), 
							rs.getString("mobile"), 
							rs.getString("fax"), 
							rs.getString("attract"), 
							rs.getString("introduction"), 
							rs.getString("techdemand"), 
							rs.getString("begin"), 
							rs.getString("end"), 
							rs.getString("main"), 
							rs.getString("key"), 
							rs.getString("expect"), 
							rs.getString("keyword"), 
							rs.getInt("totalsum"), 
							rs.getString("fix"), 
							rs.getString("coinstitution"), 
							rs.getString("type"), 
							rs.getString("classify"), 
							rs.getString("field"), 
							rs.getString("details"), 
							rs.getString("industry"), 
							rs.getString("who"),
							rs.getInt("status"),
							rs.getString("check1"),
							rs.getInt("status2"),
							rs.getString("check2"),
							rs.getInt("management")
						);
				list.add(main);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return list;
	}
	
	public static ArrayList<MAIN> searchMain(int cpage, int count, String techdemand, String name, String area, String gk, String attract, String type, int status, int status2, int i) {
		ArrayList<MAIN> list = new ArrayList<>();
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String sql="";
			if(!techdemand.equals("") || !name.equals("") || !area.equals("") || !gk.equals("") || !attract.equals("") || !type.equals("")) {
				sql="select * from main where management="+status+" and status2="+status2+" and status="+i+" and techdemand like ? and name like ? and area like ? and gk like ? and attract like ? and type like ? limit ?,?";
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, "%"+techdemand+"%");
				ps.setString(2, "%"+name+"%");
				ps.setString(3, "%"+area+"%");
				ps.setString(4, "%"+gk+"%");
				ps.setString(5, "%"+attract+"%");
				ps.setString(6, "%"+type+"%");
				ps.setInt(7, (cpage - 1) * count);
				ps.setInt(8, count);
			} else {
				sql = "select * from main where management="+status+" and status2="+status2+" and status="+i+" limit ?,?";
				ps = conn.prepareStatement(sql);
				
				ps.setInt(1, (cpage - 1) * count);
				ps.setInt(2, count);
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				MAIN main = new MAIN (
							rs.getInt("id"), 
							rs.getString("name"), 
							rs.getString("gk"), 
							rs.getString("address"), 
							rs.getString("area"), 
							rs.getString("website"), 
							rs.getString("email"), 
							rs.getString("lperson"), 
							rs.getString("post"), 
							rs.getString("contact"), 
							rs.getString("phone"), 
							rs.getString("mobile"), 
							rs.getString("fax"), 
							rs.getString("attract"), 
							rs.getString("introduction"), 
							rs.getString("techdemand"), 
							rs.getString("begin"), 
							rs.getString("end"), 
							rs.getString("main"), 
							rs.getString("key"), 
							rs.getString("expect"), 
							rs.getString("keyword"), 
							rs.getInt("totalsum"), 
							rs.getString("fix"), 
							rs.getString("coinstitution"), 
							rs.getString("type"), 
							rs.getString("classify"), 
							rs.getString("field"), 
							rs.getString("details"), 
							rs.getString("industry"), 
							rs.getString("who"),
							rs.getInt("status"),
							rs.getString("check1"),
							rs.getInt("status2"),
							rs.getString("check2"),
							rs.getInt("management")
						);
				list.add(main);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return list;
	}

	public static int getTotalPage(String techdemand, String name, String area, String gk, String attract, String type, int status, int status2, int i) {
		int page = 0;
		
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "";
			if(techdemand!=null || name!=null || area!=null || gk!=null || attract!=null || type!=null) {
				sql="select count(*) from main where management="+status+" and status2="+status2+" and status="+i+" and techdemand like ? and name like ? and area like ? and gk like ? and attract like ? and type like ?";
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, "%"+techdemand+"%");
				ps.setString(2, "%"+name+"%");
				ps.setString(3, "%"+area+"%");
				ps.setString(4, "%"+gk+"%");
				ps.setString(5, "%"+attract+"%");
				ps.setString(6, "%"+type+"%");
			} else {
				sql = "select count(*) from main where management="+status+" and status2="+status2;
				ps = conn.prepareStatement(sql);
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				page = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return page;
	}
	
	public static USER selectUserById(int id) {
		USER main = null;
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String sql = "select * from user where id=?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				main = new USER (
						rs.getInt("id"), 
						rs.getString("username"), 
						rs.getString("password"), 
						rs.getString("name"), 
						rs.getString("sex"), 
						rs.getString("city"), 
						rs.getString("institution"), 
						rs.getString("major"), 
						rs.getString("industry"), 
						rs.getString("education"), 
						rs.getString("job"), 
						rs.getString("address"), 
						rs.getString("post"), 
						rs.getString("mobile"), 
						rs.getString("phone"), 
						rs.getString("email"), 
						rs.getString("qq"), 
						rs.getString("msn"), 
						rs.getInt("status")
					);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return main;
	}

	public static MAIN selectMainById(int id) {
		MAIN main = null;
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String sql = "select * from main where id=?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				main = new MAIN (
						rs.getInt("id"), 
						rs.getString("name"), 
						rs.getString("gk"), 
						rs.getString("address"), 
						rs.getString("area"), 
						rs.getString("website"), 
						rs.getString("email"), 
						rs.getString("lperson"), 
						rs.getString("post"), 
						rs.getString("contact"), 
						rs.getString("phone"), 
						rs.getString("mobile"), 
						rs.getString("fax"), 
						rs.getString("attract"), 
						rs.getString("introduction"), 
						rs.getString("techdemand"), 
						rs.getString("begin"), 
						rs.getString("end"), 
						rs.getString("main"), 
						rs.getString("key"), 
						rs.getString("expect"), 
						rs.getString("keyword"), 
						rs.getInt("totalsum"), 
						rs.getString("fix"), 
						rs.getString("coinstitution"), 
						rs.getString("type"), 
						rs.getString("classify"), 
						rs.getString("field"), 
						rs.getString("details"), 
						rs.getString("industry"), 
						rs.getString("who"),
						rs.getInt("status"),
						rs.getString("check1"),
						rs.getInt("status2"),
						rs.getString("check2"),
						rs.getInt("management")
					);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return main;
	}
	public static int getManagePage(String sql) {
		int page = 0;
		
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				page = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return page;
	}
	public static CHARTS getCharts(String status) {
		CHARTS chart = null;
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> datas = new ArrayList<>();
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String sql = "";
			sql = "select "+status+",count("+status+") from main group by "+status;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				
				if(rs.getString(1) != null && !rs.getString(1).equals("")) {
					names.add(rs.getString(1));
					datas.add(rs.getInt(2));
				}
			}
			chart = new CHARTS(names, datas);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(rs, ps, conn);
		}
		return chart;
	}
}
