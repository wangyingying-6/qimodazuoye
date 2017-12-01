package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdinUserCrtl;
import com.dao.OrderCtrl;
import com.entity.UserInfo;

public class UpdateOrderZtServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4812973039016530021L;

	/**
	 * Constructor of the object.
	 */
	public UpdateOrderZtServlet() {
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
		
		OrderCtrl oc = new OrderCtrl();	
		UserInfo user = new UserInfo();
		AdinUserCrtl ac =new AdinUserCrtl();
		
		int userid =Integer.parseInt(request.getParameter("userId"));
		int orderid =Integer.parseInt(request.getParameter("orderId"));
		double userYe1 =Double.parseDouble(request.getParameter("sum"));//�����ܽ��		
		String userPwd =request.getParameter("userPwd");
		
		user =oc.selUserPwd(userid);
		if(!user.getUserpwd().equals(userPwd)){
			out.print("<script>alert('���������������������룡');window.history.back();</script>");
		}else{
			user =ac.setuserYe(userid);	
			double userYe2 =user.getUserye();//�û��������
			double sumYe =userYe2-userYe1;//�ܽ��=�û��������-�����ܽ��
			if(userYe1>userYe2){
				out.print("<script>alert('֧��ʧ�ܣ��������㣡');window.history.back();</script>");
			}else{
				int res =ac.updateYe(userid, sumYe);
				if(res>0){
					int res2 =oc.updateOrderZt(orderid);
					if(res2>0){
						out.print("<script>window.location.href='../zfok.jsp';</script>");
					}else{
						out.print("<script>alert('����ʧ�ܣ�����ϵ����Ա��');window.history.back();</script>");
					}					
				}else{
					out.print("<script>alert('֧��ʧ�ܣ�����ϵ����Ա��');window.history.back();</script>");
				}
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
