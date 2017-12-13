package action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import common.CreateId;

import dao.CommentDao;
import dao.RoomDao;
import dao.TypeDao;

import entity.Comment;
import entity.Room;
import entity.Type;
import entity.User;

public class CommentAction extends ActionSupport implements SessionAware{
	private Comment comment=new Comment();
	private Map<String,Object>  session;
	private ArrayList<Comment> comments;
	private ArrayList<Room> rooms;
	private ArrayList<Type> types;
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public ArrayList<Comment> getComments() {
		return comments;
	}
	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}
	public ArrayList<Room> getRooms() {
		return rooms;
	}
	public void setRooms(ArrayList<Room> rooms) {
		this.rooms = rooms;
	}
	public ArrayList<Type> getTypes() {
		return types;
	}
	public void setTypes(ArrayList<Type> types) {
		this.types = types;
	}
	public String preInsertComment(){
		comment.setCmid("c"+CreateId.getId());
		RoomDao dao=new RoomDao();
		this.setRooms(dao.selectAllRoom());
		TypeDao daoo=new TypeDao();
		this.setTypes(daoo.getTypes());
		return SUCCESS;
	}
	public String insertComment(){
		CommentDao dao=new CommentDao();

		int i=dao.insertComment(comment);
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg","add comment error£¡");
		return "insertcommenterror";
	}
	public String deleteComment(){
		CommentDao dao=new CommentDao();
		int i=dao.deleteCommentByCmid(comment.getCmid());
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg","delete comment error£¡");
		return "deletecommenterror";		
	}
	public String updateComment(){
		CommentDao dao=new CommentDao();
		int i=dao.updateCommentInfo(comment);
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg", "update comment error!");
		return "updatecommenterror";
	}
	public String getAllComments(){
		CommentDao dao=new CommentDao();
		ArrayList<Comment> allp=dao.selectAllComment();
		this.setComments(allp);
		return SUCCESS;
	}
	public String selectCommentByCmid(){
		CommentDao dao=new CommentDao();
		Comment c=dao.selectCommentByCmid(comment.getCmid());
		this.setComment(c);
		RoomDao rdao=new RoomDao();
		this.setRooms(rdao.selectAllRoom());
		TypeDao tdao=new TypeDao();
		this.setTypes(tdao.getTypes());
		return SUCCESS;
	}
	public String getMyComments(){
		User user=(User)session.get("userinfo");
		CommentDao dao=new CommentDao();
		this.setComments(dao.getAllComment(user.getUserid()));
		return SUCCESS;
	}
}
