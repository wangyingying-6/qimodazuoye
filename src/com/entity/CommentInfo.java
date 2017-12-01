package com.entity;
/**
 * 商品评论信息表
 * @author Administrator
 *
 */
public class CommentInfo {
	private int commentId;
	private int goodsid;
	private String commentname;
	private String commentContent;
	private String commentDate;
	
	
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public String getCommentname() {
		return commentname;
	}
	public void setCommentname(String commentname) {
		this.commentname = commentname;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	

}
