package com.zhaoyuxi.hgshop.goods.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author 作者:赵玉玺
 * @version 创建时间：2019年11月21日 下午7:27:59 sku实体类
 */
public class Sku implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4503613470903302115L;
	// id
	private Integer id;
	// 商品标题
	private String title;
	// 商品买点
	private String sellPoint;
	// 商品价格
	private double price;
	// 库存数量
	private int stockCount;
	// 商品条形码
	private String barcode;
	// 商品图片
	private String image;
	// 商品状态，Y-正常，N-下架，D-删除
	private String status;
	// 创建时间
	private Date createTime;
	// 更新时间
	private Date updateTime;
	// 成本价
	private double costPrice;
	// 市场价
	private double marketPrice;
	// spuId
	private int spuId;

	// 商品名称
	private String goodsName;
	// 商品副名称
	private String caption;
	// 购物车前小图标
	private String cartThumbnail;
	// 对应spu
	private Spu spu;
	// 对应规格集合
	private List<SkuSpeOpt> skuSpeOpts;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSellPoint() {
		return sellPoint;
	}
	public void setSellPoint(String sellPoint) {
		this.sellPoint = sellPoint;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStockCount() {
		return stockCount;
	}
	public void setStockCount(int stockCount) {
		this.stockCount = stockCount;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public double getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}
	public double getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}
	public int getSpuId() {
		return spuId;
	}
	public void setSpuId(int spuId) {
		this.spuId = spuId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getCartThumbnail() {
		return cartThumbnail;
	}
	public void setCartThumbnail(String cartThumbnail) {
		this.cartThumbnail = cartThumbnail;
	}
	public Spu getSpu() {
		return spu;
	}
	public void setSpu(Spu spu) {
		this.spu = spu;
	}
	public List<SkuSpeOpt> getSkuSpeOpts() {
		return skuSpeOpts;
	}
	public void setSkuSpeOpts(List<SkuSpeOpt> skuSpeOpts) {
		this.skuSpeOpts = skuSpeOpts;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Sku [id=" + id + ", title=" + title + ", sellPoint=" + sellPoint + ", price=" + price + ", stockCount="
				+ stockCount + ", barcode=" + barcode + ", image=" + image + ", status=" + status + ", createTime="
				+ createTime + ", updateTime=" + updateTime + ", costPrice=" + costPrice + ", marketPrice="
				+ marketPrice + ", spuId=" + spuId + ", goodsName=" + goodsName + ", caption=" + caption
				+ ", cartThumbnail=" + cartThumbnail + ", spu=" + spu + ", skuSpeOpts=" + skuSpeOpts + "]";
	}
	public Sku(Integer id, String title, String sellPoint, double price, int stockCount, String barcode, String image,
			String status, Date createTime, Date updateTime, double costPrice, double marketPrice, int spuId,
			String goodsName, String caption, String cartThumbnail, Spu spu, List<SkuSpeOpt> skuSpeOpts) {
		super();
		this.id = id;
		this.title = title;
		this.sellPoint = sellPoint;
		this.price = price;
		this.stockCount = stockCount;
		this.barcode = barcode;
		this.image = image;
		this.status = status;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.costPrice = costPrice;
		this.marketPrice = marketPrice;
		this.spuId = spuId;
		this.goodsName = goodsName;
		this.caption = caption;
		this.cartThumbnail = cartThumbnail;
		this.spu = spu;
		this.skuSpeOpts = skuSpeOpts;
	}
	public Sku() {
		super();
	}


}
