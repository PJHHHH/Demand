package com.pjh.servlet.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.mysql.cj.xdevapi.JsonArray;
import com.pjh.entity.MAIN;
import com.pjh.entity.USER;
import com.pjh.service.UserDao;

/**
 * Servlet implementation class DoUserLog
 */
@WebServlet("/view/user/do_user_log")
public class DoUserLog extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("I'm in !");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		USER user = UserDao.findUserByUsername(username);
		if (user != null) {
			if (password.equals(user.getPassword())) {
				request.getSession().setAttribute("username", username);	// 取值：${sessionScope.xxx}
				request.getSession().setAttribute("user", user);	// 取值：${sessionScope.xxx}
				if(user.getStatus()==0) {
					response.getWriter().write("yes");
				} else if(user.getStatus()==-1) {
					response.getWriter().write("admin");
				} else if(user.getStatus()==-2 || user.getStatus()>0) {
					response.getWriter().write("check");
				}
			} else {
				response.getWriter().write("no");
			}
		} else {
//			ArrayList<MAIN> list = new ArrayList<>();
//			JSON.toJSONString(list);
			response.getWriter().write("notfind");
		}
	}

}
