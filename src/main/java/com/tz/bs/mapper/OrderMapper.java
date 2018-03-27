package com.tz.bs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tz.bs.entity.Order;
import com.tz.bs.entity.SearchPojo;


public interface OrderMapper {
	Order selectOrderByID(Long id);
	
	Integer insertOrder(Order o);
	
	Integer updateOrder(Order o);
	
	List<Order> selectOrderPageByUserID(@Param("uid")Long uid,@Param("pageNow")int pageNow,@Param("pageSize")int pageSize,@Param("search")SearchPojo search);
	
	Integer deleteOrderByID(Long oid);
	
	Integer countOrderByUserIDAndSearch(@Param("uid")Long uid,@Param("search")SearchPojo search);
	
	Order selectOrderByOrderNum(String orderNum);
	
}
