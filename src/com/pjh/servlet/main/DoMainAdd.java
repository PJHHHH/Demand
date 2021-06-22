package com.pjh.servlet.main;

import java.io.IOException;
import java.lang.ref.ReferenceQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.TrimSpacesOption;

import com.pjh.entity.MAIN;
import com.pjh.entity.USER;
import com.pjh.service.MainDao;

/**
 * Servlet implementation class DoMainAdd
 */
@WebServlet("/view/demand/do_main_add")
public class DoMainAdd extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String gk = request.getParameter("gk");
		String address = request.getParameter("address");
		String area = request.getParameter("area");
		String website = request.getParameter("website");
		String email = request.getParameter("email");
		String lperson = request.getParameter("lperson");
		String post = request.getParameter("post");
		String contact = request.getParameter("contact");
		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String fax = request.getParameter("fax");
		String attract = request.getParameter("attract");
		String introduction = request.getParameter("introduction");
		String techdemand = request.getParameter("techdemand");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		String main = request.getParameter("main");
		String key = request.getParameter("key");
		String expect = request.getParameter("expect");
		String keyword = request.getParameter("keyword");
		String totalsum = request.getParameter("totalsum");
		String fix = request.getParameter("fix");
		String coinstitution = request.getParameter("coinstitution");
		String type = request.getParameter("type");
		String classify = request.getParameter("classify");
		String field = request.getParameter("field");
		String details = request.getParameter("details");
		String industry = request.getParameter("industry");

		USER user = (USER) request.getSession().getAttribute("user");
		MAIN m = new MAIN(0, name, gk.trim(), address, area, website, email, lperson, post, contact, phone, mobile, fax,
				attract.trim(), introduction, techdemand, begin, end, main, key, expect, keyword.trim(),
				Integer.parseInt(totalsum.trim()), fix.trim(), coinstitution, type.trim(), classify, field.trim(),
				details, industry.trim(), user.getUsername(), 0, null, 0, null, 0);

		if (MainDao.insert(m) > 0) {
			response.getWriter().write("yes");
		} else {
			response.getWriter().write("no");
		}
	}

}
