package com.tz.bs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;

public interface BookMapper {
	Book selectBookById(Long ID);
	
	List<Book> selectAllBooks();

	List<Book> selectBooksbyCondition(@Param("pageNow") Integer pageNow, @Param("pageSize") Integer pageSize,@Param("cate")Long cate,@Param("str")String name);
	
	
	Integer rowCount(@Param("cate")Long cate);
	
	List<Category> selectCategory();
}
