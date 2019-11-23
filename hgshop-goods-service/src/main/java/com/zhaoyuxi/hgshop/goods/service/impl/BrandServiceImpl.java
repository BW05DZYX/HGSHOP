package com.zhaoyuxi.hgshop.goods.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.dao.BrandMapper;
import com.zhaoyuxi.hgshop.goods.entity.Brand;
import com.zhaoyuxi.hgshop.goods.service.BrandService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月15日 下午4:14:50
*品牌业务层
*/
@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandMapper brandMapper;
	
	@Override
	public int insertBrand(Brand brand) {
		return brandMapper.insertBrand(brand);
	}
	
	@Override
	public int updateBrand(Brand brand) {
		return brandMapper.updateBrand(brand);
	}

	@Override
	public int deleteBrands(Integer[] ids) {
		return brandMapper.deleteBrands(ids);
	}


	@Override
	public Brand selectBrandById(int id) {
		return brandMapper.selectBrandById(id);
	}

	@Override
	public PageInfo<Brand> selectBrandsAll(Brand brand,int pageNum,int pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		return new PageInfo<Brand>(brandMapper.selectBrandsAll(brand));
	}

	@Override
	public List<Brand> selectBrands() {
		return brandMapper.selectBrands();
	}

}
