package action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import common.CreateId;
import dao.BookDao;
import dao.OrderDao;



import entity.Book;
import entity.Order;
import entity.OrderDetail;

import entity.User;

public class OrderAction extends ActionSupport implements SessionAware{
	private Map<String,Object> session;
	private Order myorder=new Order();
	private ArrayList<Order> myorders;
	private ArrayList<Order> allorders;
	private OrderDetail detail=new OrderDetail();
	private ArrayList<OrderDetail> details;
	
	
	
	public Order getMyorder() {
		return myorder;
	}
	public void setMyorder(Order myorder) {
		this.myorder = myorder;
	}
	public ArrayList<Order> getMyorders() {
		return myorders;
	}
	public void setMyorders(ArrayList<Order> myorders) {
		this.myorders = myorders;
	}
	public ArrayList<Order> getAllorders() {
		return allorders;
	}
	public void setAllorders(ArrayList<Order> allorders) {
		this.allorders = allorders;
	}
	public OrderDetail getDetail() {
		return detail;
	}
	public void setDetail(OrderDetail detail) {
		this.detail = detail;
	}
	public ArrayList<OrderDetail> getDetails() {
		return details;
	}
	public void setDetails(ArrayList<OrderDetail> details) {
		this.details = details;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object> arg0){
		session=arg0;
	}
	//结账
	public String account(){
		OrderDao dao=new OrderDao();
		myorder.setOid("o"+CreateId.getId());
		User user=(User)session.get("userinfo");
		myorder.setUser(user);
		//总价我们通过超链接已经自动封装到totalprice中了
		int i=dao.insertNewOrder(myorder);
		if(i>0){
			//订单创建成功
			//从session中获取我的购物车中的所有商品
			//循环从集合中获取一个商品，向订单明细中插入一条记录
			ArrayList<Book> allp=(ArrayList<Book>)session.get("mybook");
			Iterator<Book> it=allp.iterator();
			while(it.hasNext()){
				//获取一个商品
				Book s=it.next();
				//向订单明细中插入一条记录
				OrderDetail od=new OrderDetail();
				od.setOdid("d"+CreateId.getId());
				
				od.setOrder(myorder);
				od.setRoom(s.getRoom());
				dao.insertNewOrderDetail(od);
			}
			//根据用户id删除购物车表中的所有记录
			BookDao sdao=new BookDao();
			sdao.deleteBookByUserid(user.getUserid());
			return SUCCESS;
		}
		session.put("msg","insert order fail");
		return "insertordererror";
	}
	//获取我的订单
	public String getMyOrders(){
		User user=(User)session.get("userinfo");
		OrderDao dao=new OrderDao();
		this.setMyorders(dao.getAllOrderB(user.getUserid()));
		return SUCCESS;
	}
	public String getOrdersBytime(){
		User user=(User)session.get("userinfo");
		OrderDao dao=new OrderDao();
		this.setAllorders(dao.getAllOrderB(myorder.getSt(),myorder.getEt()));
		return SUCCESS;
	}
	public String getOrders(){
		OrderDao dao=new OrderDao();
		this.setAllorders(dao.getAllOrder());
		return SUCCESS;
	}
	public String getOrderDetail(){
		OrderDao dao=new OrderDao();
		this.setDetails(dao.getOrderDetail(myorder.getOid()));
		return SUCCESS;
	}
	public String updateOrderStatus(){
		OrderDao dao=new OrderDao();
		dao.updateOrderStatus(myorder);
		return SUCCESS;
	}
}
