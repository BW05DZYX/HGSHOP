package com.zhaoyuxi.hgshop.controller;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Brand;
import com.zhaoyuxi.hgshop.goods.service.BrandService;
import com.zhaoyuxi.hgshop.util.PageUtil;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月15日 下午4:28:12
*品牌控制层
*/
@Controller
@RequestMapping("brand")
public class BrandController {

	@Reference
	private BrandService brandService;
	
	/**
	 * 去品牌管理页面，包括分页，模糊
	 * @param model
	 * @param brand
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("tobrand")
	public String toBrand(Model model,Brand brand,@RequestParam(defaultValue = "1")int pageNum,@RequestParam(defaultValue = "3")int pageSize) {
		//调用方法获取结果
		PageInfo<Brand> brandsAllPage=brandService.selectBrandsAll(brand,pageNum,pageSize);
		//保存分页信息
		String page = PageUtil.page(pageNum, brandsAllPage.getPages(), "/brand/tobrand", 3);
		//保存所需的变量
		model.addAttribute("brandsPage",brandsAllPage);
		model.addAttribute("page", page);
		//返回页面
		return "/admin/brand/brand_list";
	}
	
	/**
	 * 添加品牌信息（1 成功 0 失败）
	 * @param brand
	 * @return
	 */
	@PostMapping("brandInsert")
	@ResponseBody
	public Integer brandInsert(Brand brand) {
		return brandService.insertBrand(brand);
	}
	
	/**
	 * 修改品牌信息（1 成功 0 失败）
	 * @param brand
	 * @return
	 */
	@PostMapping("brandUpdate")
	@ResponseBody
	public Integer brandUpdate(Brand brand) {
		return brandService.updateBrand(brand);
	}
	
	/**
	 * 查看品牌信息
	 * @param id
	 * @return
	 */
	@PostMapping("brandLook")
	@ResponseBody
	public Brand brandLook(int id) {
		return brandService.selectBrandById(id);
	}
	
	@PostMapping("brandDelete")
	@ResponseBody
	public Integer brandDelete(Integer[] ids) {
		return brandService.deleteBrands(ids);
	}
	
	/**
	 * 获取所有的分类
	 * @return
	 */
	@PostMapping("brandSelect")
	@ResponseBody
	public List<Brand> brandSelect(){
		return brandService.selectBrands();
	}
}
