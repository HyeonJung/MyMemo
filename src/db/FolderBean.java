package db;

public class FolderBean {
	public int getFolderNo() {
		return folderNo;
	}
	public void setFolderNo(int folderNo) {
		this.folderNo = folderNo;
	}
	public int getFolderName() {
		return folderName;
	}
	public void setFolderName(int folderName) {
		this.folderName = folderName;
	}
	public int getEmail() {
		return email;
	}
	public void setEmail(int email) {
		this.email = email;
	}
	
	private int folderNo;
	private int folderName;
	private int email;
}
