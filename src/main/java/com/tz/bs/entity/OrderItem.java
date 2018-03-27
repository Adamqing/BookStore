package com.tz.bs.entity;


import lombok.Data;

@Data
public class OrderItem {
	private Long itemId;
	private String book_isbn;
	private String book_name;
	private String book_author;
	private Integer count;
	private Double unit_price;
	private Double allPrice;
	private String book_url;
	private Order order;
	
	
	public Double getAllPrice() {
		allPrice=Math.ceil(unit_price*count*100)/100;
		return allPrice;
	}
	
	
	
}
