package common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateId {
	//����ϵͳʱ����Ϊ������ʱ�侫ȷ������
	public static String getId(){
		Date d=new Date();
		SimpleDateFormat f=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String fd=f.format(d);
		return fd;
	}
}
