package com.tz.bs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;
import com.tz.bs.service.BookService;
import com.tz.bs.util.BeanFactory;
import com.tz.bs.util.PageBean;

@WebServlet(urlPatterns = "/book/*")
public class BookAction extends HttpServlet {
	private static final long serialVersionUID = 8987163579057509190L;
	BookService bs = (BookService) BeanFactory.getBean("bookService");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pathInfo = req.getPathInfo();
		String nextPage = null;
		System.out.println("book:" + pathInfo);
		boolean isRedirect = false;
		if ("/index".equals(pathInfo)) {
			req.setAttribute("cates", bs.getAllCategories());
			nextPage = "/WEB-INF/page/index.jsp";
		} else if ("/showData".equals(pathInfo)) {
			String cateStr = req.getParameter("cate");
			Long cate = (cateStr == null) ? null : Long.parseLong(cateStr);
			Integer now = Integer.parseInt(req.getParameter("now"));
			Integer size = Integer.parseInt(req.getParameter("size"));
			PageBean<Book> pb = bs.queryByCondition(now, size, cate, null);
			Category type = pb.getPageDatas().get(0).getCategory();
			req.setAttribute("pageBean", pb);
			req.setAttribute("type", type);
			nextPage = "/WEB-INF/page/book/booklist.jsp";
		} else if ("/detail".equals(pathInfo)) {
			String idStr = req.getParameter("id");
			Long bookid = (idStr == null) ? null : Long.parseLong(idStr);
			Book book = bs.queryById(bookid);
			req.setAttribute("bk", book);
			nextPage = "/WEB-INF/page/book/detail.jsp";
		} else if ("/search".equals(pathInfo)) {
			String cateStr = req.getParameter("cateStr");
			String search = req.getParameter("search");

			req.setAttribute("cateStr", cateStr);
			if (search != null) {
				req.setAttribute("search", search);
			}

			nextPage = "/WEB-INF/page/book/search.jsp";
		} else if ("/right".equals(pathInfo)) {
			nextPage = "/WEB-INF/page/comm/righter.jsp";
		} else if ("/showSearch".equals(pathInfo)) {
			String search = req.getParameter("search");
			search=(search=="")?null:search;
			
			String cateStr = req.getParameter("cateStr");
			cateStr=(cateStr=="")?null:cateStr;
			Long cate = (cateStr == null) ? null : Long.parseLong(cateStr);
			
			System.out.println("search cateStr"+search+":"+cate);
			
			Integer now = Integer.parseInt(req.getParameter("now"));
			Integer size = Integer.parseInt(req.getParameter("size"));
			
			PageBean<Book> pb = bs.queryByCondition(now, size, cate, search);
			
			Category type = pb.getPageDatas().get(0).getCategory();
			req.setAttribute("pageBean", pb);
			
			req.setAttribute("type", type.getCatename());
			System.out.println(type.getCatename());
			if (search != null) {
				req.setAttribute("type", search);
			}

			nextPage = "/WEB-INF/page/book/searchList.jsp";
		}

		if (nextPage != null) {
			if (isRedirect) {
				resp.sendRedirect(nextPage);
			} else {
				req.getRequestDispatcher(nextPage).forward(req, resp);
			}
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	private String getCookieValue(Cookie[] cookies, String cookieName) {
		if (cookies == null) {
			return null;
		}
		String value = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(cookieName)) {
				value = cookie.getValue();
			}
		}
		return value;
	}

}
