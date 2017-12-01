package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdinUserCrtl;
import com.entity.UserInfo;

public class Admin_UpdateYeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3941776264372009664L;

	/**
	 * Constructor of the object.
	 */
	public Admin_UpdateYeServlet() {
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
		
		AdinUserCrtl ac =new AdinUserCrtl();	
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int userId =Integer.parseInt(request.getParameter("userId"));
		double userYe1 =Double.parseDouble(request.getParameter("userYe"));//用户充值金额
		UserInfo user =new UserInfo();
		user =ac.setuserYe(userId);
		double userYe2 =user.getUserye();//用户现有余额
		double sumYe =userYe1+userYe2;//总金额
		
		int res =ac.updateYe(userId, sumYe);
		if(res>0){
			out.print("<script>alert('充值成功！');window.location.href='../admin/user.jsp';                                                                                                                                                                                                                                                                                                                                                                                       </script>");
		}else{
			out.print("<script>alert('充值失败！');window.history.back();</script>");
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
