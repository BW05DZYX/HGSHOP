package com.zhaoyuxi.hgshop.goods.entity;

import java.io.Serializable;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月16日 上午10:17:41
*类功能说明
*/
public class Brand implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//品牌id
	private Integer id;
	//品牌名称
	private String name;
	//品牌名称首字母
	private String firstC;
	//品牌名称是否删除
	private int deletedFlag;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFirstC() {
		return firstC;
	}
	public void setFirstC(String firstC) {
		this.firstC = firstC;
	}
	public int getDeletedFlag() {
		return deletedFlag;
	}
	public void setDeletedFlag(int deletedFlag) {
		this.deletedFlag = deletedFlag;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Brand(Integer id, String name, String firstC, int deletedFlag) {
		super();
		this.id = id;
		this.name = name;
		this.firstC = firstC;
		this.deletedFlag = deletedFlag;
	}
	public Brand() {
		super();
	}
	@Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + ", firstC=" + firstC + ", deletedFlag=" + deletedFlag + "]";
	}
	
	
	
}
