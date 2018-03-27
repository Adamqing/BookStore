package com.tz.bs.entity;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Order {
	private Long orderId;
	private String orderNum;
	private Date createDate;
	private List<OrderItem> items;
	private User user;
	private OrderStatus orderStatus;
	private Address address;
	private Double total;
	
}
