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
	private Map<String,Object> session;//ʹ�ûỰ����
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
	//ǰ̨��ʾ��¼
	public String userLogin(){
		return execute();
	}

	//ִ�е�¼��֤�ķ���
	public String execute(){
		UserDao dao=new UserDao();
		User ru= dao.selectUser(user);
		if(ru==null){
			//�û���������
			//��Ӵ�����Ϣ
			this.addFieldError("invalid", "invalid username!");
			return "error";
	}
	if(ru.getStatus().equals("0")){
		//��ʾ����״̬
		//��Ӵ�����Ϣ
		this.addFieldError("invalid", "user locked!");
		return "error";
	}
	if(!user.getPassword().equals(ru.getPassword())){
		int i=ru.getWrongnum();
		if(i==2){
			//���ԭ���Ѿ�������������ʱ���������ڵ�3�δ���
			//�����û�״̬��״̬Ϊ0������Ϊ3�����û���id
			User uu=new User();
			uu.setUserid(ru.getUserid());
			uu.setStatus("0");
			uu.setWrongnum(3);
			//ִ�и���
			dao.updateUserStatus(uu);
			this.addFieldError("invalid", "3 time already,account locked!");
		}else{
		//��Ӵ�����Ϣ
			User uu=new User();
			uu.setUserid(ru.getUserid());
			uu.setStatus("1");
			uu.setWrongnum(ru.getWrongnum()+1);
			//ִ�и���
			dao.updateUserStatus(uu);
		this.addFieldError("invalid", "invalid password!");
		//�ж��������Ĵ����Ƿ�ﵽ3��
		//�ﵽ3�Σ����û�״̬��Ϊ����״̬ 0
		//δ�ﵽ3�Σ����û��Ĵ����¼����+1
		}
		return "error";
	}
	//��½�ɹ�ʱ��������¼�û�����Ϣ��session�У�
	//�Ա�����ʹ�ã�main.jsp��ʾ��˭��¼�ģ���Ҫ�����û��Ľ�ɫ��ʾ��ͬ����ҳ�����ݣ�
	session.put("userinfo", ru);
	return "suc";
	}
	//��ѯ�����û�
	public String selectAllUser(){
		//����Dao���ѯ�����û�
		UserDao dao=new UserDao();
    	ArrayList<User> allUser=dao.selectALLUser();
    	//�����ݴ��ص�ҳ��Ļ�
    	//1. session
    	//2.��������ΪAction�����Գ���ʱ���Ϳ����Զ�����ҳ��
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









