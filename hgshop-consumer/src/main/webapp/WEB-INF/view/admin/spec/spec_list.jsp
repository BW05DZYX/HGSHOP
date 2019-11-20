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
<link href="resource/bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="background-color: rgba(250, 250, 255, 0.3);">
	<div class="container-fluid">
		<div class="row">
			<form action="/spec/tospec" method="post">
				<div class="form-group">
					<label for="specName">规格名称</label> <input type="text"
						class="form-control" name="specName" placeholder="规格名称">
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
						<th>规格名称</th>
						<th>规格选项</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${specsPage.list }" var="spec">

						<tr>
							<td><input type="checkbox" class="ck" value="${spec.id }" /></td>
							<td>${spec.id }</td>
							<td>${spec.specName }</td>
							<td>${spec.optionNames }</td>
							<td>
								<button class="btn btn-danger" value="${spec.id }">删除</button>
								<button type="button" class="btn btn-primary btn-md"
									data-toggle="modal" data-target="#myModal" value="${spec.id }">修改</button>
								<button type="button" class="btn btn-primary btn-md"
									data-toggle="modal" data-target="#myModal" value="${spec.id }">查看</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			${page }
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div id="zyx-modal-body"></div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm">
						<div class="form-group">
							<label for="addSpecName" class="col-sm-3 control-label">规格名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="specName" id="addSpecName"
									placeholder="规格名称">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3" id="zyx-option">
								<input type="button" class="btn btn-info" value="增加选项内容"
									onclick="addOption()" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="zyx-spec-submit"></button>
				</div>
			</div>
		</div>
	</div>
	<script>
		var idUp;
		$("button").click(function(){
			
			$("#zyx-spec-submit").html($(this).html());
			$("#myModalLabel").html($(this).html()+"规格参数");
			if($(this).prop("id")=="zyx-spec-submit"){
				if($(this).html()=="新增"){
					$.post("/spec/insertspec",$("#addForm").serialize(),function(res){
						if(res!=0){
							alert("添加成功");
							window.location.reload();
						}else{
							alert("添加失败");
						}
					})
				}else if($(this).html()=="修改"){
					$.post("/spec/updatespec",$("#addForm").serialize()+"&id="+idUp,function(res){
						if(res!=0){
							alert("修改成功");
							window.location.reload();
						}else{
							alert("修改失败");
						}
					})
				}
			}else{
				$("[name='specName']").val("");
				$("[data-option-id='0']").remove();
				if($(this).html()=="查看"){
					$.post("/spec/lookspec",{"id":$(this).val()},function(res){
						$(".modal-body").prop("style","display:none;");
						$("#zyx-modal-body").html('<div>规格名称:'+res.specName+'</div><div>规格选项有:'+res.optionNames+'</div>')
						$("#zyx-spec-submit").prop("style","display:none;");
					},"json")
				}else if($(this).html()=="修改"){
					idUp=$(this).val();
					$.post("/spec/lookspec",{"id":idUp},function(res){
						$("#addForm [name='specName']").val(res.specName);
						var s=res.optionNames.split(",");
						for(var i in s){
							$("#addForm").append($('<div class="form-group" data-option-id='+0+'><label class="col-sm-3 control-label">规格内容</label><div class="col-sm-6"><input type="text" class="form-control" name="optionNames" placeholder="请输入规格内容" value="'+s[i]+'"></div><div class="col-sm-3"><input type="button" class="btn-danger" value="删除" onclick="deleteOption(this)"/></div></div>'))
						}
					},"json")
				}else if($(this).html()=="删除"){
					$.post("/spec/deletespec",{"ids":$(this).val()},function(res){
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
					$.post("/spec/deletespec",{"ids":idss},function(res){
						if(res!=0){
							alert("删除成功");
							window.location.reload();
						}else{
							alert("未知原因，删除失败。")
						}
					})
				}
				$(".modal-body").prop("style","display:block;");
				$("#zyx-modal-body").html("");
				$("#zyx-spec-submit").prop("style","display:inline;");
			}
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
	
		//增加选项
		function addOption() {
			//创建div的jquery对象
			var $div = $('<div class="form-group" data-option-id='+0+'><label class="col-sm-3 control-label">规格内容</label><div class="col-sm-6"><input type="text" class="form-control" name="optionNames" placeholder="请输入规格内容"></div><div class="col-sm-3"><input type="button" class="btn-danger" value="删除" onclick="deleteOption(this)"/></div></div>');
			//传递参数判断的操作
			//加入到指定的from表单中
			$("#addForm").append($div);
		}

		function deleteOption(obj) {
			//$(obj)代表的把Dom对象转换成jquery对象: 通过找到加入的div的jquery对象,通过jquery中的parent()方法，再通过jquery对象中的remove()把自己删除
			var $div = $(obj).parent().parent();
			//自定属性的获取方式
			var optionId = $div.data().optionId;
			//判断获取的结果
			if (optionId == 0) {
				$div.remove();
			} else {
				$.post('specOptionDelete', {
					id : optionId
				}, function(data) {
					if (data) {
						alert("选项删除成功");
						$div.remove();
					} else {
						alert("选项删除失败");
					}
				}, "json")
			}
		}
	</script>

</body>
</html>
