package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserCrtl;
import com.entity.UserInfo;

public class AddUserServlef extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8875177100386583410L;

	/**
	 * Constructor of the object.
	 */
	public AddUserServlef() {
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
			
			UserInfo user = new UserInfo();
			UserCrtl uc = new UserCrtl();
		
			request.setCharacterEncoding("utf-8");
			String username =request.getParameter("userNameReg");
			String userpwd =request.getParameter("userpwd2Reg");
			String userxm =request.getParameter("realNameReg");
			int usersex =Integer.parseInt(request.getParameter("userSex"));
			
			user.setUsername(username);
			user.setUserpwd(userpwd);
			user.setUserxm(userxm);
			user.setUsersex(usersex);
			
			int res =uc.addUser(user);
			if(res>0){
				response.sendRedirect("../reg2.jsp?username="+username);
			}else{
				response.sendRedirect("../index.jsp");
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
