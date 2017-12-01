package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.GoodsCtrl;
import com.entity.CommentInfo;

public class AddCommentServlef extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5893983493012497959L;

	/**
	 * Constructor of the object.
	 */
	public AddCommentServlef() {
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
		
		GoodsCtrl gc = new GoodsCtrl();
		CommentInfo comment = new CommentInfo();
		
		int goodsId =Integer.parseInt(request.getParameter("goodsId"));
		String userName =request.getParameter("userName");
		String Plcomment =request.getParameter("Plcomment");
		
		comment.setGoodsid(goodsId);
		comment.setCommentname(userName);
		comment.setCommentContent(Plcomment);
		
		int res =gc.addComment(comment);
		if(res>0){
			out.print("<script>window.location.href='../goodsinfo.jsp?goodsId='+"+goodsId+";</script>");
		}else{
			out.print("<script>alert('评论失败，请联系管理员！');window.history.back();</script>");
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
