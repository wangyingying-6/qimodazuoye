package common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateId {
	//返回系统时间作为主键，时间精确到毫秒
	public static String getId(){
		Date d=new Date();
		SimpleDateFormat f=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String fd=f.format(d);
		return fd;
	}
}
