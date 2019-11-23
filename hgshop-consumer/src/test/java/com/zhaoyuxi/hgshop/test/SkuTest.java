package com.zhaoyuxi.hgshop.test;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Sku;
import com.zhaoyuxi.hgshop.goods.service.SkuService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月22日 上午10:49:46
*类功能说明
*/
@ContextConfiguration("classpath:spring-mvc.xml")
@RunWith(SpringRunner.class)
public class SkuTest {

	@Reference
	private SkuService skuService;
	
	@Test
	public void selectTest() {
		PageInfo<Sku> info = skuService.selectSkusAll(null, null, 1, 3);
		List<Sku> list=info.getList();
		list.forEach(o->System.out.println(o));
		
	}
}
