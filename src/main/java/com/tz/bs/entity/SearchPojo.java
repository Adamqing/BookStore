package com.tz.bs.entity;

import java.util.Date;

import lombok.Data;

@Data
public class SearchPojo {
	private String orderNum;
	private Date beginDate;
	private Date endDate;
	private Integer isOrderByTime;
	private OrderStatus orderStatus;
}
