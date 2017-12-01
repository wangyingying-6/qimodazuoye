package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdinUserCrtl;
import com.entity.Admin_UserInfo;

public class Admin_UpdateAdminServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8272684420813629689L;

	/**
	 * Constructor of the object.
	 */
	public Admin_UpdateAdminServlet() {
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

		Admin_UserInfo au = new Admin_UserInfo();
		AdinUserCrtl ac =new AdinUserCrtl();
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int userid =Integer.parseInt(request.getParameter("userId"));
		String username =request.getParameter("admin_userName");
		String userpwd =request.getParameter("admin_userPwd");
		
		au.setAdmin_username(username);
		au.setAdmin_userpwd(userpwd);
		au.setAdmin_userId(userid);
		int res =ac.updateAdmin_User(au);
		if(res>0){
			out.print("<script>alert('修改成功！');window.location.href='../admin/admin_user.jsp';</script>");
		}else{
			out.print("<script>alert('修改失败！');window.history.back();</script>");
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
