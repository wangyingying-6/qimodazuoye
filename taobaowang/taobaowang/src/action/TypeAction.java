package action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import common.CreateId;

import dao.TypeDao;

import entity.Type;

public class TypeAction  extends ActionSupport implements SessionAware{
	private Map<String,Object> session;
	private Type type=new Type();
	private ArrayList<Type> types;
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public ArrayList<Type> getTypes() {
		return types;
	}
	public void setTypes(ArrayList<Type> types) {
		this.types = types;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
		
	}
	public String preInsertType(){
		type.setSid("s"+CreateId.getId());
		TypeDao dao=new TypeDao();
		this.setTypes(dao.getTypes());
		return SUCCESS;
	}
	public String addType(){
		
		TypeDao dao=new TypeDao();

		upload();
		int i=dao.addType(type);
		
		if(i>0){
			return SUCCESS;
		}
		return "addTypeerror";
	}
	public String updateType(){
		TypeDao dao=new TypeDao();
		upload();
		int i=dao.updateType(type);
		if(i>0){
			return SUCCESS;
		}
		return "updateTypeerror";
	}
	public String deleteType(){
		TypeDao dao=new TypeDao();
		int i=dao.deleteType(type.getSid());
		if(i>0){
			return SUCCESS;
		}
		return "deleteTypeerror";
	}
	public String getTypeById(){
		TypeDao dao=new TypeDao();
		this.setType(dao.getTypeByid(type.getSid()));
		return SUCCESS;
	}
	public String getAllTypes(){
		TypeDao dao=new TypeDao();
		this.setTypes(dao.getTypes());
		return SUCCESS;
	}
	public String upload() {
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/files");
		File file = new File(realpath);
		if (!file.exists()) {
			file.mkdirs();
		}
		try {
			//���ϴ����ļ�������17λʱ��ID�󣬷������˱�����ļ���
			type.setUploadImageFileName(
					CreateId.getId()+type.getUploadImageFileName());	
			//���ϴ����������˵���ʱ�ļ���������������Ӧ��Ŀ¼����			
			FileUtils.
			copyFile(type.getUploadImage(), 
					new File(file, type.getUploadImageFileName()));
			//�������ݿ��б�����ļ�·��(�������˵�·��)
			type.setSimage(realpath+"\\"+type.getUploadImageFileName());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
