package com.pjh.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pjh.entity.USER;
import com.pjh.service.UserDao;

/**
 * Servlet implementation class DoUserReg
 */
@WebServlet("/view/user/do_user_reg")
public class DoUserReg extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String city = request.getParameter("city");
		String institution = request.getParameter("institution");
		String major = request.getParameter("major");
		String industry = request.getParameter("industry");
		String education = request.getParameter("education");
		String job = request.getParameter("job");
		String address = request.getParameter("address");
		String post = request.getParameter("post");
		String mobile = request.getParameter("mobile");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String qq = request.getParameter("qq");
		String msn = request.getParameter("msn");
		USER user = new USER(0, username, password, name, sex, city, institution, major, industry, education, job, address, post, mobile, phone, email, qq, msn, 0);
		if (!UserDao.isExitByUsername(username)) {
			if (UserDao.insert(user) > 0) {
				response.getWriter().write("yes");
			} else {
				response.getWriter().write("error");
			}
		} else {
			response.getWriter().write("no");
		}
		
	}

}
