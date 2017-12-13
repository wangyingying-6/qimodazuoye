package action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import common.CreateId;

import dao.BookDao;
import dao.OrderDao;
import dao.RoomDao;

import entity.Book;
import entity.Room;

import entity.User;

public class BookAction extends ActionSupport implements SessionAware{
	private Book book=new Book();
	private Room room=new Room();
	private Map<String,Object>  session;
	private ArrayList<Book> roomss;
	private ArrayList<Book> allbooks;
	private ArrayList<Room> rooms; 
	public Book getBook() {
		return book; 
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public ArrayList<Book> getBooks() {
		return roomss;
	}
	public void setBooks(ArrayList<Book> roomss) {
		this.roomss = roomss;
	}
	public ArrayList<Room> getRooms() {
		return rooms;
	}
	public void setRooms(ArrayList<Room> rooms) {
		this.rooms = rooms;
	}
	public String insertBook(){
		 User u=(User)session.get("userinfo");
		  if(u==null){
			  this.addFieldError("msg", "please login");
			  return "login";
		  }
		BookDao dao=new BookDao();
		//应该从Session把当前用户信息获取出来
		book.setBid("b"+CreateId.getId());
		RoomDao rdao=new RoomDao();
		this.setRooms(rdao.selectAllRoom());
		book.setUser(u);
		int i=dao.insertBook(book);
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg","add book error！");
		return "insertbookerror";
	}
	public String removeRoomfromBook(){
		 User u=(User)session.get("userinfo");
		BookDao dao=new BookDao();
		int i=dao.removeRoomfromBook(book.getRoom().getRid(),u.getUserid());
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg","delete book error！");
		return "deletebookerror";		
	}
	public String updateBook(){
		RoomDao rdao=new RoomDao();
		this.setRooms(rdao.selectAllRoom());
		
		User user=(User)session.get("userinfo");
		book.setUser(user);
		BookDao dao=new BookDao();
		int i=dao.updateBookInfo(book);
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg", "update book error!");
		return "updatebookerror";
	}
	public String getAllBooks(){
		book.setBid("b"+CreateId.getId());
		 User u=(User)session.get("userinfo");
		BookDao dao=new BookDao();
		ArrayList<Book> allp=dao.selectAllBook(u.getUserid());
		session.put("mybook",allp);
		this.setBooks(allp);
		return SUCCESS;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public ArrayList<Book> getAllbooks() {
		return allbooks;
	}
	public void setAllbooks(ArrayList<Book> allbooks) {
		this.allbooks = allbooks;
	}
	public String getBooking(){
		BookDao dao= new BookDao();
    	this.setAllbooks(dao.selectAllBook());
    	return SUCCESS;
		
	}
	public String selectBookByRidandUserid(){
		RoomDao rdao=new RoomDao();
		this.setRooms(rdao.selectAllRoom());
		 User u=(User)session.get("userinfo");

		BookDao dao=new BookDao();
		Book b=dao.selectBookByRidandUserid(book.getRoom().getRid());
		this.setBook(b);
		
		return SUCCESS;
	}
	 public double totalPrice(){
		  double totalprice=0.0;
		  Iterator<Book> it=roomss.iterator();
		  while(it.hasNext()){
			  Book b=it.next();
			  totalprice=totalprice+b.getRoom().getRprice();
		  }
		  return totalprice;
	  }
}
