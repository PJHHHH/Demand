package com.pjh.servlet.manage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.pjh.entity.MAIN;
import com.pjh.entity.QueryCase;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class DoManageSearch
 */
@WebServlet("/view/demand/do_manage_search")
public class DoManageSearch extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String sql = "";
		if (request.getParameter("length") == null) {
			sql = "select * from main";
		} else {
			sql = "select * from main where";
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
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int count = 5;
		ArrayList<MAIN> mList = MainDao.searchMainManage(cpage, count, sql);
		response.getWriter().write(JSON.toJSONString(mList));
	}

}
