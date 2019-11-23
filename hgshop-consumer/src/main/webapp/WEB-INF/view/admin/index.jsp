<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=request.getContextPath()%>/">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="resource/css/admin.css">
<link rel="stylesheet"
	href="resource/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="resource/css/bootstrap-treeview.css" />
<script type="text/javascript"
	src="resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resource/js/bootstrap-treeview.js"></script>


</head>
<body>
	<!-- 引入头部 -->
	<jsp:include page="../common/top.jsp"></jsp:include>

	<div class="container-fluid" id="zyx-admin-all">
		<div id="zyx-admin-left-ng">
			<!-- 引入左侧导航 -->
			<jsp:include page="./common/left.jsp"></jsp:include>

		</div>
		<div id="zyx-admin-right-ct">
			<div id="zyx-admin-right-ct-tt">
				<span class="fontstyle">这里是控制中心，请不要乱动</span>
			</div>
			<div id="zyx-admin-right-ct-ct">
				<iframe src="" name="mainFrame" allowtransparency="true" width="100%" height="700px"
					frameborder="0" style="background: rgba(0, 0, 0, 0.2);"></iframe>
			</div>
		</div>
	</div>
	<script>
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
							levels:1,
							selectedBackColor : "rgba(22, 255, 32, 0.3)",
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
			
			$("#tree").prop("style","display:none;")
			
			$(".parent-a").click(function() {
				var flag = $(this).attr("aria-expanded");
				if (flag == "true") {
					$("#test").html("+&nbsp;&nbsp;&nbsp;");
				} else {
					$("#test").html("-&nbsp;&nbsp;&nbsp;");
				}
			})
			
			$(".selected-color a").click(function(){
				$(".selected-color").prop("style","background: rgba(0, 0, 0, 0.2);")
				$(this).parent().prop("style","background: rgba(50, 0,0, 1);")
			})
		})
		
		$("#zyx-tree").mouseenter(function(){
			$("#tree").prop("style","display:inline-block;")
				$("#tree").addClass("mytree");
		})
		
		$("#zyx-tree").mouseleave(function(){
			$("#tree").prop("style","display:none;")
		})
			
	</script>
</body>
</html>