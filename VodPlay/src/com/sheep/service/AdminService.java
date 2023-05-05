package com.sheep.service;

import java.util.List;

import com.sheep.pojo.Admin;
import com.sheep.pojo.Movie;

public interface AdminService {

	public Admin adminLogin(Admin admin);

	public List<Movie> getMovieBySlider();

	public List<Admin> getAdminList();

	public void addAdmin(Admin admin);

	public void changeAuth(Admin admin);

	public Admin getAdminById(Admin admin);

	public void updateAuth(Admin admin);
	
}
