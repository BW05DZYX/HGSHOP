package com.zhaoyuxi.hgshop.user.service;

import java.util.List;

import com.zhaoyuxi.hgshop.user.entity.User;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月13日 下午7:31:11
*类功能说明
*/
public interface UserService {

	//添加用户
	public int insertUser(User user);
	//根据姓名密码查找用户
	public User searchByUnameAndPwd(User user);
	//根据用户名查找用户
	public User searchByUname(String username);
	//返回所有用户列表
	public List<User> selectUsersAll();
}
