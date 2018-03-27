package com.tz.bs.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * 监听器,当应用启动时,把当前应用路径添加到servlet上下文范围中
 */
@WebListener
public class MyContextPathListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String base = sce.getServletContext().getContextPath();
		sce.getServletContext().setAttribute("base", base);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		sce.getServletContext().removeAttribute("base");
	}
}
