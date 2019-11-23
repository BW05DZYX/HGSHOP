package com.zhaoyuxi.hgshop.goods.service;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Sku;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月22日 上午9:08:15 SKU服务接口
 */
public interface SkuService {
	// 添加sku
	public int insertSku(Sku sku);

	// 删除sku
	public int deleteSku(Integer[] ids);

	// 修改sku
	public int updateSku(Sku sku);

	// 查询所有sku内容
	public PageInfo<Sku> selectSkusAll(String title, String caption, int pageNum, int pageSize);

	// 根据id查询sku内容
	public Sku selectSkuById(int id);
	
}
