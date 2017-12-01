package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserCrtl;
import com.entity.UserInfo;

public class UpdateUserServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1885945069564581480L;

	/**
	 * Constructor of the object.
	 */
	public UpdateUserServlet() {
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
		
		UserInfo user =new UserInfo();
		UserCrtl uc =new UserCrtl();
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int userId =Integer.parseInt(request.getParameter("userId"));
		String userXm =request.getParameter("userXm");
		int userSex =Integer.parseInt(request.getParameter("userSex"));
		String userEmail =request.getParameter("userEmail");
		String userPhone =request.getParameter("userPhone");
		String userSj =request.getParameter("userSj");
		String userAddr =request.getParameter("userAddr");
		String userYb =request.getParameter("userYb");
		
		user.setUserId(userId);
		user.setUserxm(userXm);
		user.setUsersex(userSex);
		user.setUseremail(userEmail);
		user.setUserphone(userPhone);
		user.setUsersj(userSj);
		user.setUseraddr(userAddr);
		user.setUseryb(userYb);
		
		int res =uc.updateUser(user);
		if(res>0){
			out.print("<script>alert('修改成功！');window.history.back();</script>");
			
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
