package com.tz.bs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


@WebFilter(filterName = "EncodeFilter", urlPatterns = "/*", initParams = {
		@WebInitParam(name = "encoding", value = "utf-8") })
public class EncodeFilter implements Filter{

	@Override
	public void destroy() {
	
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		arg0.setCharacterEncoding(defaultEncoding);
		arg1.setContentType("text/html;charset=" + defaultEncoding + "");
		//放行
		arg2.doFilter(arg0,arg1);
		
	}
	private String defaultEncoding = "UTF-8";
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		String encoding = arg0.getInitParameter("encoding");

		if (encoding != null && !"".equals(encoding)) {
			defaultEncoding = encoding;
		}
		
	}

}
