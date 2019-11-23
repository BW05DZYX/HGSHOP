package com.zhaoyuxi.hgshop.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhaoyuxi.hgshop.goods.entity.Spec;
import com.zhaoyuxi.hgshop.goods.entity.SpecOption;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月19日 下午4:09:39 类功能说明
 */
public interface SpecMapper {
	// 添加规格
	public int insertSpec(Spec spec);

	// 添加规格选项
	public int insertSpecOption(SpecOption specOption);

	// 修改规格
	public int updateSpec(Spec spec);

	// 删除规格
	public int deleteSpec(@Param("ids") Integer ids[]);

	// 删除规格选项
	public int deleteSpecOption(int specId);

	// 查询单个规格（通过id）
	public Spec selectSpecById(int id);

	// 查询单个规格（通过名称）
	public Spec selectSpecByName(String specName);

	// 查询所有规格
	public List<Spec> selectSpecsAll(@Param("specName") String specName);

	// 查询所有具体规格
	public List<SpecOption> selectSpecOptionsAll(@Param("specId") Integer specId);

	// 查询所有规格列表
	public List<Spec> selectSpecs();

	// 查询规格通过id
	public Spec getSpecList(int id);
}
