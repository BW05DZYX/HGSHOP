package com.zhaoyuxi.hgshop.goods.service;



import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Brand;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月15日 下午4:10:04 品牌服务接口
 */
public interface BrandService {

	// 添加品牌
	public int insertBrand(Brand brand);

	// 修改品牌
	public int updateBrand(Brand brand);

	// 删除品牌
	public int deleteBrands(Integer[] ids);

	// 根据id查询单个品牌
	public Brand selectBrandById(int id);

	// 查询所有品牌
	public PageInfo<Brand> selectBrandsAll(Brand brand, int pageNum, int pageSize);
	
	//查询所有品牌返回集合
	public List<Brand> selectBrands();
}
