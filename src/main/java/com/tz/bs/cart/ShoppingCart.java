package com.tz.bs.cart;

import java.util.List;

import com.tz.bs.entity.OrderItem;

public interface ShoppingCart {
	// 添加购物车
	void addCart(OrderItem item);
	// 清空购物车
	void clear();
	// 修改数量
	void modifyCount(String isbn,int count);
	// 获取总价
	void delete(String isbn);
	// 获取购物车数量
	double getTotal();
	// 获取购物车数据
	int getCount();
	// 获取购物车商品详情
	List<OrderItem> getCart(int pageNow,int pageSize);
	List<OrderItem> getCart();
}
