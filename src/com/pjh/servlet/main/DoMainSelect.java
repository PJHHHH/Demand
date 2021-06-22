package com.pjh.servlet.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pjh.entity.MAIN;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class DoMainSelect
 */
@WebServlet("/view/demand/do_main_select")
public class DoMainSelect extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		MAIN main = MainDao.selectMainById(id);
		request.setAttribute("main", main);
		request.getRequestDispatcher("main_select.jsp").forward(request, response);
	}
}
