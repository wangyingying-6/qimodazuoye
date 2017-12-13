package action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import common.CreateId;

import dao.BookDao;
import dao.UserDao;
import entity.Book;

import entity.User;

public class UserAction extends ActionSupport implements SessionAware{
	private User  user=new User();
	private Map<String,Object> session;//使用会话对象
	private ArrayList<Book> mybook;
	
	public ArrayList<Book> getMybook() {
		return mybook;
	}
	public void setMybook(ArrayList<Book> mybook) {
		this.mybook = mybook;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	private ArrayList<User> users;
	public ArrayList<User> getUsers() {
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}
	//前台显示登录
	public String userLogin(){
		return execute();
	}

	//执行登录验证的方法
	public String execute(){
		UserDao dao=new UserDao();
		User ru= dao.selectUser(user);
		if(ru==null){
			//用户名不存在
			//添加错误消息
			this.addFieldError("invalid", "invalid username!");
			return "error";
	}
	if(ru.getStatus().equals("0")){
		//表示锁定状态
		//添加错误消息
		this.addFieldError("invalid", "user locked!");
		return "error";
	}
	if(!user.getPassword().equals(ru.getPassword())){
		int i=ru.getWrongnum();
		if(i==2){
			//如果原来已经错误两次密码时，本次属于第3次错误
			//更新用户状态，状态为0，次数为3，该用户的id
			User uu=new User();
			uu.setUserid(ru.getUserid());
			uu.setStatus("0");
			uu.setWrongnum(3);
			//执行更新
			dao.updateUserStatus(uu);
			this.addFieldError("invalid", "3 time already,account locked!");
		}else{
		//添加错误消息
			User uu=new User();
			uu.setUserid(ru.getUserid());
			uu.setStatus("1");
			uu.setWrongnum(ru.getWrongnum()+1);
			//执行更新
			dao.updateUserStatus(uu);
		this.addFieldError("invalid", "invalid password!");
		//判断密码出错的次数是否达到3次
		//达到3次，把用户状态改为锁定状态 0
		//未达到3次，把用户的错误登录次数+1
		}
		return "error";
	}
	//登陆成功时，保留登录用户的信息到session中，
	//以备后期使用（main.jsp显示是谁登录的，需要根据用户的角色显示不同的主页面内容）
	session.put("userinfo", ru);
	return "suc";
	}
	//查询所有用户
	public String selectAllUser(){
		//交给Dao层查询所有用户
		UserDao dao=new UserDao();
    	ArrayList<User> allUser=dao.selectALLUser();
    	//把数据带回到页面的话
    	//1. session
    	//2.把数据作为Action的属性出现时，就可以自动传到页面
    	this.setUsers(allUser);
		return SUCCESS;
	}
	public String userUnlock(){
		UserDao dao=new UserDao();
		user.setStatus("1");
		user.setWrongnum(0);
		dao.updateUserStatus(user);
		//selectAllUser();
		return SUCCESS;
	}
	public String preInsertUser(){
		user.setUserid("u"+CreateId.getId());
		return SUCCESS;
	}
	public String checkUserName(){
		UserDao dao=new UserDao();
		User ru =dao.selectUser(user);
		if(ru==null){
			this.addFieldError("msg", "username is ok!");
			return SUCCESS;
		}
		user.setUsername("");
		this.addFieldError("msg", "username already exist!");
		return "checkerror";
	}
	public String insertUser(){
		UserDao dao=new UserDao();
		int i=dao.insertUser(user);
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg", "add user error!");
		return "insertusererror";
	}
	public String deleteUser(){
		UserDao dao=new UserDao();
		int i=dao.deleteUserByUserid(user.getUserid());
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg", "add user error!");
		return "deleteusererror";
	}
	public String updateUser(){
		UserDao dao=new UserDao();
		int i=dao.updateUserInfo(user);
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg", "update user error!");
		return "updateusererror";
	}
	public String logoff(){
		//session.put("userinfo", null);
		session.remove("userinfo");
		return SUCCESS;
	}  
}









