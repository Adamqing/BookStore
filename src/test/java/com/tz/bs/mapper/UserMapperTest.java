package com.tz.bs.mapper;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tz.bs.entity.User;
import com.tz.bs.mapper.UserMapper;
import com.tz.bs.util.MyBatiesUtil;

public class UserMapperTest {
	SqlSession session;
	UserMapper um;

	@Before
	public void setup() {
		session = MyBatiesUtil.sqlSession();
		um = session.getMapper(UserMapper.class);
	}

	@After
	public void tearDown() {
		session.commit();
		MyBatiesUtil.close(session);
	}

	@Test
	public void testSelectUser() {
		System.out.println(um.selectUser(1L));
	}
	@Test
	public void testSelectUserByName() {
		System.out.println(um.selectUserByUserName("alex"));
	}


	@Test
	public void testInsertUser() {
		User user = new User();
		user.setUserName("alex");
		user.setCompany("22");
		user.setEmail("23333");
		user.setPassword("123456");
		user.setPhone("112");
		um.insertUser(user);
		System.out.println(user);

	}

	@Test
	public void testUpdateUser() {
		User user = new User();
		user.setUserid(1L);
		user.setPhone("911");
		um.updateUser(user);
		System.out.println(user);
		System.out.println(um.selectUser(1L));
	}

}
