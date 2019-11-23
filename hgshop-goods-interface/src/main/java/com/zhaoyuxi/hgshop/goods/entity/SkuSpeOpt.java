package com.zhaoyuxi.hgshop.goods.entity;

import java.io.Serializable;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月21日 下午8:07:14
*规格选择
*/
public class SkuSpeOpt implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4715448197627501759L;
	//id
	private Integer id;
	//skuId
	private int skuId;
	//规格id
	private int specId;
	//规格名称
	private String specName;
	//规格选项id
	private int specOptionId;
	//规格选项名称
	private String optionName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getSkuId() {
		return skuId;
	}
	public void setSkuId(int skuId) {
		this.skuId = skuId;
	}
	public int getSpecId() {
		return specId;
	}
	public void setSpecId(int specId) {
		this.specId = specId;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public int getSpecOptionId() {
		return specOptionId;
	}
	public void setSpecOptionId(int specOptionId) {
		this.specOptionId = specOptionId;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SkuSpeOpt [id=" + id + ", skuId=" + skuId + ", specId=" + specId + ", specName=" + specName
				+ ", specOptionId=" + specOptionId + ", optionName=" + optionName + "]";
	}
	public SkuSpeOpt(Integer id, int skuId, int specId, String specName, int specOptionId, String optionName) {
		super();
		this.id = id;
		this.skuId = skuId;
		this.specId = specId;
		this.specName = specName;
		this.specOptionId = specOptionId;
		this.optionName = optionName;
	}
	public SkuSpeOpt() {
		super();
	}
	
}
