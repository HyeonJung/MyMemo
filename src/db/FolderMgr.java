package db;

public class FolderMgr {
	DBConnectionMgr pool;
	
	FolderMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
