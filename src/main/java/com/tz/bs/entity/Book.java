package com.tz.bs.entity;

import java.util.Date;

import lombok.Data;


@Data
public class Book {
	private Long bookid;
	private String isbn;
	private String name;
	private String author;
	private String publishHouse;
	private Date publishDate;
	private Double oldPrice;
	private Double newPrice;
	private String authorLoc;
	private String info;
	private String imageurl;
	private String suit;
	private Category category;
}
