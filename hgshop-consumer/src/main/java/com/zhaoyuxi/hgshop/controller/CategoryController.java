package com.zhaoyuxi.hgshop.controller;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhaoyuxi.hgshop.goods.entity.Category;
import com.zhaoyuxi.hgshop.goods.service.CategoryService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月18日 下午7:32:04
*分类控制层
*/
@Controller
@RequestMapping("category")
public class CategoryController {

	@Reference
	private CategoryService categoryService;
	
	/**
	 * 去分类管理页面
	 * @return
	 */
	@GetMapping("tocategory")
	public String  toCategory() {
		return "/admin/category/category_list";
	}
	
	/**
	 * 查询所有的分类并返回数据
	 * @return
	 */
	@PostMapping("getcategorys")
	@ResponseBody
	public List<Category> getCategorys(){
		return categoryService.selectCategorysAll();
	}
	
	/**
	 * 添加分类数据
	 * @param category
	 * @return
	 */
	@PostMapping("addcategory")
	@ResponseBody
	public Integer addCategory(Category category) {
		return categoryService.insertCategory(category);
	}
	
	/**
	 * 修改分类数据
	 * @param category
	 * @return
	 */
	@PostMapping("upcategory")
	@ResponseBody
	public Integer upCategory(Category category) {
		return categoryService.updateCategory(category);
	}
	
	/**
	 * 删除分类数据
	 * @param id
	 * @return
	 */
	@PostMapping("delcategory")
	@ResponseBody
	public Integer delCategory(int id) {
		return categoryService.deleteCategory(id);
	}
}
