package com.zhaoyuxi.hgshop.goods.service;


import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Spec;
import com.zhaoyuxi.hgshop.goods.entity.SpecOption;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 下午3:10:56
*规格业务层接口
*/
public interface SpecService {
	//添加规格
	public int insertSpec(Spec spec);
	//添加规格选项
	public int insertSpecOption(SpecOption specOption);
	//修改规格
	public int updateSpec(Spec spec);
	//删除规格
	public int deleteSpec(String ids[]); 
	//删除规格选项
	public int deleteSpecOption(String id);
	//查询单个规格
	public Spec selectSpecById(String id);
	//查询所有规格
	public PageInfo<Spec> selectSpecsAll(String name,int pageNum,int pageSize);
}
