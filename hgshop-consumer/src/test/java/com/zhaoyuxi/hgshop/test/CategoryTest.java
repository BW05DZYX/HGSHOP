package com.zhaoyuxi.hgshop.test;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.zhaoyuxi.hgshop.goods.entity.Category;
import com.zhaoyuxi.hgshop.goods.service.CategoryService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 上午10:05:46
*分类测试类
*/
@ContextConfiguration("classpath:spring-mvc.xml")
@RunWith(SpringRunner.class)
public class CategoryTest {

	@Reference
	private CategoryService categoryService;
	
	@Test
	public void selectCategorysTest() {
		List<Category> list=categoryService.selectCategorysAll();
	}
	
}
