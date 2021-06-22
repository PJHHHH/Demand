package com.pjh.servlet.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pjh.entity.MAIN;
import com.pjh.entity.USER;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class DoAuthUpdate
 */
@WebServlet("/view/demand/do_auth_update")
public class DoAuthUpdate extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int id= 0;
		if (request.getParameter("id")!=null) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		USER user = MainDao.selectUserById(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("auth_select.jsp").forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		int role = Integer.parseInt(request.getParameter("role"));
		System.out.println(id + " " + role);
		if (MainDao.updateUserStatus(id, role)>0) {
			response.getWriter().write("yes");
		} else {
			response.getWriter().write("no");
		}
	}

}
