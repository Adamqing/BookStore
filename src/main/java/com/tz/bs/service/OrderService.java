package com.tz.bs.service;

import com.tz.bs.entity.Order;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.util.PageBean;

public interface OrderService {
	
	public void save(Order o);
	
	public void delete(Order o);
	
	public Order findById(Long id);
	
	public Order findByNum(String OrderNum);
	
	public PageBean<Order> queryByPage(User user,int now,int size,SearchPojo searchPojo);
		
		
	
}
