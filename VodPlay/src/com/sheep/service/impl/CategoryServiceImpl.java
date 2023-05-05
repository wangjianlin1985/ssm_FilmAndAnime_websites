package com.sheep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sheep.dao.CategoryMapper;
import com.sheep.pojo.Category;
import com.sheep.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	@Override
	public List<Category> getCategorys() {
		
		return categoryMapper.selectCategorys();
	}

}
