package common;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserLoginCheck extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		//�ж��û��Ƿ��¼�������¼������ִ��
		//������ת����¼ҳ��
		Map<String,Object> session=arg0.getInvocationContext().getSession();
		Object o=session.get("userinfo");
		if(o!=null){
			
		
		//����������������Ļ������ŵ�������������
		//���û��ʱ������action
		
	    String result=arg0.invoke();
		
		return null;
		}
		return "userlogincheckfail";
		
	}
	
}
