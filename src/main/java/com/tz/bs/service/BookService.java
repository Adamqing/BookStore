package com.tz.bs.service;

import java.util.List;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;
import com.tz.bs.util.PageBean;

public interface BookService {
	public PageBean<Book> queryByCondition(Integer now,Integer size,Long cate,String name);
	public Book queryById(Long id);
	List<Category> getAllCategories();
}
