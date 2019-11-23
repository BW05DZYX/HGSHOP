package com.zhaoyuxi.hgshop.goods.service.impl;


import java.util.Date;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.dao.SkuMapper;
import com.zhaoyuxi.hgshop.goods.entity.Sku;
import com.zhaoyuxi.hgshop.goods.entity.SkuSpeOpt;
import com.zhaoyuxi.hgshop.goods.service.SkuService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月22日 上午10:29:05
*sku服务层
*/
@Service
public class SkuServiceImpl implements SkuService {

	@Autowired
	private SkuMapper skuMapper;
	
	@Override
	public int insertSku(Sku sku) {
		sku.setCreateTime(new Date());
		sku.setUpdateTime(new Date());
		int res=skuMapper.insertSku(sku);
		int id=skuMapper.selectSkuByTitle(sku.getTitle()).getId();
		if(sku.getSkuSpeOpts()!=null) {
			for(SkuSpeOpt skuSpeOpt: sku.getSkuSpeOpts()) {
				if(skuSpeOpt.getSpecId()!=0 && skuSpeOpt.getSpecOptionId()!=0) {
					skuSpeOpt.setSkuId(id);
					skuMapper.insertSkuSpeOpt(skuSpeOpt);
				}
			}
		}
		return res;
	}

	@Override
	public int deleteSku(Integer[] ids) {
		skuMapper.deleteSkuSpeOptById(ids);
		return skuMapper.deleteSku(ids);
	}

	@Override
	public int updateSku(Sku sku) {
		sku.setUpdateTime(new Date());
		skuMapper.deleteSkuSpeOptById(new Integer[] {sku.getId()});
		int res = skuMapper.updateSku(sku);
		if(sku.getSkuSpeOpts()!=null) {
			for(SkuSpeOpt skuSpeOpt: sku.getSkuSpeOpts()) {
				if(skuSpeOpt.getSpecId()!=0 && skuSpeOpt.getSpecOptionId()!=0) {
					skuSpeOpt.setSkuId(sku.getId());
					skuMapper.insertSkuSpeOpt(skuSpeOpt);
				}
			}
		}
		return res;
	}

	@Override
	public PageInfo<Sku> selectSkusAll(String title, String caption, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<Sku>(skuMapper.selectSkusAll(title, caption));
	}

	@Override
	public Sku selectSkuById(int id) {
		return skuMapper.selectSkuById(id);
	}

}
