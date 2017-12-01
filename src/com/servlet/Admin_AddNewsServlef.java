package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdinUserCrtl;
import com.entity.Admin_NewsInfo;

public class Admin_AddNewsServlef extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7086577626081121478L;

	/**
	 * Constructor of the object.
	 */
	public Admin_AddNewsServlef() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		AdinUserCrtl ac = new AdinUserCrtl();
		Admin_NewsInfo news = new Admin_NewsInfo();
		
		String newsTitle =request.getParameter("newsTitle");
		String newsContent =request.getParameter("newsContent");
		
		news.setNewstitle(newsTitle);
		news.setNewscontent(newsContent);
		
		int res =ac.Admin_addNews(news);
		if(res>0){
			out.print("<script>alert('添加成功！');window.location.href='../admin/news.jsp';</script>");
		}else{
			out.print("<script>alert('添加失败！');window.history.back();</script>");
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
