package com.zhaoyuxi.hgshop.goods.main;

import java.io.IOException;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月14日 下午3:00:19
*开始商品服务
*/
public class BeginGoodsService {
	public static void main(String[] args) throws IOException {
		//加载配置文件(启动服务)
		ClassPathXmlApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:applicationContext-dao.xml");
		//按任意键退出
		System.in.read();
	}
}
