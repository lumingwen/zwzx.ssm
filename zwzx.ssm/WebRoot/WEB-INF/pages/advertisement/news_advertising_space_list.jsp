<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>广告管理</title>
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
<script type="text/javascript">
	function init() {
		<c:if test="${not empty message}">
			<c:if test="${message=='1'}">
				alerts('success','修改成功!');
			</c:if>
		</c:if>
	}

	function add() {
		var url = 'addAdvertisingSpace.do';
		location = url;
	}
	
	function edit(id) {
		var url = 'editAdvertisingSpace.do?bid=' + (id ? id : '');
		location = url;
	}
	
	function del(id){
    		confirms("确认删除","deleteAdvertisingSpaceInfo.do?id=" + ( id ? id : ''));
    	}
    	
	function view(id){
		   var url ='findAdvertisingSpaceById.do?bid=' + (id ? id : '');
			location=url;
    }
	function search(page) {
		$('input[name="page"]').val(page ? page : 1);
		$('#myForm').submit();
	}
</script>
</head>
<body onload="init()">
	<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								广告版位管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							内容列表
						</li>
					</ul>
				</div>
	<form action="listAdvertisingSpaceInfo.do" name="myForm" id="myForm" method="post">
	<div id="page-content" class="clearfix">
		
			<div class="tools_bar">
				<a href="javascript:void(0);" onclick="add();" class="tools_btn">
					<span><b class="add">添加</b></span>
				</a>
			</div>
			<div class="page-header position-relative">
				编号：<input type="text" name="adName" class="small2" value="${queryParam.adName}" />
				添加者：<input type="text" name="userName" class="small2" value="${queryParam.userName}" />
				启用状态：
                   <select name="isEnabled">
					<option value=""
						<c:if test="${''==queryParam.isEnabled}">selected="selected"</c:if>>全部</option>
					<option value="0"
						<c:if test="${'0'==queryParam.isEnabled}">selected="selected"</c:if>>停用</option>
					<option value="1"
						<c:if test="${'1'==queryParam.isEnabled}">selected="selected"</c:if>>启用</option>
				</select>
				添加时间：<input type="text" name="createTimeStart" class="small7" value="${queryParam.createTimeStart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>至<input type="text" name="createTimeEnd" value="${queryParam.createTimeEnd}" class="small7" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
				&nbsp;&nbsp;
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
					    <th>编号：</th>
						<th>名称</th>
						<th>描述</th>
						<th>发布人</th>
						<th>启用状态</th>
						<th>添加时间</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>
		<c:forEach items="${list}" var="requirement">
                        <tr>
							<td>${requirement.adspaceId}</td>
							<td>${requirement.adName}</td>
							<td>${requirement.description}</td>
							<td>${requirement.userName}</td>
							<c:if test="${requirement.isEnabled==1}">
							<td>启用</td>			
							</c:if>
							<c:if test="${requirement.isEnabled==0}">
							<td>停用</td>			
							</c:if>							
							<td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${requirement.createTime}"/></td>
							<td class="handle">
	                        <span class="iconfont show" onclick="view(${requirement.adspaceId});"><i class="fa fa-eye"></i></span>                   
	                    	<span class="iconfont update" onclick="edit(${requirement.adspaceId});"><i class="fa fa-edit"></i></span>
	                    	<span class="iconfont deletes" onclick="del(${requirement.adspaceId});"><i class="fa fa-trash-o"></i></span>	              
	                        </td>
					  </tr>
       </c:forEach>
</tbody>
</table>
			
 <div class="content-right-page">
		${pagestr}
    </div>
			</div>
	<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../js/function.js"></script>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

</form>
</body>
</html>