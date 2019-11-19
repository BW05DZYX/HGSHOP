package com.zhaoyuxi.hgshop.goods.entity;

import java.io.Serializable;
import java.util.List;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月19日 下午2:59:05
*规格实体类
*/
public class Spec implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3164419179787075703L;
	
	//id
	private Integer id;
	//规格参数名
	private String specName;
	//规格参数选项
	private String optionNames;
	//规格参数选项集合
	private List<SpecOption> specOptions;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public String getOptionNames() {
		return optionNames;
	}
	public void setOptionNames(String optionNames) {
		this.optionNames = optionNames;
	}
	public List<SpecOption> getSpecOptions() {
		return specOptions;
	}
	public void setSpecOptions(List<SpecOption> specOptions) {
		this.specOptions = specOptions;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Spec [id=" + id + ", specName=" + specName + ", optionNames=" + optionNames + ", specOptions="
				+ specOptions + "]";
	}
	public Spec(Integer id, String specName, String optionNames, List<SpecOption> specOptions) {
		super();
		this.id = id;
		this.specName = specName;
		this.optionNames = optionNames;
		this.specOptions = specOptions;
	}
	public Spec() {
		super();
	}
	
	
	
}
