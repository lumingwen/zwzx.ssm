<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="content" content="text/html" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="../css/staff-add.css" />

</head>
<body onload="init()">

	<form id="myForm" action="edit.do" method="post">
		<input type="hidden" name="id" value="${user.id}" />

		<div class="content-right-add">

			<h3>添加</h3>
			<div class="content-right-addinfo">
				<p>基本信息</p>
				<ul>
					<li><span>用户名：</span> <input type="text" name="name"
						value="${user.name}" /> <span class="error">请输入正确用户名</span>
					</li>
					<li><span>用户类型：</span> <select name="userType">
							<option value="1"
								<c:if test="${1 eq user.userType}">selected="selected"</c:if>>超级管理员</option>
							
							<option value="2"
								<c:if test="${2 eq user.userType}">selected="selected"</c:if>>游客</option>
							
							<option value="3"
								<c:if test="${3 eq user.userType}">selected="selected"</c:if>>普通管理员</option>
					</select>
					</li>

					<c:if test="${user.id eq null}">

						<li><span>密码：</span> <input type="password" name="password" />
							<span class="error">请输入正确密码</span>
						</li>
						<li><span>重复密码：</span> <input type="password"
							name="password2" /> <span class="error">两次填写不一致</span>
						</li>
					</c:if>
				</ul>

				<div class="content-right-addinfo-sure">
					<button class="button1" onclick="submitForm();return false;">保存提交</button>
					<button class="button2"
						onclick="location='list.do?limit=10&page=1';return false;">取消返回</button>
				</div>
			</div>
		</div>

	</form>
	<!--添加新员工完-->
	<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../js/checkInput.js"></script>
	<script type="text/javascript">    
	    function init(){
			<c:if test="${not empty message}"> 
				alert('${message}');
			</c:if>
		}    
    	function submitForm(){
    		try{
    			var flag = true;
    			if (!notNull($('input[name="username"]'),"请输入用户名")){
    				flag=false;
    			}
    			 <c:if test="${user.id eq null}"> 
    			if (!notNull($('input[name="password"]'),"请输入密码")){
    				flag=false;
    			}
    			if (!notNull($('input[name="password2"]'),"请重复输入密码")){
    				flag=false;
    			}
    			if ($.trim($('input[name="password"]').val())!=$.trim($('input[name="password2"]').val())){
    				throw new Error('两次输入密码不一致!');
    			}
    			</c:if>
    			if(flag){$('#myForm').submit();}
    			
    		}catch(e){
    			alert(e.message);
    		}
    	}
    </script>
</body>

</html>