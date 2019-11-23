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
			<form class="col-sm-12" action="/spu/tospu" method="post">
				<div class="form-group">
					<label>商品名称</label> <input type="text" name="goodsName"
						class="form-control" placeholder="请输入商品名称" value="">
				</div>

				<div class="form-group">
					<label>商品副标题</label> <input type="text" name="caption"
						class="form-control" placeholder="请输入商品副标题" value="">
				</div>
				<!-- 隐藏分类的id值 -->
				<input type="hidden" id="cid" name="categoryId" value="" />
				<button class="btn btn-success">搜索</button>
			</form>
		</div>

		<!-- 外边距(下方)10像素的大小 -->
		<div class="row" style="margin-bottom: 10px;">
			<!-- 右端对齐 -->
			<div class="col-sm-12" align="right">
				<button class="btn btn-danger">批量删除</button>
				<button class="btn btn-primary btn-sm" onclick="preAddSpu()"
					data-toggle="modal" data-target="#spuAddModal">添加</button>
			</div>
		</div>


		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" id="cbk" />全选</th>
						<th scope="col">序号</th>
						<th scope="col">图标</th>
						<th scope="col">商品名称</th>
						<th scope="col">商品状态</th>
						<th scope="col">商品品牌</th>
						<th scope="col">商品分类</th>
						<th scope="col">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${spusPage.list }" var="spu">
						<tr>
							<td scope="row"><input type="checkbox" class="ck" value="${spu.id }"/>
							</td>
							<td>${spu.id }</td>
							<td><img width="40px" height="40px"
								src="/pic/${spu.smallPic }" /></td>
							<td>${spu.goodsName }</td>
							<td>${spu.isMarketable=="Y" ? "上架":"下架"}</td>
							<td>${spu.deletedFlag=="0" ? spu.brandName:"无" }</td>
							<td>${spu.categoryName }</td>
							<td><button class="btn btn-danger" value="${spu.id }">删除</button>
								<button class="btn btn-info btn-sm" data-toggle="modal"
									data-target="#spuAddModal" value="${spu.id }" >修改</button>
								<button class="btn btn-primary btn-sm" data-toggle="modal"
									data-target="#spuAddModal" value="${spu.id }">详情</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			${page }
		</div>

	</div>


	<!-- ////////////////写入添加模态框 //////////////////////////////-->
	<div class="modal fade" id="spuAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content" style="background-color: rgba(250, 250, 255, 0.7);">
				<div class="modal-header">
					<!-- 关闭的x效果 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<!-- 模态框的标题 -->
					<h4 class="modal-title" id="spuAddModalLabel"></h4>
				</div>
				<div class="modal-body">
					<form id="addFrm" enctype="multipart/form-data">
						<input type="hidden" name="id">
						<div class="form-group row">
						
							<label for="addGoodsName"
								class="col-sm-3 col-form-label col-form-label-sm">商品名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm"
									id="addGoodsName" name="goodsName" placeholder="请输入商品名称">
									<p class="zyx-goodsName"></p>
							</div>
						</div>

						<div class="form-group row">
							<label for="addCaption" class="col-sm-3 col-form-label">商品副标题</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="addCaption"
									name="caption" placeholder="请输入商品的副标题">
									<p class="zyx-caption"></p>
							</div>
						</div>

						<div class="form-group row">
							<label for="addismarketTable" class="col-sm-3 col-form-label">商品状态</label>
							<div class="col-sm-9">
								<select class="form-control" name="isMarketable">
									<option value="Y">上架</option>
									<option value="N">下架</option>
								</select>
								<p class="zyx-isMarketable"></p>
							</div>
						</div>

						<div class="form-group row">
							<label for="addBrand" class="col-sm-3 col-form-label">商品品牌</label>
							<div class="col-sm-9">
								<select class="form-control" id="addBrand" name="brandId" >
								</select>
								<p class="zyx-brandId"></p>
							</div>
						</div>

						<div class="form-group row">
							<label for="addCategory" class="col-sm-3 col-form-label">商品分类</label>
							<!-- 左边部分 -->
							<div class="col-sm-9">
								<input type="hidden" class="form-control" id="addCategory"
									name="categoryId"> <input type="text"
									class="form-control" id="addCategoryName" placeholder="点击选择商品分类" readonly="readonly">
								<div id="tree"
									style="display: none; position: absolute; z-index: 1010;"></div>
									<p class="zyx-categoryId"></p>
							</div>
						</div>


						<div class="form-group row">
							<label for="addsmallPic" class="col-sm-3 col-form-label">商品图标</label>
							<div class="col-sm-9">
								<input type="file" class="form-control" id="addsmallPic"
									name="file" /> <img src="" alt="请选择商品图"
									id="zyx-img" height="300px" width="400px" class="zyx-file">
							</div>
						</div>


					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="zyx-spu-submit"></button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- ///////////////////添加模态框结束//////////////////////////// -->
	<script>
	var count=0;
		$(function() {
			//回显可选择的品牌
			$.post("/brand/brandSelect",function(res){
				$("#addBrand").empty();
				$("#addBrand").append('<option value="0">请选择品牌</option>');
				for(var i in res){
					$("#addBrand").append('<option value="'+res[i].id+'">'+res[i].name+'</option>');
				}
			},"json")
			
			$("button").click(function(){
				$("#spuAddModalLabel").html("商品"+$(this).html());
				$("#zyx-spu-submit").html($(this).html());
				if($(this).prop("id")=="zyx-spu-submit"){
					if($(this).html()=="添加"){
						//去掉回显数据
						$("#addFrm input ").val("")
						$("[name='isMarketable']").val("Y");
						$("[name='brandId']").val(0);
						var formData = new FormData($( "#addFrm" )[0]);
						$.ajax({
							type:"post",
							data:formData,
							// 告诉jQuery不要去处理发送的数据
							processData : false,
							// 告诉jQuery不要去设置Content-Type请求头
							contentType : false,
							url:"/spu/insertspu",
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
							url:"/spu/updatespu",
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
					if($(this).html()=="修改"){
						$("[name='id']").val($(this).val());
						$.post("/spu/lookspu",{"id":$(this).val()},function(res){
							$("[name='goodsName']").val(res.goodsName);
							$("[name='caption']").val(res.caption);
							$("[name='isMarketable']").val(res.isMarketable);
							$("[name='brandId']").val(res.brandId);
							if($("[name='brandId']").val()=="" || $("[name='brandId']").val()==null){
								$("[name='brandId']").val(0);
							}
							$("[name='categoryId']").val(res.categoryId);
							$("#addCategoryName").val(res.categoryName);
							$(".zyx-file").prop("src","/pic/"+res.smallPic+"");
						},"json")
					}else if($(this).html()=="详情"){
						$.post("/spu/lookspu",{"id":$(this).val()},function(res){
							hiddenForm("addFrm");
							$(".zyx-goodsName").html(res.goodsName);
							$(".zyx-caption").html(res.caption);
							$(".zyx-isMarketable").html(res.isMarketable=="Y" ? "上架":"下架");
							$(".zyx-brandId").html(res.brandName);
							$(".zyx-categoryId").html(res.categoryName);
							$(".zyx-file").prop("src","/pic/"+res.smallPic);
							$("#zyx-spu-submit").prop("style","display:none;")
						},"json")
					}else if($(this).html()=="批量删除"){
						var ids=[];
						$(".ck").each(function(){
							if($(this).prop("checked")){
								ids.push($(this).val());
							}
						})
						idss=ids.join(",");
						$.post("/spu/deletespu",{"ids":idss},function(res){
							if(res!=0){
								alert("删除成功");
								window.location.reload();
							}else{
								alert("未知原因，删除失败。")
							}
						})
					}else if($(this).html()=="删除"){
						$.post("/spu/deletespu",{"ids":$(this).val()},function(res){
							if(res==1){
								alert("删除成功");
								window.location.reload();
							}else{
								alert("未知原因，删除失败。")
							}
						})
					}
					//对于显示进行调整
					$("#zyx-spu-submit").prop("style","display:inline;");
					$(".zyx-file").prop("src","");
					lookForm("addFrm");
				}
			})
			
		})

		//这个是为了返回所选择的图片
		$("#addsmallPic").change(function() {
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
		
		$("#addCategoryName").click(function(){
			if(count%2==0){
				$("#tree").prop("style","display:block;");
				count++;
			}else{
				$("#tree").prop("style","display:none;");
				count--;
			}
			//这个是为了返回分类树
			$.post("/category/getcategorys", function(res) {
				var defaultData = res;
				$('#tree').treeview(
						{
							expandIcon : "glyphicon glyphicon-star",
							collapseIcon : "glyphicon glyphicon-star-empty",
							emptyIcon : "glyphicon glyphicon-piggy-bank",
							onhoverColor : "rgba(0, 0, 0, 0.3)",
							color : "black",
							selectedBackColor : "rgba(0, 0, 0, 0.6)",
							backColor : "rgba(255, 255, 255, 0.3)",
							data : defaultData,
							onNodeSelected : function(event, node) {
								text = node.text;
								$("#addCategoryName").val(node.text);
								$("#addCategory").val(node.id);
								$("#name").removeAttr("disabled");
								$("#name").prop("name", "name");
								$("this").removeAttr("name");
								$("#zyx-add-tt").text("分类添加操作");
								var parentNode = $("#tree").treeview(
										'getParent', node);
								if (parentNode.id) {
									$("#updateParentId").val(parentNode.id);
								}
							}
						});
			}, "text")
		})
		
		//隐藏部分标签，为了详情
		function hiddenForm(formName){
			$("#"+formName +" input ").prop("style","display:none;")
			$("#"+formName +" select ").prop("style","display:none;")
			$("#"+ formName+" p ").prop("style","display:block;")
		}
		//重新显示标签
		function lookForm(formName){
			$("#"+ formName+" input ").prop("style","display:inline;")
			$("#"+formName +" select ").prop("style","display:inline;")
			$("#"+formName +" p ").prop("style","display:none;")
		}
	</script>

</body>
</html>