package com.tz.bs.service.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.Order;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.mapper.ItemMapper;
import com.tz.bs.mapper.OrderMapper;
import com.tz.bs.service.OrderService;
import com.tz.bs.util.MyBatiesUtil;
import com.tz.bs.util.PageBean;

public class OrderServiceImpl implements OrderService {
	SqlSession session = MyBatiesUtil.sqlSession();
	OrderMapper orderMapper = session.getMapper(OrderMapper.class);
	ItemMapper ItemMapper = session.getMapper(ItemMapper.class);
	@Override
	public void save(Order o) {
		orderMapper.insertOrder(o);
		ItemMapper.insertItemBitch(o.getItems());
		session.commit();
	}

	@Override
	public void delete(Order o) {
		ItemMapper.deleteItemsByOrderID(o.getOrderId());
		orderMapper.deleteOrderByID(o.getOrderId());
		session.commit();
	}

	@Override
	public Order findById(Long id) {
		
		return orderMapper.selectOrderByID(id);
	}

	@Override
	public Order findByNum(String orderNum) {
		return orderMapper.selectOrderByOrderNum(orderNum);
	}

	@Override
	public PageBean<Order> queryByPage(User user, int now, int size,SearchPojo search) {
		PageBean<Order> pageBean=new PageBean<>();
		List<Order> orders=orderMapper.selectOrderPageByUserID(user.getUserid(), now, size,search);
		pageBean.setPageNow(now);
		pageBean.setPageSize(size);
		pageBean.setPageDatas(orders);
		pageBean.setTotalRecords(orderMapper.countOrderByUserIDAndSearch(user.getUserid(),search));
		
		return pageBean;
	}

}
