package com.sheep.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sheep.pojo.Category;

@Repository
public interface CategoryMapper {
	
    int deleteByPrimaryKey(Long id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
    List<Category> selectCategorys();
    
}