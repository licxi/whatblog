package cn.lcxjj.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.lcxjj.service.SystemSetupService;

/**
 * 加载网站名
 * @author TrueLE
 *
 */
public class SystemNameListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent httpSessionEvent) {
		String systemName;
		HttpSession session = httpSessionEvent.getSession();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		SystemSetupService systemSetupService = context.getBean("systemSetupService", SystemSetupService.class);
		if(systemSetupService == null){
			systemName="WhatBlog";
		}else{
			systemName = systemSetupService.selectSystemSetup().getSystemName();
			
		}
		session.setAttribute("systemName", systemName);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {

	}

}
