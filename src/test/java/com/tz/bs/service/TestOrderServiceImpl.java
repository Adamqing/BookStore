package com.tz.bs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.Order;
import com.tz.bs.entity.OrderItem;
import com.tz.bs.entity.OrderStatus;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.util.BeanFactory;
import com.tz.bs.util.PageBean;

public class TestOrderServiceImpl {
	private OrderService orderService = (OrderService) BeanFactory.getBean("orderService");

@Test
public void testsave(){
	Address address = new Address();
	User user = new User();
	Order order = new Order();
	order.setOrderNum("12121212");
	order.setCreateDate(new Date());
	order.setOrderStatus(OrderStatus.已签收);
	order.setTotal(Double.valueOf(20));
	address.setAddressid(Integer.toUnsignedLong(1));
	user.setUserid(Integer.toUnsignedLong(1));
	order.setAddress(address);
	order.setUser(user);
	//order.setOrderId(Integer.toUnsignedLong(1));
	List<OrderItem> olist = new ArrayList<>();	
	for(int i = 1 ; i<5;i++){
	OrderItem orderitem = new OrderItem();
	orderitem.setBook_name("中华");
	orderitem.setBook_isbn("难过");
	orderitem.setBook_author("李白");
	orderitem.setUnit_price(Double.valueOf(20));
	orderitem.setAllPrice(Double.valueOf(50));
	orderitem.setBook_url("中华图书");
	orderitem.setCount(i);
	orderitem.setOrder(order);
	olist.add(orderitem);
	} 
	order.setItems(olist);
	orderService.save(order);
}
@Test
public void testdelete(){
	Order o = new Order();
	o.setOrderId(18L);
	OrderItem orderitem = new OrderItem();
	orderitem.setOrder(o);
	orderService.delete(o);
}
@Test
public void testfindById(){
	System.out.println(orderService.findById(11L));
}
@Test
public void testfindByNum(){
	System.out.println(orderService.findByNum("12121212"));
}
@Test
public void testqueryByPage(){
	User user = new User();
	user.setUserid(1L);
	SearchPojo search = new SearchPojo();
	search.setBeginDate(new Date());
	search.setEndDate(new Date());
	search.setOrderNum("12121212");
	search.setOrderStatus(OrderStatus.已签收);
	search.setIsOrderByTime(2);
	System.out.println(orderService.queryByPage(user, 1, 2,search));
}

}
