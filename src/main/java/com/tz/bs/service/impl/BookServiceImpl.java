package com.tz.bs.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;
import com.tz.bs.mapper.BookMapper;
import com.tz.bs.service.BookService;
import com.tz.bs.util.MyBatiesUtil;
import com.tz.bs.util.PageBean;

public class BookServiceImpl implements BookService {
	SqlSession session=MyBatiesUtil.sqlSession();
	BookMapper bk=session.getMapper(BookMapper.class);
	@Override
	public PageBean<Book> queryByCondition(Integer now, Integer size, Long cate,String name) {
		PageBean<Book> pb=new PageBean<>();
		pb.setPageNow(now);
		pb.setPageSize(size);
		pb.setPageDatas(bk.selectBooksbyCondition(now, size, cate,name));
		pb.setTotalRecords(bk.rowCount(cate));
		return pb;
	}

	@Override
	public Book queryById(Long id) {
		return bk.selectBookById(id);
	}

	@Override
	public List<Category> getAllCategories() {
		
		return bk.selectCategory();
	}

}
