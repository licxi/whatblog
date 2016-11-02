package cn.lcxjj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/*
 * 拦截器
 */
public class IsLoginInterceptor implements HandlerInterceptor {


	/**
	 * 访问controller之前进行拦截，false 停止执行 true 继续执行
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		//如果没有登录，则跳转到登录页面
		if(session.getAttribute("user_name") == null || session.getAttribute("user_name").equals("")){
			response.sendRedirect("../user/toLogin.do");
			return false;
		}
		return true;
	}

	/**
	 * controller 执行完，但视图还没有渲染
	 */
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	/**
	 * �?终拦截，视图解析页面完成之后 可以用于拦截以的异常
	 */
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
