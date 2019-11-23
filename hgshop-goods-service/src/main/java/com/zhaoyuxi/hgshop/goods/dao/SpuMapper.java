package com.zhaoyuxi.hgshop.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhaoyuxi.hgshop.goods.entity.Spu;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月20日 下午2:51:31
*supMapper层接口
*/
public interface SpuMapper {
		//添加spu
		public int insertSpu(Spu spu);
		//修改spu
		public int updateSpu(Spu spu);
		//删除spu
		public int deleteSpu(@Param("ids")Integer[] ids);
		//查询所有spu带模糊分页
		public List<Spu> selectSpusAll(@Param("goodsName")String goodsName,@Param("caption")String caption);
		//查询单个spu
		public Spu selectSpuById(int id);
		//查询所有spu信息
		public List<Spu> selectSpus();
}
