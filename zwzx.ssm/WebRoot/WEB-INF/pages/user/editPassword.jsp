<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title></title>
		<meta http-equiv="content" content="text/html" />
		<!--<link rel="stylesheet" type="text/css" href="../css/staff-show.css" />
		<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="../js/checkInput.js"></script>
		<script type="text/javascript" src="../js/artDialog/artDialog.js"></script>
		<script type="text/javascript" src="../js/artDialog/plugins/iframeTools.js"></script>-->
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/staff-add.css" />
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
		<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			function sure() {
				var passwords = $("#old").val();
				$.ajax({
					type : "POST",
					async : false,
					url : "../user/checkPassword.do",
					data : "password=" + passwords,
					dataType : "text",
					success : function(msg) {
						if (msg == 'n') {
							alert("原密码输入错误!");
						} else if (msg == 'y') {		
							saves();
						}
					}
				});
			}

			function saves() {
				$("#form1").validate({
					errorPlacement : function(lable, element) {
						element.ligerTip({
							content : lable.html(),
							appendIdTo : lable
						});
					},
					success : function(lable) {
						lable.ligerHideTip();
						lable.remove();
					}
				});
				var password = $('#password').val();
				if ($("#form1").valid()) {
					$.ajax({
						type : 'POST',
						async : false,
						url : "../user/savePassword.do",
						data : "password=" + password,
						dataType : "text",
						success : function(msg) {
							if (msg == 'y') {
								alert("密码保存成功");
								window.parentWindow.close();
							} else {
								alert("更改失败，请重新保存");
							}
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<form action="" id="form1">
		<div class="content-right-add">
				<h3>修改密码</h3>
			<div class="content-right-addinfo">
				<p>基本信息</p>
			<table border="0" cellspacing="0" cellpadding="0" class="from_table">
				<tbody>
					<tr>
						<th>密码：</th>
						<td>
						<input name="old" class="small2 txtInput required" type="password" id="old" />
						</td>
					</tr>
					<tr></tr>
					<tr>
						<th>新密码：</th>
						<td>
						<input type="password" name="password"
						id="password" class="txtInput small2 {required:true,minlength:6}"/>
						</td>
					</tr>
					<tr>
						<th> 确定密码： </th>
						<td>
						<input type="password" name="password2" id="password2" class="txtInput small2 {equalTo:'#password'}" />
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			</div>
				<div class="content-right-addinfo-sure">
					<button class="button1" onclick="sure()">保存提交</button>
					<button class="button2"
						onclick="location='list.do?limit=10&page=1';return false;">取消返回</button>
			</div>
			<script type="text/javascript" src="../js/function.js"></script>
			<script src="../js/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
		</form>
	</body>
</html>