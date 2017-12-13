package common;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserLoginCheck extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		//判断用户是否登录，如果登录，继续执行
		//否则跳转到登录页面
		Map<String,Object> session=arg0.getInvocationContext().getSession();
		Object o=session.get("userinfo");
		if(o!=null){
			
		
		//如果有其他拦截器的话，接着调用其他拦截器
		//如果没有时，调用action
		
	    String result=arg0.invoke();
		
		return null;
		}
		return "userlogincheckfail";
		
	}
	
}
