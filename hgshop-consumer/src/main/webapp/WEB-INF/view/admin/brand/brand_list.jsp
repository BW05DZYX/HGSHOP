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

<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>

</head>
<!-- 设置全局背景色 -->
<body style="background-color: rgba(250, 250, 255, 0.3);">
	<!-- 主体，列表及功能按钮 -->
	<div class="container-fluid">
		<div class="row">
			<form action="/brand/tobrand" method="post">
				<div class="form-group">
					<label for="name">品牌名称</label> <input type="text"
						class="form-control" name="name" placeholder="品牌名称">
				</div>
				<div class="form-group">
					<label for="firstC">品牌首字母</label> <input type="text"
						class="form-control" name="firstC" placeholder="品牌首字母">
				</div>
				<button class="btn btn-success">搜索</button>
			</form>
		</div>

		<div class="row" style="float: right;">
			<button class="btn btn-danger">批量删除</button>
			<button type="button" class="btn btn-primary btn-md"
				data-toggle="modal" data-target="#myModal">新增</button>
		</div>

		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><input type="checkbox" id="cbk">全选</th>
						<th>编号</th>
						<th>品牌名称</th>
						<th>首字母</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${brandsPage.list }" var="brands">
						<tr>
							<td><input type="checkbox" class="ck" value="${brands.id }"/></td>
							<td>${brands.id }</td>
							<td>${brands.name }</td>
							<td>${brands.firstC }</td>
							<td>${brands.deletedFlag }</td>
							<td>
								<button class="btn btn-danger" value="${brands.id }">删除</button>
								<button type="button" class="btn btn-primary btn-md"
									data-toggle="modal" data-target="#myModal" id="zyx-update" value="${brands.id }">修改</button>
								<button type="button" class="btn btn-primary btn-md"
									data-toggle="modal" data-target="#myModal" id="zyx-look" value="${brands.id }">查看</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			${page }
		</div>
	</div>

	<!-- Modal功能按钮弹出部分 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color: rgba(250, 250, 255, 0.7);">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="zyx-form">
						<div class="form-group">
							<label for="addName" class="col-sm-3 control-label">品牌名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="name"
									placeholder="品牌名称">
									<p class="zyx-name"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="addFirstChar" class="col-sm-3 control-label">品牌首字母</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="firstC"
									placeholder="品牌首字母">
									<p class="zyx-firstC"></p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="zyx-submit"></button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var upd;
		
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
		
		$("button").click(function() {
			$("#myModalLabel").html($(this).html() + "品牌");
			$("#zyx-submit").html($(this).html());
			if($(this).prop("id")!="zyx-submit"){//这一部分是页面按钮的事件
				//协调隐藏显示
				if($(this).html()=="修改"){
					upd=$(this).val();
					$.post("/brand/brandLook",{"id":$(this).val()},function(res){
						$("#zyx-form [name='name']").val(res.name);
						$("#zyx-form [name='firstC']").val(res.firstC);
					},"json")
				}else if($(this).html()=="查看"){
					$.post("/brand/brandLook",{"id":$(this).val()},function(res){
						//协调显示
						hiddenForm("zyx-form");
						$("#zyx-submit").prop("style","display:none;");
						$(".zyx-name").html(res.name);
						$(".zyx-firstC").html(res.firstC);
					},"json")
				}else if($(this).html()=="删除"){
					$.post("/brand/brandDelete",{"ids":$(this).val()},function(res){
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
					$.post("/brand/brandDelete",{"ids":idss},function(res){
						if(res!=0){
							alert("删除成功");
							window.location.reload();
						}else{
							alert("未知原因，删除失败。")
						}
					})
				}
				$("#zyx-form input").val("");
				$("#zyx-submit").prop("style","display:inline;");
				lookForm("zyx-form");
			}else{//这一部分☞弹出窗里的按钮修改
				if($(this).html()=="新增"){
					$.post("/brand/brandInsert",$("#zyx-form").serialize(),function(res){
						if(res==1){
							alert("添加成功")
							window.location.reload();
						}else{
							alert("添加失败，请检查后重新添加")
						}
					})
				}else if($(this).html()=="修改"){
					$.post("/brand/brandUpdate",$("#zyx-form").serialize()+"&id="+upd,function(res){
						if(res==1){
							alert("修改成功")
							window.location.reload();
						}else{
							alert("修改失败，请检查后重新添加")
						}
					})
				}
			}
		})
		
		//隐藏部分标签，为了详情
		function hiddenForm(formName){
			$("#"+formName +" input ").prop("style","display:none;")
			$("#"+ formName+" p ").prop("style","display:block;")
		}
		//重新显示标签
		function lookForm(formName){
			$("#"+ formName+" input ").prop("style","display:inline;")
			$("#"+formName +" p ").prop("style","display:none;")
		}
	</script>
</body>
</html>
