<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=request.getContextPath()%>/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>hgshop后台管理系统</title>

<!-- Bootstrap core CSS -->
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="resource/css/bootstrap-treeview.css" />
<script type="text/javascript" src="resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/js/bootstrap-treeview.js"></script>

</head>
<body style="background-color: rgba(250, 250, 255, 0.3);">

	<div class="container-fluid">

			<div class="row">
				<!-- 加入了列 填充整行 -->
				<form class="col-sm-12" action="spuList" method="post">
					<div class="form-group">
						<label>商品名称</label> <input type="text" name="goodsName"
							class="form-control" placeholder="请输入品牌名称" value="">
					</div>

					<div class="form-group">
						<label>商品副标题</label> <input type="text" name="caption"
							class="form-control" placeholder="请输入品牌的首字母" value="">
					</div>
					<!-- 隐藏分类的id值 -->
					<input type="hidden" id="cid" name="categoryId" value="" />
					<button class="btn btn-success">搜索</button>
				</form>
			</div>

			<!-- 外边距(下方) 10像素的大小 -->
			<div class="row" style="margin-bottom: 10px;">
				<!-- 右端对齐 -->
				<div class="col-sm-12" align="right">
					<button class="btn btn-danger">批量删除</button>
					<button class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#skuAddModal">添加sku</button>
				</div>
			</div>

			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="cbk" />全选</th>
							<th scope="col">序号</th>
							<th scope="col">商品图片</th>
							<th scope="col">商品标题</th>
							<th scope="col">商品价格</th>
							<th scope="col">商品状态</th>
							<th scope="col">商品库存</th>
							<th scope="col">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${skusPage.list }" var="sku">
							<tr>
								<td scope="row"><input type="checkbox" class="ck" value="${sku.id }" />
								</td>
								<td>${sku.id }</td>
								<td><img width="40px" height="40px" src="/pic/${sku.image }" /></td>
								<td>${sku.title }</td>
								<td>${sku.price }</td>
								<td>${sku.status=="Y"? "正常": (sku.status=="N"? "下架":"删除")  }</td>
								<td>${sku.stockCount }</td>
								<td><button class="btn btn-danger" value="${sku.id }">删除</button>
									<button class="btn btn-info btn-sm" data-toggle="modal"
										data-target="#skuAddModal" value="${sku.id }">修改</button>
									<button class="btn btn-primary btn-sm" data-toggle="modal"
										data-target="#skuAddModal" value="${sku.id }">详情</button></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				${page }
			</div>


	</div>


	<!-- ////////////////写入添加模态框 //////////////////////////////-->
	<div class="modal fade" id="skuAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content" style="background-color: rgba(250, 250, 255, 0.7);">
				<div class="modal-header">
					<!-- 关闭的x效果 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<!-- 模态框的标题 -->
					<h4 class="modal-title" id="skuAddModalLabel"><!-- 操作标题 --></h4>
				</div>
				<div class="modal-body">
					<form id="addFrm" enctype="multipart/form-data"
						action="javascript:void(0)">
						<input type="hidden" name="status" value="Y">
						
						<input type="hidden" name="id" id="addId" /> <input type="hidden"
							name="image" id="addImage" />
						<div class="form-group row">
							<label for="addTitle"
								class="col-sm-3 col-form-label col-form-label-sm">商品标题</label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm"
									id="addTitle" name="title" placeholder="请输入商品标题">
									<p id="zyx-title"></p>
							</div>
						</div>

						<div class="form-group row">
							<label for="addPrice" class="col-sm-3 col-form-label">商品价格</label>
							<div class="col-sm-9">
								<input type="number" class="form-control" id="addPrice"
									name="price" placeholder="请输入商品价格">
									<p id="zyx-price"></p>
							</div>
						</div>

						<div class="form-group row">
							<label for="addCostPrice" class="col-sm-3 col-form-label">成本价格</label>
							<div class="col-sm-9">
								<input type="number" class="form-control" id="addCostPrice"
									name="costPrice" placeholder="请输入成本价格">
									<p id="zyx-costPrice"></p>
							</div>
						</div>


						<div class="form-group row">
							<label for="addMarketPrice" class="col-sm-3 col-form-label">市场价格</label>
							<div class="col-sm-9">
								<input type="number" class="form-control" id="addMarketPrice"
									name="marketPrice" placeholder="请输入市场价格">
									<p id="zyx-marketPrice"></p>
							</div>
						</div>


						<div class="form-group row">
							<label for="addSpuId" class="col-sm-3 col-form-label">所属商品</label>
							<div class="col-sm-9">
								<select class="form-control" id="addSpuId" name="spuId">
								</select>
								<p id="zyx-spuId"></p>
							</div>
						</div>



						<div class="form-group row">
							<label for="addStockCount" class="col-sm-3 col-form-label">商品库存</label>
							<div class="col-sm-9">
								<input type="number" class="form-control" id="addStockCount"
									name="stockCount" placeholder="请输入商品库存">
									<p id="zyx-stockCount"></p>
							</div>
						</div>

						<div class="form-group row">
							<label for="addSellPoint" class="col-sm-3 col-form-label">商品卖点</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="addSellPoint"
									name="sellPoint" placeholder="请输入商品买点">
									<p id="zyx-sellPoint"></p>
							</div>
						</div>


						<div class="form-group row">
							<label for="addBarcode" class="col-sm-3 col-form-label">商品条形码</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="addBarCode"
									name="barcode" placeholder="请输入商品条形码">
									<p id="zyx-barcode"></p>
							</div>
						</div>



						<div class="form-group row">
							<label for="addImage1" class="col-sm-3 col-form-label">商品图标</label>
							<div class="col-sm-9">
								<input type="file" class="form-control" id="addImage1"
									name="file" /> <img src="" alt="请选择商品图"
									id="zyx-img" height="300px" width="400px" class="zyx-file">
							</div>
						</div>

						<div class="form-group row">
								
							<div class="col-sm-6">
							<button  class="btn btn-primary" id="zyx-addOption">增加下来选中规格及选项内容</button>
								<label id="zyx-h">规格描述</label>
							</div>

							<div class="col-sm-6">
								<select id="addskuSpec" class="form-control">
								</select>
								<p id="zyx-o"></p>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="zyx-sku-submit" >添加</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- ///////////////////添加模态框结束//////////////////////////// -->


	<script type="text/javascript">
		var ii=0;
		$(function(){
			//返回规格
			$.post("/spec/selectspeclist",function(res){
				$("#addskuSpec").empty();
				$("#addskuSpec").append('<option value="0">请选择规格</option>');
				for(var i in res){
					$("#addskuSpec").append('<option value="'+res[i].id+'">'+res[i].specName+'</option>');
				}
			},"json")
			
			//增加规格选项
			$("#zyx-addOption").click(function(){
				zyxAddModel();
			})
			//这个是返回选择spu列表
			$.post("/spu/selectspulist",function(res){
				$("[name='spuId']").empty();
				$("[name='spuId']").append('<option value="0">请选择商品</option>');
				for(var i in res){
					$("[name='spuId']").append('<option value="'+res[i].id+'">'+res[i].goodsName+'</option>');
				}
				
			},"json");
			
			
			$("button").click(function(){
				$("#skuAddModalLabel").html("商品"+$(this).html());
				$("#zyx-sku-submit").html($(this).html());
				if($(this).prop("id")=="zyx-sku-submit"){
					if($(this).html()=="添加sku"){
						var formData = new FormData($( "#addFrm" )[0]);
						$.ajax({
							type:"post",
							data:formData,
							// 告诉jQuery不要去处理发送的数据
							processData : false,
							// 告诉jQuery不要去设置Content-Type请求头
							contentType : false,
							url:"/sku/insertsku",
							success:function(obj){
								if(obj){
									alert("添加成功")
									window.location.reload();
								}else{
									alert("添加失败")
								}
								
							}
						})	
					}else if($(this).html()=="修改"){
						var formData = new FormData($( "#addFrm" )[0]);
						$.ajax({
							type:"post",
							data:formData,
							// 告诉jQuery不要去处理发送的数据
							processData : false,
							// 告诉jQuery不要去设置Content-Type请求头
							contentType : false,
							url:"/sku/updatesku",
							success:function(obj){
								if(obj){
									alert("修改成功")
									window.location.reload();
								}else{
									alert("修改失败")
								}
								
							}
						})	
					}
					
					
				}else{
					//对于显示进行调整
					$("#addFrm input ").val("");
					$("#addFrm select ").val("0");
					$(".zyx-delete-option").parent().parent().remove();
					$("#zyx-spu-submit").prop("style","display:inline;");
					$(".zyx-file").prop("src","");
					lookForm("addFrm");
					if($(this).html()=="详情"){
						hiddenForm("addFrm");
						$.post("/sku/looksku",{"id":$(this).val()},function(res){
							$("#zyx-title").html(res.title);
							$("#zyx-price").html(res.price);
							$("#zyx-costPrice").html(res.costPrice);
							$("#zyx-marketPrice").html(res.marketPrice);
							$("#zyx-spuId").html(res.goodsName);
							$("#zyx-stockCount").html(res.stockCount);
							$("#zyx-sellPoint").html(res.sellPoint);
							$("#zyx-barcode").html(res.barcode);
							$("#zyx-img").prop("src","/pic/"+res.image);
							var zyxOp='';
							if(res.skuSpeOpts!=null){
								for(var i in res.skuSpeOpts){
									zyxOp+='<p>规格属性：'+res.skuSpeOpts[i].specName+' 具体属性：'+res.skuSpeOpts[i].optionName+'</p>'
								}
								$("#zyx-o").html(zyxOp);
							}else{
								$("#zyx-o").html("该商品暂无规格");
							}
							
							
						},"json");
						
					}else if($(this).html()=="修改"){
						$("[name='id']").val($(this).val());
						$.post("/sku/looksku",{"id":$(this).val()},function(res){
							$("[name='title']").val(res.title);
							$("[name='price']").val(res.price);
							$("[name='costPrice']").val(res.costPrice);
							$("[name='marketPrice']").val(res.marketPrice);
							$("[name='spuId']").val(res.spuId);
							$("[name='stockCount']").val(res.stockCount);
							$("[name='sellPoint']").val(res.sellPoint);
							$("[name='barcode']").val(res.barcode);
							$("#zyx-img").prop("src","/pic/"+res.image);
							if(res.skuSpeOpts!=null){
								for(var i in res.skuSpeOpts){
									$.ajaxSettings.async = false;
									 $.post("/spec/getspec",{"id":res.skuSpeOpts[i].specId},function(ress){
										 if(ress!=null){
											 var pj="";
											 for(var j in ress.specOptions){
												 pj+='<option value="'+ress.specOptions[j].id+'">'
													+ ress.specOptions[j].optionName
													+ '</option>';
											 }
											var str= '<div class="form-group row"><label class="col-sm-3 col-form-label">'
												+ ress.specName
												+ '</label><input type="hidden" name="skuSpeOpts['+ii+'].specId" value="'+ress.id+'"/><div class="col-sm-9"><select name="skuSpeOpts['+ii+'].specOptionId" class="form-control" value="0"><option value="0">请选择'
												+ ress.specName
												+ '项</option>'
												+ pj + '</select><button class="zyx-delete-option" style="background-color:red;margin-left:370px;">'
												+'删除</button></div></div>'
												$("#addFrm").append(str);
											
										 }else{
											 alert("该属性没有选项");
										 }
										 $(".zyx-delete-option").click(function(){
												$(this).parent().parent().remove();
										 })
										 $("[name='skuSpeOpts["+ii+"].specOptionId']").val(res.skuSpeOpts[i].specOptionId);
										 ii++;
									 },"json")
									 $.ajaxSettings.async = true;
								}
							}
							
							
						},"json");
					}else if($(this).html()=="删除"){
						$.post("/sku/deletesku",{"ids":$(this).val()},function(res){
							if(res==1){
								alert("删除成功");
								window.location.reload();
							}else{
								alert("未知原因，删除失败。")
							}
						})
					}else if($(this).html()=="批量删除"){
						var ids=[];
						$(".ck").each(function(){
							if($(this).prop("checked")){
								ids.push($(this).val());
							}
						})
						idss=ids.join(",");
						$.post("/sku/deletesku",{"ids":idss},function(res){
							if(res!=0){
								alert("删除成功");
								window.location.reload();
							}else{
								alert("未知原因，删除失败。")
							}
						})
					}
					
				}
			})
			
			
		//这个是为了返回所选择的图片
		$("#addImage1").change(function() {
			function getObjectURL(file) {
				var url = null;
				if (window.createObjcectURL != undefined) {
					url = window.createOjcectURL(file);
				} else if (window.URL != undefined) {
					url = window.URL.createObjectURL(file);
				} else if (window.webkitURL != undefined) {
					url = window.webkitURL.createObjectURL(file);
				}
				return url;
			}
			var fileUrl = getObjectURL(this.files[0]);
			$("#zyx-img").prop("src", fileUrl);
			URL.revokeObjectURL();
			})
	})
		
		//隐藏部分标签，为了详情
		function hiddenForm(formName){
			$("#"+formName +" input ").prop("style","display:none;")
			$("#"+formName +" select ").prop("style","display:none;")
			$("#"+ formName+" p ").prop("style","display:block;")
			$("#zyx-h").prop("style","display:block;")
			$("#zyx-addOption").prop("style","display:none;")
		}
		//重新显示标签
		function lookForm(formName){
			$("#"+ formName+" input ").prop("style","display:inline;")
			$("#"+formName +" select ").prop("style","display:inline;")
			$("#"+formName +" p ").prop("style","display:none;")
			$("#zyx-h").prop("style","display:none;")
			$("#zyx-addOption").prop("style","display:block;")
		}
		
		//增加规格选项
		function zyxAddModel(){
			 var te=$("#addskuSpec").find("option:selected").text();
			 var va=$("#addskuSpec").find("option:selected").val();
			 if(va!=0){
				 $.post("/spec/getspec",{"id":va},function(res){
					 if(res!=null){
						 var pj="";
						 for(var i in res.specOptions){
							 pj+='<option value="'+res.specOptions[i].id+'">'
								+ res.specOptions[i].optionName
								+ '</option>';
						 }
						var str= '<div class="form-group row"><label class="col-sm-3 col-form-label">'
							+ te
							+ '</label><input type="hidden" name="skuSpeOpts['+ii+'].specId" value="'+va+'"/><div class="col-sm-9"><select name="skuSpeOpts['+ii+'].specOptionId" class="form-control"><option value="0">请选择'
							+ te
							+ '项</option>'
							+ pj + '</select><button class="zyx-delete-option" style="background-color:red;margin-left:370px;">'
							+'删除</button></div></div>'
							$("#addFrm").append(str);
					 }else{
						 alert("该属性没有选项");
					 }
					 $(".zyx-delete-option").click(function(){
							$(this).parent().parent().remove();
					 })
				 },"json")
				 ii++;
			 }else{
				 alert("请先选择");
			 }
		}
		
		//全选,反选
		$("#cbk").click(function(){
			$(".ck").each(function(){
				if($(this).prop("checked")){
					$(this).prop("checked",false);
				}else{
					$(this).prop("checked",true);
				}
			})
		})
	</script>
</body>
</html>