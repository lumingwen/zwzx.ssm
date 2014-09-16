<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>用户列表</title>
    <meta http-equiv="content" content="text/html" charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
    <script type="text/javascript">
    
    	function init(){
    		
    		<c:if test="${not empty message}"> 
    			<c:if test="${message=='1'}">
    				alerts('success','新增成功');
    			</c:if>
       			<c:if test="${message=='2'}">
					alerts('success','修改成功');
				</c:if>
	   			<c:if test="${message=='3'}">
					alerts('success','删除成功');
				</c:if>
    		</c:if>
    	}
    	
    	function edit(id){
    		var url = 'toEdit.do?userId='+(id?id:'');
    		location = url;
    		return false;
    	}
    	
    	function editPassword(id){
    		var url = 'editPassword.do?userId='+(id?id:'');
    		location = url;
    		return false;
    	}
    	
    	function del(id){
    		confirms("确认删除","delete.do?id=" + ( id ? id : ''));
    	}
    	
		function view(id){
			location = 'view.do?userId='+(id?id:'');
    	}
    	
    	function search(page){
    		$('input[name="page"]').val(page?page:1);
    		$('#myForm').submit();
    	}
    	
    </script>
</head>
<body onload="init()">
<form action="list.do" name="myForm" id="myForm" method="post"  style="height:100%;">
	<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								员工管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							员工列表
						</li>
					</ul>
				</div>
	<div id="page-content" class="clearfix">
			<div class="tools_bar">
				<a href="" onclick="return edit()" class="tools_btn">
					<span><b class="add">添加</b></span>
				</a>
			</div>
			<div class="page-header position-relative">
				 用户类型：
        <select name="userType">
        	<option value="" <c:if test="${''==queryParam.userType}">selected="selected"</c:if>>所有</option>
            <option value="1" <c:if test="${1==queryParam.userType}">selected="selected"</c:if>>超级管理员</option>
            <option value="3" <c:if test="${3==queryParam.userType}">selected="selected"</c:if>>普通管理员</option>
            <option value="2" <c:if test="${2==queryParam.userType}">selected="selected"</c:if>>游客</option>
        </select>
        用户名：<input type="text" class="small1" name="username" value="${queryParam.name}"/>
					
				&nbsp;
				<button class="iconfonts" onclick="search();return false;">
					<i class="fa fa-search"></i>&nbsp;搜索
				</button>
				<button class="iconfonts reset" type="button">
					<i class="fa fa-refresh"></i>&nbsp;重置
				</button>
			</div>
			<table id="table_bug_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
                <th>用户名</th>
                <th>用户类型</th>
                <th>创建时间</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
				</thead>
				<tbody>
				<c:forEach items="${userList}" var="user">
            	<tr>
	                <td>${user.name}</td>
	                <td>
	                	<c:choose>
	                		<c:when test="${1==user.userType}">超级管理员</c:when>
	                		<c:when test="${2==user.userType}">游客</c:when>
	                		<c:when test="${3==user.userType}">普通管理员</c:when>
	                	</c:choose>
	                </td>
	                <td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${user.createTime}"/></td>
	                <td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${user.updateTime}"/></td>
	                <td class="handle">
	                    <span class="iconfont show" onclick="view(${user.id});"><i class="fa fa-eye"></i></span>
	                    <c:if test="${sessionScope.loginUser.userType eq 1}">
	                    <c:if test="${user.id eq sessionScope.loginUser.id}">
	                    <span class="iconfont update" onclick="editPassword(${user.id});"><i class=" fa fa-wrench"></i></span>
	                    </c:if>
	                    	<c:if test="${user.id ne sessionScope.loginUser.id}">
	                    		<span class="iconfont update" onclick="edit(${user.id});"><i class="fa fa-edit"></i></span>
	                    		<span class="iconfont deletes" onclick="del(${user.id});"><i class="fa fa-trash-o"></i></span>
	                    	</c:if>
	                    </c:if>
	                </td>
	            </tr>
            </c:forEach>
				</tbody>
			</table>
			 <div class="content-right-page">
		${pagestr}
    </div>
			</div>
	</form>
	<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../js/function.js"></script>
		<script type="text/javascript" charset="utf-8">
		$("button[type=button]").click(function(){
				//alert("");
				var texts=$("input[type=text]");
				texts.val("");
				$("select").Option[0].selected=true;
			});
	</script>
</body>

</html>