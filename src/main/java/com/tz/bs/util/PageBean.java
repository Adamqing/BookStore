package com.tz.bs.util;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	private int pageNow = 1; // 需要显示的页码
	private int totalPages = 1; // 总页数
	private int pageSize = 5; // 每页记录数
	private int totalRecords = 0; // 总记录数
	private boolean isHavePrePage = false; // 是否有上一页
	private boolean isHaveNextPage = false; // 是否有下一页

	private List<T> pageDatas = new ArrayList<T>();

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		if (totalRecords < 0) {
			throw new RuntimeException("总记录数不能小于0!");
		}
		//设置总记录数
		this.totalRecords = totalRecords;
		//计算总页数
		this.totalPages = this.totalRecords / this.pageSize;
		if (this.totalRecords % this.pageSize != 0) {
			this.totalPages++;
		}
		//计算是否有上一页
		if (this.pageNow > 1) {
			this.isHavePrePage = true;
		} else {
			this.isHavePrePage = false;
		}
		//计算是否有下一页
		if (this.pageNow < this.totalPages) {
			this.isHaveNextPage = true;
		} else {
			this.isHaveNextPage = false;
		}
	}

	public List<T> getPageDatas() {
		return pageDatas;
	}

	public void setPageDatas(List<T> pageDatas) {
		this.pageDatas = pageDatas;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public boolean getIsHavePrePage() {
		return isHavePrePage;
	}

	public boolean getIsHaveNextPage() {
		return isHaveNextPage;
	}
}
