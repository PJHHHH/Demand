package com.pjh.servlet.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pjh.entity.QueryCase;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class GetMainPage
 */
@WebServlet("/view/demand/get_main_page")
public class GetMainPage extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "";
		String username = request.getParameter("username");
		if (request.getParameter("length") == null) {
			sql = "select count(*) from main where who='" + username + "'";
		} else {
			sql = "select count(*) from main where who='" + username + "' and";
			int n = Integer.parseInt(request.getParameter("length"));
			ArrayList<QueryCase> list = new ArrayList<>();
			for(int i=0;i<n;i++) {
				String cs = request.getParameter("cs"+i);
				String cls = request.getParameter("cls"+i);
				String cont = request.getParameter("cont"+i);
				String how = request.getParameter("how"+i);
				QueryCase qr = new QueryCase(cs, cls, cont, how);
				list.add(qr);
			}
			String state = request.getParameter("state");
			sql = sql + QueryCase.toSqL(list, state);
		}
		response.getWriter().write(MainDao.getManagePage(sql) + "");
	}

}
