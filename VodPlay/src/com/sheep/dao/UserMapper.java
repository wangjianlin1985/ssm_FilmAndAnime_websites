package com.sheep.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sheep.pojo.User;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);
    
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectByUserNameAndPass(User user);
    
    User selectByUserName(User user);
    
    int findUserByUserName(String userName);
    
    int updateByPrimaryNameSelective(User user);

	List<User> getUsers();
}