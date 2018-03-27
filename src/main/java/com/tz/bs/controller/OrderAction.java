package com.tz.bs.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.tz.bs.cart.ShoppingCart;
import com.tz.bs.entity.Address;
import com.tz.bs.entity.Order;
import com.tz.bs.entity.OrderStatus;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.service.OrderService;
import com.tz.bs.service.UserService;
import com.tz.bs.util.BeanFactory;
import com.tz.bs.util.DateUtil;

@WebServlet("/permission/order/*")
public class OrderAction extends HttpServlet {

	private static final long serialVersionUID = -8346481649583891580L;
	OrderService orderService = (OrderService) BeanFactory.getBean("orderService");
	UserService userService = (UserService) BeanFactory.getBean("userService");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		String nextPage = null;
		boolean isRedirect = false;
		User user = (User) request.getSession().getAttribute("user");
		System.out.println("order:" + pathInfo);
		if ("/index".equals(pathInfo)) {
			request.setAttribute("pageid", request.getParameter("pageid"));
			nextPage = "/WEB-INF/page/order/OrderComm.jsp";
		} else if ("/showOrder".equals(pathInfo)) {
			String pageNow = request.getParameter("pageNow");

			String pageSize = request.getParameter("pageSize");

			String start = request.getParameter("start");

			String end = request.getParameter("end");
			
			String sta = request.getParameter("status");

			String isOrder = request.getParameter("isOrder");
			String orderNum = request.getParameter("orderNum");
			
			
			Date startDate = (start == null||start =="") ? null : DateUtil.parse(start, DateUtil.TIMES_PATTERN);
			Date endDate = (end == null||end =="") ? null : DateUtil.parse(end, DateUtil.TIMES_PATTERN);
			Integer now = (pageNow == null||pageNow =="") ? 1 : Integer.parseInt(pageNow);
			Integer size = (pageSize == null||pageSize =="") ? 4 : Integer.parseInt(pageSize);
			Integer orderby = (isOrder == null||isOrder =="") ? 2 : Integer.parseInt(isOrder);
			SearchPojo search = new SearchPojo();
			
			if(sta!=null&&sta!=""){
				System.out.println(sta);
				OrderStatus orderStatus =Enum.valueOf(OrderStatus.class, sta);
				search.setOrderStatus(orderStatus);
			}
			
			
			search.setBeginDate(startDate);
			search.setEndDate(endDate);
			search.setIsOrderByTime(orderby);
			search.setOrderNum(orderNum);
			
			//System.out.println(search);
			request.setAttribute("pageBean", orderService.queryByPage(user, now, size, search));
			nextPage = "/WEB-INF/page/order/showData.jsp";
		} else if ("/deleteOrder".equals(pathInfo)) {
			String orderStr = request.getParameter("orderid");
			System.out.println("orderStr"+orderStr);
			if(orderStr != null&&orderStr !=""){
				Long orderId=Long.parseLong(orderStr);
				Order o=new Order();
				o.setOrderId(orderId);
				orderService.delete(o);
				response.getWriter().println("1");
			}else{
				response.getWriter().println("2");
			}
			
			
			

		} else {
			ShoppingCart sc = (ShoppingCart) request.getSession().getAttribute("cart");
			if (sc == null || sc.getCount() == 0) {
				response.getWriter().print("<h1>购物车为空</h1>");
			} else {

				if ("/confirmOrder".equals(pathInfo)) {
					List<Address> adds = userService.getAddressByUser(user);
					request.setAttribute("adds", adds);
					nextPage = "/WEB-INF/page/order/comfirmData.jsp";
				} else if ("/addAddress".equals(pathInfo)) {
					String area = request.getParameter("area");
					String detailaddress = request.getParameter("detailaddress");
					String emailcode = request.getParameter("emailcode");
					String reciver = request.getParameter("reciver");
					String tel = request.getParameter("tel");
					String isDef = request.getParameter("isDef");

					if (area == null || area == "") {
						response.getWriter().println("1");
					} else if (detailaddress == null || detailaddress == "") {
						response.getWriter().println("2");
					} else if (emailcode == null || emailcode == "" || !isNumber(emailcode)) {
						response.getWriter().println("3");
					} else if (reciver == null || reciver == "") {
						response.getWriter().println("4");
					} else if (tel == null || tel == "" || !isNumber(tel)) {
						response.getWriter().println("5");
					} else {

						Address a = new Address();
						a.setArea(area);
						a.setDetailaddress(detailaddress);
						a.setEmailcode(emailcode);
						a.setReciver(reciver);
						a.setUser(user);
						a.setTel(tel);
						a.setIsDefault((isDef == null) ? '0' : '1');
						userService.addAddress(a);
						response.getWriter().println(JSON.toJSONString(a));

					}

				} else if ("/payOrder".equals(pathInfo)) {
					String addid = request.getParameter("addid");
					if (addid == null || addid == "" || !isNumber(addid)) {
						response.getWriter().print("结算失败,地址有误");
						;
					} else {
						Order order = new Order();
						Address address = new Address();
						address.setAddressid(Long.parseLong(addid));
						order.setAddress(address);
						order.setCreateDate(new Date());
						order.setItems(sc.getCart());
						order.setOrderNum(String.valueOf(System.currentTimeMillis()));
						order.setOrderStatus(OrderStatus.等待发货);
						order.setTotal(sc.getTotal());
						order.setUser(user);
						orderService.save(order);
						sc.clear();
						response.getWriter().print("1");
					}

				}
			}
		}

		if (nextPage != null) {
			if (isRedirect) {
				response.sendRedirect(nextPage);
			} else {
				request.getRequestDispatcher(nextPage).forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public boolean isNumber(String str) {
		return str.matches("[0-9]*");
	}
}
