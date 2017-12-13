package action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import common.CreateId;

import dao.OrderDao;
import dao.RoomDao;
import dao.TypeDao;
import dao.UserDao;

import entity.Room;
import entity.Type;
import entity.User;

public class RoomAction extends ActionSupport{
	private Room room=new Room();
	private ArrayList<Room> rooms;
	private ArrayList<Type> types;
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
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
	//添加商品前期工作  获得商品id，获得商品类型
	public String preInsertRoom(){
		room.setRid("r"+CreateId.getId());
		TypeDao dao=new TypeDao();
		this.setTypes(dao.getTypes());
		return SUCCESS;
	}
	public String insertRoom(){
		RoomDao dao=new RoomDao();
		int i=dao.insertRoom(room);
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg","add room error！");
		return "insertroomerror";
	}
	public String deleteRoom(){
		RoomDao dao=new RoomDao();
		int i=dao.deleteRoomByRid(room.getRid());
		if(i>0){
			return SUCCESS;
		}
		this.addFieldError("msg","delete room error！");
		return "deleteroomerror";		
	}
	public String getAllRooms(){
		RoomDao dao=new RoomDao();
		ArrayList<Room> allp=dao.selectAllRoom();
		this.setRooms(allp);
		return SUCCESS;
	}
	public String selectRoomByRid(){
		RoomDao dao=new RoomDao();
		Room r=dao.selectRoomByRid(room.getRid());
		this.setRoom(r);
		TypeDao tdao=new TypeDao();
		this.setTypes(tdao.getTypes());
		return SUCCESS;
	}
	public String updateRoom(){
		RoomDao dao=new RoomDao();
		int i=dao.updateRoomInfo(room);
		if(i>0){
			return SUCCESS;
		}
		return "updateroomerror";
	}
	public String updateRoomStatus(){
		RoomDao dao=new RoomDao();
		dao.updateRoomStatus(room);
		return SUCCESS;
	}
	
}
