package com.sheep.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QueryMVByCondition extends Page {
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startShowTime;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date endShowTime;
    
    private Integer startMovieYear;
    
    private Integer endMovieYear;

	public Date getStartShowTime() {
		return startShowTime;
	}

	public void setStartShowTime(Date startShowTime) {
		this.startShowTime = startShowTime;
	}

	public Date getEndShowTime() {
		return endShowTime;
	}

	public void setEndShowTime(Date endShowTime) {
		this.endShowTime = endShowTime;
	}

	public Integer getStartMovieYear() {
		return startMovieYear;
	}

	public void setStartMovieYear(Integer startMovieYear) {
		this.startMovieYear = startMovieYear;
	}

	public Integer getEndMovieYear() {
		return endMovieYear;
	}

	public void setEndMovieYear(Integer endMovieYear) {
		this.endMovieYear = endMovieYear;
	}
}

