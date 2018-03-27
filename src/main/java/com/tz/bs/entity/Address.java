package com.tz.bs.entity;


import lombok.Data;

@Data
public class Address {
	private Long addressid;
	private String area;
	private String detailaddress;
	private String emailcode;
	private String reciver;
	private String tel;
	private Character isDefault;
	private User user;
}
