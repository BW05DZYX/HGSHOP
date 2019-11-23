package com.zhaoyuxi.hgshop.goods.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.dao.SpuMapper;
import com.zhaoyuxi.hgshop.goods.entity.Spu;
import com.zhaoyuxi.hgshop.goods.service.SpuService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月20日 下午3:54:25
*spu业务层
*/
@Service
public class SpuServiceImpl implements SpuService {

	@Autowired
	private SpuMapper spuMapper;
	
	@Override
	public int insertSpu(Spu spu) {
		return spuMapper.insertSpu(spu);
	}

	@Override
	public int updateSpu(Spu spu) {
		return spuMapper.updateSpu(spu);
	}

	@Override
	public int deleteSpu(Integer[] ids) {
		return spuMapper.deleteSpu(ids);
	}

	@Override
	public PageInfo<Spu> selectSpusAll(String goodsName, String caption, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<Spu>(spuMapper.selectSpusAll(goodsName, caption));
	}

	@Override
	public Spu selectSpuById(int id) {
		return spuMapper.selectSpuById(id);
	}

	@Override
	public List<Spu> selectSpus() {
		return spuMapper.selectSpus();
	}

}
