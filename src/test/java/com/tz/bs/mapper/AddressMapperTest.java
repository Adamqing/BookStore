package com.tz.bs.mapper;


import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.User;
import com.tz.bs.mapper.AddressMapper;
import com.tz.bs.util.MyBatiesUtil;

public class AddressMapperTest {

	SqlSession session;
	AddressMapper am;
	@Before
	public void setup(){
		session=MyBatiesUtil.sqlSession();
		am=session.getMapper(AddressMapper.class);
	}
	@After
	public void tearDown(){
		session.commit();
		MyBatiesUtil.close(session);
	}
	
	@Test
	public void testSelectAddrByID() {
		System.out.println(am.selectAddrByID(1L));
	}

	@Test
	public void testDeleteAddr() {
		am.deleteAddr(1L);
		
		System.out.println(am.selectAddrByID(1L));
	}

	@Test
	public void testSelectAddrsByUserID() {
		am.selectAddrsByUserID(1L).forEach(System.out::println);
	}

	@Test
	public void testInsertAddr() {
		User u=new User();
		u.setUserid(1L);
		Address a=new Address();
		a.setUser(u);
		a.setArea("地球2");
		a.setDetailaddress("地球村2");
		a.setEmailcode("215000");
		a.setIsDefault('0');
		a.setReciver("alex");
		a.setTel("119");
		
		for(int i=0;i<10;i++){
			am.insertAddr(a);
		}
		
		System.out.println(a);
	}

	@Test
	public void testUpdateAddr() {
		User u=new User();
		u.setUserid(1L);
		Address a=new Address();
		a.setAddressid(1L);
		
		a.setDetailaddress("火星");
		
		
		a.setTel("110");
		am.updateAddr(a);
		System.out.println(a);
		
	}

}
