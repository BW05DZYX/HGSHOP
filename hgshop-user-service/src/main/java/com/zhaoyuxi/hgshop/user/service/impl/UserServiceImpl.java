package com.zhaoyuxi.hgshop.user.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.zhaoyuxi.hgshop.user.dao.UserMapper;
import com.zhaoyuxi.hgshop.user.entity.User;
import com.zhaoyuxi.hgshop.user.service.UserService;
import com.zhaoyuxi.hgshop.user.util.Md5Utils;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月13日 下午8:00:01
*用户业务层
*/
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int insertUser(User user) {
		//对密码进行加密
		user.setPassword(Md5Utils.md5(user.getPassword()));
		return userMapper.insertUser(user);
	}

	@Override
	public User searchByUnameAndPwd(User user) {
		//对密码进行加密
		user.setPassword(Md5Utils.md5(user.getPassword()));
		return userMapper.searchByUnameAndPwd(user);
	}

	@Override
	public User searchByUname(String username) {
		return userMapper.searchByUname(username);
	}

	@Override
	public List<User> selectUsersAll() {
		return userMapper.selectUsersAll();
	}

}
