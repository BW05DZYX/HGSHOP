package com.zhaoyuxi.hgshop.goods.service.impl;


import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.dao.SpecMapper;
import com.zhaoyuxi.hgshop.goods.entity.Spec;
import com.zhaoyuxi.hgshop.goods.entity.SpecOption;
import com.zhaoyuxi.hgshop.goods.service.SpecService;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 下午6:41:10
*规格业务层
*/
@Service
public class SpecServiceImpl implements SpecService {

	@Autowired
	private SpecMapper specMapper;
	
	@Override
	public int insertSpec(Spec spec,SpecOption specOption) {
		int res=specMapper.insertSpec(spec);
		specOption.setSpecId(specMapper.selectSpecByName(spec.getSpecName()).getId());
		if(specOption.getSpecId()!=0) {
			specMapper.deleteSpecOption(specOption.getSpecId());
			if(specOption.getOptionNames()!=null) {
				specMapper.insertSpecOption(specOption);
			}
		}else {
			
			res=0;
		}
		
		return res;
	}

	@Override
	public int insertSpecOption(SpecOption specOption) {
		int res=specMapper.deleteSpecOption(specOption.getSpecId());
		if(specOption.getOptionNames()!=null) {
			specMapper.insertSpecOption(specOption);
		}
		return res;
	}

	@Override
	public int updateSpec(Spec spec,SpecOption specOption) {
		specMapper.updateSpec(spec);
		specOption.setSpecId(spec.getId());
		int res=specMapper.deleteSpecOption(specOption.getSpecId());
		if(specOption.getOptionNames()!=null) {
			specMapper.insertSpecOption(specOption);
		}
		return res;
	}

	@Override
	public int deleteSpec(Integer[] ids) {
		int deleteSpec = specMapper.deleteSpec(ids);
		for(Integer id:ids) {
			specMapper.deleteSpecOption(id);
		}
		
		return deleteSpec;
	}


	@Override
	public Spec selectSpecById(int id) {
		return specMapper.selectSpecById(id);
	}

	@Override
	public PageInfo<Spec> selectSpecsAll(String specName, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		return new PageInfo<Spec>(specMapper.selectSpecsAll(specName));
	}

	@Override
	public List<SpecOption> selectSpecOptionsAll(Integer specId) {
		return specMapper.selectSpecOptionsAll(specId);
	}

}
