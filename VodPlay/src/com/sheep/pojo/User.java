package com.sheep.pojo;

import java.io.Serializable;
import java.util.Date;


public class User implements Serializable{
	
	private Long id;
	private String userName;
	private String userPassword;
	private String userNickname;
	private String userPrice;
	private Date registerDate;
	private String phone;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserPrice() {
		return userPrice;
	}
	public void setUserPrice(String userPrice) {
		this.userPrice = userPrice;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getUserPriceUrl() {
		
		return "pictureUrl?url=E:/myvod/img/"+userName+"/"+userName+userPrice;
	}
	
}
