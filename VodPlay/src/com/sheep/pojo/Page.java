package com.sheep.pojo;

import java.io.Serializable;

public class Page implements Serializable{
	/**
	 * 每页显示条数
	 */
	private int pageSize = 6;
	/**
	 * 当前页
	 */
	private int currentPage;
	/**
	 * 总页数
	 */
	private int totalPage;
	/**
	 * 总记录数
	 */
	private int totalRecords;
	
	/**
	 * limit起始位置
	 */
	private int startLimitPos;

	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		this.currentPage = this.currentPage>= this.getTotalPage()?this.getTotalPage():this.currentPage;
		this.currentPage = this.currentPage<=1?1:this.currentPage;
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		if(getTotalRecords()==0) {
			return 0;
		}
		this.totalPage = (getTotalRecords()+getPageSize()-1)/getPageSize();
		
		return totalPage;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getStartLimitPos() {
		return (getCurrentPage()-1)*getPageSize();
	}

}
