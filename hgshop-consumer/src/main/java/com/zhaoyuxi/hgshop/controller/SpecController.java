package com.zhaoyuxi.hgshop.controller;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Spec;
import com.zhaoyuxi.hgshop.goods.entity.SpecOption;
import com.zhaoyuxi.hgshop.goods.service.SpecService;
import com.zhaoyuxi.hgshop.util.PageUtil;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 下午7:30:41
*规格控制层
*/
@Controller
@RequestMapping("spec")
public class SpecController {

	@Reference
	private SpecService specService;
	
	/**
	 * 返回列表信息（分页，模糊）
	 * @param model
	 * @param specName
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("tospec")
	public String toSpec(Model model,@RequestParam(defaultValue = "")String specName,@RequestParam(defaultValue = "1")int pageNum,@RequestParam(defaultValue = "3")int pageSize) {
		PageInfo<Spec> specsPage=specService.selectSpecsAll(specName, pageNum, pageSize);
		String page=PageUtil.page(pageNum, specsPage.getPages(), "/spec/tospec?specName="+specName, 2);
		model.addAttribute("page", page);
		model.addAttribute("specsPage", specsPage);
		return "/admin/spec/spec_list";
	}
	
	/**
	 * 添加规格
	 * @param spec
	 * @param specOption
	 * @return
	 */
	@PostMapping("insertspec")
	@ResponseBody
	public Integer insertSpec(Spec spec,SpecOption specOption) {
		return specService.insertSpec(spec, specOption);
	}
	
	/**
	 * 修改规格
	 * @param spec
	 * @param specOption
	 * @return
	 */
	@PostMapping("updatespec")
	@ResponseBody
	public Integer updateSpec(Spec spec,SpecOption specOption) {
		return specService.updateSpec(spec, specOption);
	}
	
	/**
	 * 查看规格，也用于修改回显
	 * @param id
	 * @return
	 */
	@PostMapping("lookspec")
	@ResponseBody
	public Spec lookSpec(int id) {
		return specService.selectSpecById(id);
	}
	
	@PostMapping("getspec")
	@ResponseBody
	public Spec getSpec(int id) {
		return specService.getSpecList(id);
	}
	
	/**
	 * 删除规格，含批删
	 * @param ids
	 * @return
	 */
	@PostMapping("deletespec")
	@ResponseBody
	public Integer deleteSpec(Integer[] ids) {
		return specService.deleteSpec(ids);
	}
	
	/**
	 * 查询所有的规格名称
	 * @return
	 */
	@PostMapping("selectspeclist")
	@ResponseBody
	public List<Spec> selectSpecList(){
		return specService.selectSpecs();
	}
	
	/**
	 * 根据规格id查询所有规格选项
	 * @return
	 */
	@PostMapping("selectspop")
	@ResponseBody
	public List<SpecOption> selectSpOp(int specId){
		return specService.selectSpecOptionsAll(specId);
	}
	
}
