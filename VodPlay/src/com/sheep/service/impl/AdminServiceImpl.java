package com.sheep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sheep.dao.AdminMapper;
import com.sheep.dao.MovieMapper;
import com.sheep.pojo.Admin;
import com.sheep.pojo.Movie;
import com.sheep.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private MovieMapper movieMapper;

	@Override
	public Admin adminLogin(Admin admin) {
		return this.adminMapper.adminLogin(admin);
	}

	@Override
	public List<Movie> getMovieBySlider() {
		return movieMapper.getMoviesBySlider();
	}

	@Override
	public List<Admin> getAdminList() {
		return this.adminMapper.selectAdmin();
	}

	@Override
	public void addAdmin(Admin admin) {
		this.adminMapper.insert(admin);
	}

	@Override
	public void changeAuth(Admin admin) {
		this.adminMapper.updateByPrimaryKeySelective(admin);
	}

	@Override
	public Admin getAdminById(Admin admin) {
		return this.adminMapper.selectByPrimaryKey(admin.getId());
	}

	@Override
	public void updateAuth(Admin admin) {
		this.adminMapper.updateByPrimaryKeySelective(admin);
	}
	
	
}
