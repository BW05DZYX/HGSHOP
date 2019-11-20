package com.zhaoyuxi.hgshop.test;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Spec;
import com.zhaoyuxi.hgshop.goods.entity.SpecOption;
import com.zhaoyuxi.hgshop.goods.service.SpecService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 下午7:14:25
*规格测试类
*/
@ContextConfiguration("classpath:spring-mvc.xml")
@RunWith(SpringRunner.class)
public class SpecTest {

	@Reference
	private SpecService specService;
	
	@Test
	public void selectSpecAllTest() {
		PageInfo<Spec> page=specService.selectSpecsAll("", 1,10);
		System.out.println(page);
	}
	
	@Test
	public void insertOptionTest() {
		SpecOption option=new SpecOption();
		option.setSpecId(1);
		specService.insertSpecOption(option);
	}
}
