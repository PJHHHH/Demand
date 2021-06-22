package com.pjh.servlet.charts;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.pjh.entity.CHARTS;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class GetChartsGraph
 */
@WebServlet("/view/demand/get_charts_graph")
public class GetChartsGraph extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String status = request.getParameter("status");
		String str = "";
		
		switch(status)
	    {
	       case "1" :
	    	  str = "attract";
	          break;
	       case "2" :
	    	  str = "type";
		      break;
	       case "3" :
	    	  str = "fix";
			  break;
	       case "4" :
	    	  str = "gk";
	          break;
	       case "5" :
	    	  str = "area";
	          break;
	       case "6" :
	    	  str = "industry";
	          break;
	       default :
	    	  str = "attract";
	    }
		CHARTS charts = MainDao.getCharts(str);
		response.getWriter().write(JSON.toJSONString(charts));
	}

}
