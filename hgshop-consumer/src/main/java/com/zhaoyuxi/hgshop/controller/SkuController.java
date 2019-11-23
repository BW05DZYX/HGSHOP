package com.zhaoyuxi.hgshop.controller;
/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月22日 下午1:11:17
*sku控制层
*/

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.pagehelper.PageInfo;
import com.zhaoyuxi.hgshop.goods.entity.Sku;
import com.zhaoyuxi.hgshop.goods.service.SkuService;
import com.zhaoyuxi.hgshop.util.PageUtil;

@Controller
@RequestMapping("sku")
public class SkuController {

	@Reference
	private SkuService skuService;

	
	/**
	 * 返回sku管理列表
	 * @param model
	 * @param title
	 * @param caption
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("tosku")
	public String toSku(Model model, @RequestParam(defaultValue = "") String title,
			@RequestParam(defaultValue = "") String caption, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "3") int pageSize) {
		PageInfo<Sku> skusPage = skuService.selectSkusAll(title, caption, pageNum, pageSize);
		String page = PageUtil.page(pageNum, skusPage.getPages(), "/sku/tosku/", 2);
		model.addAttribute("skusPage", skusPage);
		model.addAttribute("page", page);
		return "/admin/sku/sku_list";

	}
	
	/**
	 * 添加sku
	 * @param sku
	 * @return
	 */
	@PostMapping("insertsku")
	@ResponseBody
	public Integer insertSku(HttpServletRequest request,Sku sku,@RequestParam("file") MultipartFile img) throws IllegalStateException, IOException {
		 CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		    // 设置编码
		    commonsMultipartResolver.setDefaultEncoding("utf-8");
		    
		    
		 // 判断是否有文件上传
		if (img.getSize()!= 0 && commonsMultipartResolver.isMultipart(request)) {
			// 获取原文件的名称
			String oName = img.getOriginalFilename();
			
			// 得到扩展名
			String suffixName = oName.substring(oName.lastIndexOf('.'));
			// 新的文件名称
			String newName = UUID.randomUUID() + suffixName;
			img.transferTo(new File("D:\\pic\\" + newName));//另存
			sku.setImage(newName);//
		}
		int result = skuService.insertSku(sku);
		return result;
	}
	
	/**
	 * 根据查询查看单个sku
	 * @param id
	 * @return
	 */
	@PostMapping("looksku")
	@ResponseBody
	public Sku lookSku(int id) {
		return skuService.selectSkuById(id);
	}
	
	/**
	 * 更新sku
	 * @param request
	 * @param sku
	 * @param img
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@PostMapping("updatesku")
	@ResponseBody
	public Integer updateSku(HttpServletRequest request,Sku sku,@RequestParam("file") MultipartFile img) throws IllegalStateException, IOException {
		 CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		    // 设置编码
		    commonsMultipartResolver.setDefaultEncoding("utf-8");
		    
		    
		 // 判断是否有文件上传
		if (img.getSize()!= 0 && commonsMultipartResolver.isMultipart(request)) {
			// 获取原文件的名称
			String oName = img.getOriginalFilename();
			
			// 得到扩展名
			String suffixName = oName.substring(oName.lastIndexOf('.'));
			// 新的文件名称
			String newName = UUID.randomUUID() + suffixName;
			img.transferTo(new File("D:\\pic\\" + newName));//另存
			sku.setImage(newName);//
		}
		int result = skuService.updateSku(sku);
		return result;
	}
	
	/**
	 * 删除sku
	 * @param ids
	 * @return
	 */
	@PostMapping("deletesku")
	@ResponseBody
	public Integer deleteSku(Integer[] ids) {
		return skuService.deleteSku(ids);
	}
}
