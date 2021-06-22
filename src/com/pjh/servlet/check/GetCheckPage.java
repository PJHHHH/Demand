package com.pjh.servlet.check;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.pjh.service.MainDao;

import jdk.internal.org.objectweb.asm.util.CheckAnnotationAdapter;

/**
 * Servlet implementation class GetCheckPage
 */
@WebServlet("/view/demand/get_check_page")
public class GetCheckPage extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String techdemand = request.getParameter("techdemand");
		String name = request.getParameter("name");
		String area = request.getParameter("area");
		String gk = request.getParameter("gk");
		String attract = request.getParameter("attract");
		String type = request.getParameter("type");
		int status = Integer.parseInt(request.getParameter("status"));
		int page = 0;
		if (status == -2) {
			page = MainDao.getTotalPage(techdemand,name,area,gk,attract,type,0,0,0);
		} else if (status > 0) {
			page = MainDao.getTotalPage(techdemand,name,area,gk,attract,type,status,0,1);
		}
		response.getWriter().write(page+"");
	}

}
