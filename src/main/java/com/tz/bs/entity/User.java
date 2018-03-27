package com.tz.bs.entity;


import lombok.Data;

@Data
public class User {
	private Long userid;
	private String userName;
	private String password;
	private String phone;
	private String email;
	private String company;
}
