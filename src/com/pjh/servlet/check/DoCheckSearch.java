package com.pjh.servlet.check;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.pjh.entity.MAIN;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class DoCheckSearch
 */
@WebServlet("/view/demand/do_check_search")
public class DoCheckSearch extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String techdemand = request.getParameter("techdemand");
		String name = request.getParameter("name");
		String area = request.getParameter("area");
		String gk = request.getParameter("gk");
		String attract = request.getParameter("attract");
		String type = request.getParameter("type");
		int status = Integer.parseInt(request.getParameter("status"));
		int status2 = 0;
		int i=1;
//		System.out.println("params:"+techdemand+name+area+gk+attract+type);
		
		int cpage = 1;
		int count = 5;
		
		String cp = request.getParameter("cpage");
		
		if (cp != null) {
			cpage = Integer.parseInt(cp);
		}
		if (status == -2) {
			status = 0;
			i=0;
		}
		ArrayList<MAIN> list = MainDao.searchMain(cpage,count,techdemand,name,area,gk,attract,type,status,status2,i);
		response.getWriter().write(JSON.toJSONString(list));
	}
}
