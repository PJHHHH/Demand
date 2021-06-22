package com.pjh.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.pjh.dao.BaseDao;
import com.pjh.entity.CHARTS;

public class Data1Dao {
	public static CHARTS getCharts(String status) {
		CHARTS chart = null;
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> datas = new ArrayList<>();
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String sql = "";
			sql = "select "+status+",count("+status+") from data1 group by "+status;
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

	public static CHARTS getCharts2(String type, String num) {
		CHARTS chart = null;
		ArrayList<String> names = new ArrayList<>();
		ArrayList<Integer> datas = new ArrayList<>();
		
		ResultSet rs = null;
		Connection conn = BaseDao.getConn();
		PreparedStatement ps = null;
		try {
			String sql = "";
			if (type.equals("001")) {
				sql = "select id,count(id) from ktcs group by id order by count(id) desc limit 0,"+num;
			} else if (type.equals("002")) {
				sql = "select dizhi,count(dizhi) from data1 group by dizhi order by count(dizhi) desc limit 0,"+num;
			} else if (type.equals("003")) {
				sql = "select dizhi,sum(traffic) from data1 group by dizhi order by sum(traffic) desc limit 0,"+num;
			}
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
