package com.zhaoyuxi.hgshop.goods.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Spu;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月20日 下午2:31:19
*spu服务接口
*/
public interface SpuService {
	
	//添加spu
	public int insertSpu(Spu spu);
	//修改spu
	public int updateSpu(Spu spu);
	//删除spu
	public int deleteSpu(Integer[] ids);
	//查询所有spu带模糊分页
	public PageInfo<Spu> selectSpusAll(String goodsName,String caption,int pageNum,int pageSize);
	//查询单个spu
	public Spu selectSpuById(int id);
	//查询所有spu信息
	public List<Spu> selectSpus();
}
