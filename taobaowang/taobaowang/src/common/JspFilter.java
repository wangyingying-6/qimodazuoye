package common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JspFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		HttpSession session=request.getSession();
		Object o=session.getAttribute("userinfo");
		String path=request.getRequestURI();
		//过滤规则
		if(path.endsWith("css")||path.endsWith("jsp")||path.endsWith("js")||path.endsWith("/MyHotel/")||path.endsWith("userLogin.jsp")||path.endsWith("index.jsp")){
			arg2.doFilter(arg0, arg1);
		}
		else if(o==null){
			response.sendRedirect("/MyHotel/userLogin.jsp");
		}else{
		//放行,通过该过滤器
		arg2.doFilter(arg0, arg1);
		//否则不通过
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
