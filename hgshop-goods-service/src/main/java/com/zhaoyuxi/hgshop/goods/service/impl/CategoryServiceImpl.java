package com.zhaoyuxi.hgshop.goods.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.zhaoyuxi.hgshop.goods.dao.CategoryMapper;
import com.zhaoyuxi.hgshop.goods.entity.Category;
import com.zhaoyuxi.hgshop.goods.service.CategoryService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 上午10:02:32
*分类业务层
*/
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryMapper categoryMapper;
	
	@Override
	public int insertCategory(Category category) {
		return categoryMapper.insertCategory(category);
	}

	@Override
	public int updateCategory(Category category) {
		return categoryMapper.updateCategory(category);
	}

	@Override
	public int deleteCategory(String id) {
		return categoryMapper.deleteCategory(id);
	}

	@Override
	public List<Category> selectCategorysAll() {
		return categoryMapper.selectCategorysAll();
	}

}
