package com.tz.bs.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tz.bs.entity.OrderItem;

public class MemoryCart implements ShoppingCart {
	private Map<String, OrderItem> items = new HashMap<>();

	
	

	@Override
	public void addCart(OrderItem item) {
		
		OrderItem old=items.get(item.getBook_isbn());
		if(old==null){
			items.put(item.getBook_isbn(), item);
		}else{
			old.setCount(old.getCount()+item.getCount());
			
		}
		
	}

	@Override
	public void clear() {
		
		items = new HashMap<>();
	}

	@Override
	public void modifyCount(String isbn, int count) {
		if(items.get(isbn)!=null){
			items.get(isbn).setCount(count);
		}
	}

	@Override
	public void delete(String isbn) {
		
		items.remove(isbn);
	}

	@Override
	public double getTotal() {
		double total = 0;
		for (String key : items.keySet()) {
			total += items.get(key).getAllPrice();

		}
		return total;
	}

	@Override
	public int getCount() {
		return items.size();
	}

	
	/**
	 * 参数方便 后续拓展,目前无用
	 */
	@Override
	public List<OrderItem> getCart(int pageNow, int pageSize) {
		List<OrderItem> order = new ArrayList<>(items.values());
//		int now = 0;
//		int begin = (pageNow - 1) * (pageSize);
//		int end = pageNow * pageSize;
//
//		for (String key : items.keySet()) {
//			if (now >= begin && now < end) {
//				order.add(items.get(key));
//			}
//			now++;
//		}

		return order;
	}
	
	@Override
	public List<OrderItem> getCart() {
		List<OrderItem> order = new ArrayList<>(items.values());
		return order;
	}

}
