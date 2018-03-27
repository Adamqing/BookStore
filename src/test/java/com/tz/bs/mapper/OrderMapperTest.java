package com.tz.bs.mapper;


import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.Order;
import com.tz.bs.entity.OrderStatus;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.mapper.OrderMapper;
import com.tz.bs.util.MyBatiesUtil;

public class OrderMapperTest {
	SqlSession session;
	OrderMapper om;

	@Before
	public void setup() {
		session = MyBatiesUtil.sqlSession();
		om = session.getMapper(OrderMapper.class);
	}

	@After
	public void tearDown() {
		session.commit();
		MyBatiesUtil.close(session);
	}
	@Test
	public void testSelectOrderByID() {
		System.out.println(om.selectOrderByID(2L));
	}
	@Test
	public void testSelectOrderByOrderNum() {
		System.out.println(om.selectOrderByOrderNum("1L"));
	}

	@Test
	public void testInsertOrder() {
		Order o=new Order();
		User u=new User();
		u.setUserid(1L);
		o.setUser(u);
		Address add=new Address();
		add.setAddressid(1L);
		o.setAddress(add);
		o.setCreateDate(new Date());
		o.setOrderNum("1L");
		o.setOrderStatus(OrderStatus.配送中);
		o.setTotal(100D);
		om.insertOrder(o);
		System.out.println(o);
	}

	@Test
	public void testUpdateOrder() {
		Order o=new Order();
		o.setOrderId(7L);
		o.setOrderStatus(OrderStatus.交易关闭);
		om.updateOrder(o);
		System.out.println(om.selectOrderByID(7L));
	}

	@Test
	public void testSelectOrderPageByUserID() {
		SearchPojo search=new SearchPojo();
		search.setOrderStatus(OrderStatus.等待发货);
		om.selectOrderPageByUserID(1L, 1, 2,search).forEach(System.out::println);
	}

	@Test
	public void testDeleteOrderByID() {
		om.deleteOrderByID(3L);
		om.selectOrderPageByUserID(1L, 1, 2,null).forEach(System.out::println);
	}

	@Test
	public void testCountOrderByUserID() {
		System.out.println(om.countOrderByUserIDAndSearch(1L,null));
	}

}
