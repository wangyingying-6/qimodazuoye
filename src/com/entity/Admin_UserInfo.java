package com.entity;
/**
 * 后台管理员信息类
 * @author Administrator
 *
 */

public class Admin_UserInfo {
	private int admin_userId;
	private String admin_username;
	private String admin_userpwd;
	
	public int getAdmin_userId() {
		return admin_userId;
	}
	public void setAdmin_userId(int adminUserId) {
		admin_userId = adminUserId;
	}
	public String getAdmin_username() {
		return admin_username;
	}
	public void setAdmin_username(String adminUsername) {
		admin_username = adminUsername;
	}
	public String getAdmin_userpwd() {
		return admin_userpwd;
	}
	public void setAdmin_userpwd(String adminUserpwd) {
		admin_userpwd = adminUserpwd;
	}

}
