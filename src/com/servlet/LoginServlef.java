package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserCrtl;
import com.entity.UserInfo;

public class LoginServlef extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4841027527603792228L;

	/**
	 * Constructor of the object.
	 */
	public LoginServlef() {
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
			
			String userName = request.getParameter("userName");
			String userPwd = request.getParameter("userPwd");
			
			UserCrtl uc =new UserCrtl();
			UserInfo user = uc.login(userName, userPwd);
			if(user!=null){
				if(user.getUserzt()>0){
					out.print("<script>alert('登陆失败，您的账号已被冻结，请联系管理员！');window.history.back();</script>");
				}else{
					HttpSession session =request.getSession();
					session.setAttribute("user",user);
					response.sendRedirect("../hy.jsp");
				}
				
			}else{
				response.sendRedirect("../regno.jsp?username="+userName);
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
