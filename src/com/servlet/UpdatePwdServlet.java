package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserCrtl;
import com.entity.UserInfo;

public class UpdatePwdServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3330146723783308835L;

	/**
	 * Constructor of the object.
	 */
	public UpdatePwdServlet() {
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

		UserCrtl uc = new UserCrtl();
		UserInfo user = new UserInfo();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int userid =Integer.parseInt(request.getParameter("userId"));
		String jmm =request.getParameter("jmm");
		String pwd2 =request.getParameter("pwd2");
		
		user =uc.setuserPwd(userid);		
		if(!user.getUserpwd().equals(jmm)){
			out.print("<script>alert('æ…√‹¬Î ‰»Î¥ÌŒÛ£°');window.location.href='../hy.jsp';</script>");
		}else{			
			int res =uc.updatePwd(userid, pwd2);
			if(res>0){
				out.print("<script>alert('–ﬁ∏ƒ≥…π¶£°');window.history.back();</script>");
			}else{
				out.print("<script>alert('–ﬁ∏ƒ ß∞‹£°');window.history.back();</script>");
			}
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
