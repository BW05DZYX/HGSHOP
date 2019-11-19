package com.zhaoyuxi.hgshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月14日 下午7:08:51
*类功能说明
*/
@Controller
@RequestMapping("admin")
public class AdminController {
	
	@GetMapping("toadminIndex")
	public String toadminIndex() {
		return "/admin/index";
	}
	
}
