package com.tz.bs.mapper;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tz.bs.mapper.BookMapper;
import com.tz.bs.util.MyBatiesUtil;

public class BookMapperTest {
	SqlSession session;
	BookMapper bk;
	@Before
	public void setup(){
		session=MyBatiesUtil.sqlSession();
		bk=session.getMapper(BookMapper.class);
	}
	@After
	public void tearDown(){
		
		MyBatiesUtil.close(session);
	}
	@Test
	public void testSelectBookById() {
			System.out.println(bk.selectBookById(1L));
	}

	@Test
	public void testSelectAllBooks() {
		bk.selectAllBooks().forEach(System.out::println);
	}

	@Test
	public void testSelectBooksbyCondition() {
		bk.selectBooksbyCondition(1,2,null,"北").forEach(System.out::println);
	}
	@Test
	public void testRowCount() {
		System.out.println(bk.rowCount(null));
	}
	@Test
	public void testSelectAllCategory() {
		bk.selectCategory().forEach(System.out::println);
	}

}
