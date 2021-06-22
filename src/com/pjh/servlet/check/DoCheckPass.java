package com.pjh.servlet.check;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pjh.service.MainDao;

/**
 * Servlet implementation class DoCheckPass
 */
@WebServlet("/view/demand/do_check_pass")
public class DoCheckPass extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ispass = request.getParameter("ispass");
		String ID = request.getParameter("ID");
		int ismanage = Integer.parseInt(request.getParameter("ismanage"));
		String check = request.getParameter("check");
		int id = Integer.parseInt(ID);
		int status = 0;
		if(ismanage==0) {
			int management = Integer.parseInt(request.getParameter("management"));
			if(ispass.equals("yes")) {
				status = 1;
				if(MainDao.updateMain(status,check,management,id)>0) {
					response.getWriter().write("yes");
				} else {
					response.getWriter().write("no");
				}
			} else {
				status = -1;
				if(MainDao.updateMain(status,check,management,id)>0) {
					response.getWriter().write("yes");
				} else {
					response.getWriter().write("no");
				}
			}
		} else {
			if(ispass.equals("yes")) {
				status = 1;
				if(MainDao.updateMain2(status,check,id)>0) {
					response.getWriter().write("yes");
				} else {
					response.getWriter().write("no");
				}
			} else {
				status = -1;
				if(MainDao.updateMain2(status,check,id)>0) {
					response.getWriter().write("yes");
				} else {
					response.getWriter().write("no");
				}
			}
		}
	}

}
