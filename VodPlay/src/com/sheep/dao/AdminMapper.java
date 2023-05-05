package com.sheep.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sheep.pojo.Admin;

@Repository
public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

	Admin adminLogin(Admin admin);

	List<Admin> selectAdmin();
}