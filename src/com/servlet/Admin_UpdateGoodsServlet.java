package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.GoodsCtrl;
import com.entity.GoodsInfo;

public class Admin_UpdateGoodsServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2093878806705818477L;

	/**
	 * Constructor of the object.
	 */
	public Admin_UpdateGoodsServlet() {
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
		
		GoodsInfo goods = new GoodsInfo();
		GoodsCtrl gc = new GoodsCtrl();		
		
		int goodsid =Integer.parseInt(request.getParameter("goodsId"));
		String goodsName =request.getParameter("goodsName");
		String goodsSort =request.getParameter("goodsSort");
		double goodsPrice =Double.parseDouble(request.getParameter("goodsPrice"));
		double goodsCarr =Double.parseDouble(request.getParameter("goodsCarr"));
		String goodsAddr =request.getParameter("goodsAddr");
		String goodsImg =request.getParameter("goodsImg");
		String Tuijian =request.getParameter("isTuijian");
		String Xianliang =request.getParameter("isXianliang");
		String Tejia =request.getParameter("isTejia");
		String Cuxiao =request.getParameter("isCuxiao");
		String goodsZt =request.getParameter("goodsZt");
		String goodsIntro =request.getParameter("goodsIntro");
		
		goods.setGoodsId(goodsid);
		goods.setGoodsname(goodsName);
		goods.setGoodssort(goodsSort);
		goods.setGoodsprice(goodsPrice);
		goods.setGoodscarr(goodsCarr);
		goods.setGoodsaddr(goodsAddr);
		goods.setGoodsimg(goodsImg);
		goods.setGoodstuijian(Tuijian);
		goods.setGoodsxianliang(Xianliang);
		goods.setGoodstejia(Tejia);
		goods.setGoodscuxiao(Cuxiao);
		goods.setGoodszt(goodsZt);
		goods.setGoodsintro(goodsIntro);
		
		int res =gc.updateGoods(goods);
		if(res>0){
			out.print("<script>alert('修改成功！');window.location.href='../admin/goods.jsp';</script>");
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
