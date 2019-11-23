package com.zhaoyuxi.hgshop.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhaoyuxi.hgshop.goods.entity.Sku;
import com.zhaoyuxi.hgshop.goods.entity.SkuSpeOpt;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月22日 上午9:20:47 类功能说明
 */
public interface SkuMapper {
	// 添加sku
	public int insertSku(Sku sku);

	// 添加sku规格
	public int insertSkuSpeOpt(SkuSpeOpt skuSpeOpt);

	// 删除sku
	public int deleteSku(@Param("ids") Integer[] ids);

	// 根据skuId删除规格
	public int deleteSkuSpeOptById(@Param("skuIds")Integer[] skuIds);

	// 修改sku
	public int updateSku(Sku sku);

	// 查询所有sku内容
	public List<Sku> selectSkusAll(@Param("title") String title, @Param("caption") String caption);

	// 根据id查询sku内容
	public Sku selectSkuById(int id);

	// 根据标题查询sku
	public Sku selectSkuByTitle(String title);
}
