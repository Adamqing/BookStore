package com.tz.bs.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tz.bs.entity.OrderItem;
import com.tz.bs.mapper.ItemMapper;
import com.tz.bs.util.MyBatiesUtil;

public class ItemMapperTest {
	SqlSession session;
	ItemMapper im;

	@Before
	public void setup() {
		session = MyBatiesUtil.sqlSession();
		im = session.getMapper(ItemMapper.class);
	}

	@After
	public void tearDown() {
		session.commit();
		MyBatiesUtil.close(session);
	}

	@Test
	public void testSelectItemByID() {
		System.out.println(im.selectItemByID(4L));
	}

	@Test
	public void testSelectItemByOrderID() {
		im.selectItemByOrderID(2L).forEach(System.out::println);
	}

	@Test
	public void testInsertItem() {
		OrderItem item=new OrderItem();
		item.setUnit_price(10D);
		item.setAllPrice(20D);
		item.setBook_author("alex");
		item.setBook_isbn("999");
		item.setBook_name("blues");
		item.setBook_url("default.jpg");
		item.setCount(2);
		im.insertItem(item, 2L);
		System.out.println(item);
		
	}
	
	@Test
	public void testInsertItemBitch() {
		
		
		
		List<OrderItem> items=new ArrayList<>();
		for(int i=0;i<99;i++){
			OrderItem item=new OrderItem();
			item.setUnit_price(10D);
			item.setAllPrice(20D);
			item.setBook_author("alex"+i);
			item.setBook_isbn("999");
			item.setBook_name("blues");
			item.setBook_url("default.jpg");
			item.setCount(2);
			items.add(item);
		}
		
		im.insertItemBitch(items);
		
		
	}
	
	@Test
	public void testDeleteItemsByOrderID() {
		im.deleteItemsByOrderID(2L);
		System.out.println(im.selectItemByID(3L));
	}

}
