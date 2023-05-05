package com.sheep.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class UserInterceptor implements HandlerInterceptor{

	private String[] pass = {"index.jsp","login.jsp","userLogin",
			"/register.jsp","jsp/admin/adminLogin.jsp","tologin",
			"ImageAction","userRegister","test.jsp","getCode"};	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Boolean flag = false;
		for (String p : pass) {
			if(uri.contains(p)) {
				flag = true;
			}
		}
		
		if(!flag) {
			HttpSession session = request.getSession();
			Object object = session.getAttribute("user");
			if(object!=null) {
				flag = true;
			}else {
				//重定向到登陆页
				response.sendRedirect("jsp/user/login.jsp");
			}
		}
		return flag;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
