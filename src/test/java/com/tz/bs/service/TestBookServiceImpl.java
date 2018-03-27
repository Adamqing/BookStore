package com.tz.bs.service;

import org.junit.Test;

import com.tz.bs.entity.Book;
import com.tz.bs.util.BeanFactory;
import com.tz.bs.util.PageBean;

public class TestBookServiceImpl {
 private BookService bookService = (BookService) BeanFactory.getBean("bookService");
 
 @Test
 public void testqueryByCondition(){
	PageBean<Book> bk =  bookService.queryByCondition(1,2, 3L, "人");
	 System.out.println(bk);
	 
 }
 @Test 
 public void testqueryById(){
	System.out.println( bookService.queryById((long) 2));
	 
 }
 @Test
 public void testgetAllCategories(){
	 bookService.getAllCategories().forEach(System.out::println);
 }
}
