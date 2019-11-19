package com.zhaoyuxi.hgshop.controller;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhaoyuxi.hgshop.user.entity.User;
import com.zhaoyuxi.hgshop.user.service.UserService;


/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月14日 下午1:23:22 类功能说明
 */
@Controller
@RequestMapping("user")
public class UserController {

	@Reference
	private UserService userService;
	
	/**
	 * 去登录页面
	 * @return
	 */
	@GetMapping("tologin")
	public String tologin() {
		return "/user/login_admin";
	}
	
	/**
	 * 去管理首页
	 * @param user
	 * @return
	 */
	@RequestMapping("adminIndex")
	@ResponseBody
	public boolean register(User user) {
		//查看用户名密码是否正确
		User userV = userService.searchByUnameAndPwd(user);
		boolean b=false;
		if(userV!=null) {
			b=true;
		}
		return b;
	}

	
}
