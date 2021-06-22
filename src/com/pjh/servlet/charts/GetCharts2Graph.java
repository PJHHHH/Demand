package com.pjh.servlet.charts;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.pjh.entity.CHARTS;
import com.pjh.service.Data1Dao;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class GetCharts2Graph
 */
@WebServlet("/view/demand/get_charts2_graph")
public class GetCharts2Graph extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		String num = request.getParameter("num");
		CHARTS charts = null;
		if (type == null) {
			charts = Data1Dao.getCharts("dizhi");
		} else {
			charts = Data1Dao.getCharts2(type,num);
		}
		
		response.getWriter().write(JSON.toJSONString(charts));
	}

}
