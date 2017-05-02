package db;

import java.sql.Date;

public class MemoBean {

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getDeldate() {
		return deldate;
	}
	public void setDeldate(Date deldate) {
		this.deldate = deldate;
	}
	public boolean getImportance() {
		return importance;
	}
	public void setImportance(boolean importance) {
		this.importance = importance;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public Date getNotidate() {
		return notidate;
	}
	public void setNotidate(Date notidate) {
		this.notidate = notidate;
	}
	public int getMemoNo() {
		return MemoNo;
	}
	public void setMemoNo(int memoNo) {
		MemoNo = memoNo;
	}
	private int MemoNo;
	private String content;
	private Date regdate;
	private Date deldate;
	private Date notidate;
	private Date modDate;
	private boolean importance;
	private String email;
	
	
}
