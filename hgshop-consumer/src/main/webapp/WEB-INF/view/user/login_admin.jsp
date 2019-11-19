<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=request.getContextPath()%>/">
<meta charset="UTF-8">
<title>管理员登录页面</title>

<link rel="stylesheet"
	href="resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/bootstrapValidator.min.css">
<link rel="stylesheet"
	href="resource/css/loginstyle.css">

<link rel="stylesheet"
	href="resource/css/mouse.css">
<script type="text/javascript"
	src="resource/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resource/js/bootstrapValidator.min.js"></script>


</head>
<body>
	<!-- 鼠标特效标签 -->
	<canvas></canvas>
	<!-- 总标签 -->
	<div class="container" id="index-login">
		<!-- 中间登录部分 -->
		<div class="form row">
			<!-- 登录表单 -->
			<form onsubmit="return false">
				<div class="form-horizontal col-md-offset-3" id="login_form">
					<h3 class="form-title">LOGIN</h3>
					<div class="col-md-9">
						<div class="form-group">
							<i class="fa fa-user fa-lg"></i> <input
								class="form-control required" type="text" placeholder="Username"
								id="username" name="username" autofocus="autofocus"
								maxlength="20" />
						</div>
						<div class="form-group">
							<i class="fa fa-lock fa-lg"></i> <input
								class="form-control required" type="password"
								placeholder="Password" id="password" name="password"
								maxlength="8" />
						</div>
						<div class="form-group">
							<label class="checkbox"> <input type="checkbox"
								name="remember" value="1" />记住我
							</label>
						</div>
						<div class="form-group col-md-offset-9">
							<button type="submit" class="btn btn-success pull-right"
								name="login">登录</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<audio src="resource/music/123.mp3"
		autoplay="autoplay"></audio>
	<script>
		$(function() {
			$('form').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					username : {
						message : '用户名验证失败',
						validators : {
							notEmpty : {
								message : '<font size="5px">用户名不能为空</font>'
							}
						}
					},
					password : {
						validators : {
							notEmpty : {
								message : '<font size="5px">密码不能为空</font>'
							}
						}
					}
				}
			});
		}).on("success.form.bv",function(e){
			$.post("/user/adminIndex",$("form").serialize(),function(res){
				if(res){
					window.location.href="/admin/toadminIndex";
				}else{
					alert("用户名或者密码不正确");
					window.location.reload();
				}
				
			})
		});
	</script>
	<script src="resource/js/mouse.js"></script>
</body>
</html>