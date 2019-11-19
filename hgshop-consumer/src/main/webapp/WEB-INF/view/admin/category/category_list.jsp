<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>hgshop后台管理系统</title>
<base href="<%=request.getContextPath()%>/">
<!-- Bootstrap core CSS -->
<link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resource/css/bootstrap-treeview.css" />
<script type="text/javascript" src="resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/js/bootstrap-treeview.js"></script>
</head>
<body style="background-color: rgba(250, 250, 255, 0.3);">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-5">
				<h3>展示分类列表</h3>
				<div id="tree"></div>
			</div>
			<div class="col-sm-7">
				<h3 id="zyx-add-tt">分类添加操作</h3>
				<form class="form-horizontal" id="addForm">
					<div class="form-group">
						<label for="pname" class="col-sm-3 control-label">父分类</label>
						<div class="col-sm-9">
							<input type="text" class="form-control pname" id="pname"
								placeholder="父分类"> <input type="hidden" name="parentId"
								class="pid" />
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">分类名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="分类名称">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-10">
							<button class="btn btn-success" id="zyx-category-add">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
						</div>
					</div>
				</form>




				<h3>分类修改操作</h3>
				<form class="form-horizontal" id="updateForm">
					<input type="hidden" name="id" id="updateId" class="pid" /> <input
						type="hidden" name="parentId" id="updateParentId" />
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">分类名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control pname" name="name"
								id="updateName" placeholder="分类名称">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-10">
							<button class="btn btn-success" id="zyx-category-up">修改选中节点</button>
						</div>
					</div>
				</form>

				<h3>删除操作</h3>
				<div class="row">
					<div class="col-sm-offset-10">
						<button class="btn btn-danger" id="zyx-category-del">删除选中节点</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var text;
		$(function() {
			$.post("/category/getcategorys", function(res) {
				var defaultData = res;
				$('#tree').treeview(
						{
							expandIcon : "glyphicon glyphicon-star",
							collapseIcon : "glyphicon glyphicon-star-empty",
							emptyIcon : "glyphicon glyphicon-piggy-bank",
							onhoverColor : "rgba(0, 0, 0, 0.3)",
							color : "white",
							selectedBackColor : "rgba(0, 0, 0, 0.6)",
							backColor : "rgba(255, 255, 255, 0.3)",
							data : defaultData,
							onNodeSelected : function(event, node) {
								text = node.text;
								$(".pname").val(node.text);
								$(".pid").val(node.id);
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

			//这一段是为了添加第一级的分类
			$("#pname").change(function() {
				if ($(this).val() != text) {
					$("#name").removeAttr("name");
					$("#name").prop("disabled", "disabled");
					$(this).prop("name", "name");
					$("[name='parentId']").val(1);
					$("#zyx-add-tt").text("顶级分类添加操作");
				} else {
					$("#name").removeAttr("disabled");
					$("#name").prop("name", "name");
					$("this").removeAttr("name");
					$("#zyx-add-tt").text("分类添加操作");
				}
			})

			//这是进行添加的操作
			$("#zyx-category-add").click(
					function() {
						$.post("/category/addcategory", $("#addForm")
								.serialize(), function(res) {
							if (res != 0) {
								alert("添加成功");
								window.location.reload();
							} else {
								alert("添加失败");
							}
						})
					})

			//这是进行修改的操作
			$("#zyx-category-up").click(
					function() {
						$.post("/category/upcategory", $("#updateForm")
								.serialize(), function(res) {
							if (res != 0) {
								alert("修改成功");
								window.location.reload();
							} else {
								alert("修改失败");
							}
						})
					})

			//这是进行删除的操作
			$("#zyx-category-del").click(function() {
				$.post("/category/delcategory", {
					"id" : $(".pid").val()
				}, function(res) {
					if (res != 0) {
						alert("删除成功");
						window.location.reload();
					} else {
						alert("删除失败");
					}
				})
			})
		});
	</script>
</body>
</html>
