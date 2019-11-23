package com.zhaoyuxi.hgshop.test;

import org.apache.dubbo.config.annotation.Reference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Spu;
import com.zhaoyuxi.hgshop.goods.service.SpuService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月20日 下午3:59:51
*类功能说明
*/
@ContextConfiguration("classpath:spring-mvc.xml")
@RunWith(SpringRunner.class)
public class SpuTest {

	@Reference
	private SpuService spuService;
	
	@Test
	public void selectTest() {
		PageInfo<Spu> pages=spuService.selectSpusAll("", "", 1, 3);
		System.out.println(pages);
	}
	
}
