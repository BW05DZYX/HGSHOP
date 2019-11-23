package com.zhaoyuxi.hgshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
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
import com.zhaoyuxi.hgshop.goods.entity.Spu;
import com.zhaoyuxi.hgshop.goods.service.SpuService;
import com.zhaoyuxi.hgshop.util.PageUtil;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月20日 下午1:40:56 
 *spu控制层
 */
@Controller
@RequestMapping("spu")
public class SpuController {

	@Reference
	private SpuService spuService;
	
	
	/**
	 * 返回列表
	 * @param model
	 * @param goodsName
	 * @param caption
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("tospu")
	public String tospu(Model model, @RequestParam(defaultValue = "") String goodsName,
			@RequestParam(defaultValue = "") String caption, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "3") int pageSize) {
		PageInfo<Spu> spusPage=spuService.selectSpusAll(goodsName, caption, pageNum, pageSize);
		String page=PageUtil.page(pageNum, spusPage.getPages(), "/spu/tospu/", 2);
		model.addAttribute("spusPage", spusPage);
		model.addAttribute("page", page);
		return "/admin/spu/spu_list";
	}
	
	/**
	 * 添加spu
	 * @param spu
	 * @return
	 */
	@PostMapping("insertspu")
	@ResponseBody
	public Integer insertSpu(HttpServletRequest request,Spu spu,@RequestParam("file") MultipartFile img) throws IllegalStateException, IOException {
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
			spu.setSmallPic(newName);//
		}
		int result = spuService.insertSpu(spu);
		return result;
	}
	
	/**
	 * 修改spu
	 * @param spu
	 * @return
	 */
	@PostMapping("updatespu")
	@ResponseBody
	public Integer updateSpu(HttpServletRequest request,Spu spu,@RequestParam("file") MultipartFile img) throws IllegalStateException, IOException {
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
			spu.setSmallPic(newName);//
		}
		int result = spuService.updateSpu(spu);
		return result;
	}
	
	/**
	 * 删除spu
	 * @param ids
	 */
	@PostMapping("deletespu")
	@ResponseBody
	public Integer deleteSpu(Integer[] ids) {
		return spuService.deleteSpu(ids);
	}
	
	/**
	 * 查看spu详情
	 * @param id
	 * @return
	 */
	@PostMapping("lookspu")
	@ResponseBody
	public Spu lookSpu(int id) {
		return spuService.selectSpuById(id);
	}
	
	
	/**
	 * 返回所有spu
	 * @return
	 */
	@PostMapping("selectspulist")
	@ResponseBody
	public List<Spu> selectSpuList(){
		return spuService.selectSpus();
	}
	
	
}
