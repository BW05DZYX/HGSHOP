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
<script type="text/javascript"
	src="resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>


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

			$(".parent-a").click(function() {
				var flag = $(this).attr("aria-expanded");
				if (flag == "true") {
					$("#test").html("+&nbsp;&nbsp;&nbsp;");
				} else {
					$("#test").html("-&nbsp;&nbsp;&nbsp;");
				}
			})
			
			$(".selected-color").click(function(){
				$(".selected-color").prop("style","background: rgba(0, 0, 0, 0.2);")
				$(this).prop("style","background: rgba(50, 0,0, 1);")
			})
		})
	</script>
</body>
</html>