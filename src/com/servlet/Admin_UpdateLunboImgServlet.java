package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdinUserCrtl;
import com.entity.ImgInfo;

public class Admin_UpdateLunboImgServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1908050102152356423L;

	/**
	 * Constructor of the object.
	 */
	public Admin_UpdateLunboImgServlet() {
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
		ImgInfo img = new ImgInfo();
		
		int imgid =Integer.parseInt(request.getParameter("imgId"));
		String Lunbofile =request.getParameter("Lunbofile");
		String Lunbohref =request.getParameter("Lunbohref");
		img.setImgId(imgid);
		img.setLunboaddr(Lunbofile);
		img.setImghref(Lunbohref);
		int res =ac.updateLunbo(img);
		if(res>0){
			out.print("<script>alert('修改成功！');window.location.href='../admin/ppt.jsp';</script>");
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
