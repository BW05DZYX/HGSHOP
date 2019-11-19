package com.zhaoyuxi.hgshop.goods.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月18日 下午4:20:35
*分类实体类
*/
public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6889143268337628891L;
	//分类id
	private Integer id;
	//分类父id
	private int parentId;
	//分类名称
	@JsonProperty("text")
	private String name;
	//子类集合
	@JsonProperty("nodes")
	private List<Category> childCategory;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Category> getChildCategory() {
		return childCategory;
	}
	public void setChildCategory(List<Category> childCategory) {
		this.childCategory = childCategory;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", parentId=" + parentId + ", name=" + name + ", childCategory=" + childCategory
				+ "]";
	}
	public Category(Integer id, int parentId, String name, List<Category> childCategory) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.childCategory = childCategory;
	}
	public Category() {
		super();
	}

	
	
	
}
