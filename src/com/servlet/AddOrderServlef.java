package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OrderCtrl;
import com.entity.OrderInfo;

public class AddOrderServlef extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5150769142914242338L;

	/**
	 * Constructor of the object.
	 */
	public AddOrderServlef() {
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
		
		OrderInfo order = new OrderInfo();
		OrderCtrl oc = new OrderCtrl();
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String userName = request.getParameter("userName");
		String userAddr = request.getParameter("userAddr");
		String userYb = request.getParameter("userYb");
		String userSj = request.getParameter("userSj");
		String userEmail = request.getParameter("userEmail");
		int goodsId = Integer.parseInt(request.getParameter("goodsId"));
		String goodsName = request.getParameter("goodsName");
		double goodsPrice = Double.parseDouble(request.getParameter("goodsPrice"));
		double goodsCarr = Double.parseDouble(request.getParameter("goodsCarr"));
		int goodssl = Integer.parseInt(request.getParameter("goodssl"));
		String goodsSm = request.getParameter("goodsSm");
		
		order.setUserid(userId);
		order.setUsername(userName);
		order.setUseraddr(userAddr);
		order.setUseryb(userYb);
		order.setUsersj(userSj);
		order.setUseremail(userEmail);
		order.setGoodsId(goodsId);
		order.setGoodsname(goodsName);
		order.setGoodsprice(goodsPrice);
		order.setGoodscarr(goodsCarr);
		order.setGoodssl(goodssl);
		order.setGoodssm(goodsSm);
		
		int res =oc.addOrder(order);
		if(res>0){
			out.print("<script>window.location.href='../orderok.jsp?userId='+"+userId+";</script>");
		}else{
			out.print("<script>alert('提交失败，请联系管理员！');window.history.back();</script>");
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
