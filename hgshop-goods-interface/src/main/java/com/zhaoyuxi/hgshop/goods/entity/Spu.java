package com.zhaoyuxi.hgshop.goods.entity;

import java.io.Serializable;

/**
*@author 作者:赵玉玺
*@version 创建时间：2019年11月20日 下午2:25:57
*spu实体类
*/
public class Spu implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1916109134125976111L;

	//spu主键id
	private Integer id;
	//spu名
	private String goodsName;
	//是否上架
	private String isMarketable;
	//品牌id
	private int brandId;
	//品牌名称
	private String brandName;
	//判断品牌是否被删除
	private int deletedFlag;
	//副标题
	private String caption;
	//分类id
	private int categoryId;
	//分类名称
	private String categoryName;
	//小图
	private String smallPic;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getIsMarketable() {
		return isMarketable;
	}
	public void setIsMarketable(String isMarketable) {
		this.isMarketable = isMarketable;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public int getDeletedFlag() {
		return deletedFlag;
	}
	public void setDeletedFlag(int deletedFlag) {
		this.deletedFlag = deletedFlag;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSmallPic() {
		return smallPic;
	}
	public void setSmallPic(String smallPic) {
		this.smallPic = smallPic;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Spu [id=" + id + ", goodsName=" + goodsName + ", isMarketable=" + isMarketable + ", brandId=" + brandId
				+ ", brandName=" + brandName + ", deletedFlag=" + deletedFlag + ", caption=" + caption + ", categoryId="
				+ categoryId + ", categoryName=" + categoryName + ", smallPic=" + smallPic + "]";
	}
	public Spu(Integer id, String goodsName, String isMarketable, int brandId, String brandName, int deletedFlag,
			String caption, int categoryId, String categoryName, String smallPic) {
		super();
		this.id = id;
		this.goodsName = goodsName;
		this.isMarketable = isMarketable;
		this.brandId = brandId;
		this.brandName = brandName;
		this.deletedFlag = deletedFlag;
		this.caption = caption;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.smallPic = smallPic;
	}
	public Spu() {
		super();
	}
	
	
	
}
