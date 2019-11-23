package com.zhaoyuxi.hgshop.goods.dao;

import java.util.List;

import com.zhaoyuxi.hgshop.goods.entity.Category;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月19日 上午8:59:53 类功能说明
 */
public interface CategoryMapper {
	// 添加分类
	public int insertCategory(Category category);

	// 修改分类
	public int updateCategory(Category category);

	// 删除分类
	public int deleteCategory(int id);

	// 查询分类
	public List<Category> selectCategorysAll();
}
