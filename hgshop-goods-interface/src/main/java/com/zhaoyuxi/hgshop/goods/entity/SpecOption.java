package com.zhaoyuxi.hgshop.goods.entity;

import java.io.Serializable;
import java.util.Arrays;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 下午3:06:17
*规格参数选项实体类
*/
public class SpecOption implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6890223987783306545L;

	//id
	private Integer id;
	//规格参数选项名称
	private String optionName;
	//规格参数父id
	private int specId;
	//排序
	private int orders;
	//用于进行批量添加
	private String[] optionNames;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public int getSpecId() {
		return specId;
	}
	public void setSpecId(int specId) {
		this.specId = specId;
	}
	public int getOrders() {
		return orders;
	}
	public void setOrders(int orders) {
		this.orders = orders;
	}
	public String[] getOptionNames() {
		return optionNames;
	}
	public void setOptionNames(String[] optionNames) {
		this.optionNames = optionNames;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SpecOption [id=" + id + ", optionName=" + optionName + ", specId=" + specId + ", orders=" + orders
				+ ", optionNames=" + Arrays.toString(optionNames) + "]";
	}
	public SpecOption(Integer id, String optionName, int specId, int orders, String[] optionNames) {
		super();
		this.id = id;
		this.optionName = optionName;
		this.specId = specId;
		this.orders = orders;
		this.optionNames = optionNames;
	}
	public SpecOption() {
		super();
	}
	
	
	
	
}
