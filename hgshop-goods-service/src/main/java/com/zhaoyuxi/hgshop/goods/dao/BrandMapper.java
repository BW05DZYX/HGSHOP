package com.zhaoyuxi.hgshop.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhaoyuxi.hgshop.goods.entity.Brand;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月15日 下午4:15:17 品牌mapper层
 */
public interface BrandMapper {
	// 添加品牌
	public int insertBrand(Brand brand);

	// 修改品牌
	public int updateBrand(Brand brand);

	// 删除品牌
	public int deleteBrands(@Param("ids") Integer[] ids);

	// 根据id查询单个品牌
	public Brand selectBrandById(int id);

	// 查询所有品牌
	public List<Brand> selectBrandsAll(Brand brand);

	// 查询所有品牌返回集合
	public List<Brand> selectBrands();
}
