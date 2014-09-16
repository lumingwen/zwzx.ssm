<%@page import="com.shili.lu.common.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>字典内容</title>
    <meta http-equiv="content" content="text/html" charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
    <script type="text/javascript">
    	function init(){
    		
    	}
    	function del(type,id){
    	confirms("确认删除",'editDictContent.do?type='+type+'&id='+id+'&deleteFlag=<%=Constants.DEL_FLAG_YES%>');
    	}
    	function userEdit(type,id,status){
    	if(status==1)
    	{
    	confirms("确认启用",'editDictContent.do?type='+type+'&id='+id+'&status=1');
    	}else
    	{
    	confirms("确认停用",'editDictContent.do?type='+type+'&id='+id+'&status=0');
    	}
    	}
    	
    	function hotEdit(type,id,hotStatus){
    	if(hotStatus==1)
    	{
    	confirms("确认设为热门",'editDictContent.do?type='+type+'&id='+id+'&hotStatus=1');
    	}else
    	{
    	confirms("确认取消热门",'editDictContent.do?type='+type+'&id='+id+'&hotStatus=0');
    	}
    	}
    	
    	function search(page){
    		$('input[name="page"]').val(page?page:1);
    		$('#myForm').submit();
    	}
    	
    </script>
</head>
<body onload="init()">
<form action="contentList.do" name="myForm" id="myForm" method="post"  style="height:100%;">
<input type="hidden" name="type" value="${queryParam.type}" />
	<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								系统管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							字典内容列表
						</li>
					</ul>
				</div>         
<div id="page-content" class="clearfix">
			<div class="tools_bar">
				<a href="toEditDictContent.do?type=${queryParam.type}&pid=<%=Constants.TOP_PID%>"  class="tools_btn">
					<span><b class="add">添加</b></span>
				</a>
				<a id="btnSave" class="tools_btn" onclick="history.back()" href="javascript:void(0);">
					<span><b class="send">返回</b></span>
				</a>

				
			</div>
			<div class="page-header position-relative">
        名称：<input type="text" class="small1" name="cname" value="${queryParam.cname}" />		
				&nbsp;
                      是否热门：
        <select name="hotStatus">
        	<option value="" <c:if test="${''==queryParam.hotStatus}">selected="selected"</c:if>>所有</option>
            <option value="1" <c:if test="${1==queryParam.hotStatus}">selected="selected"</c:if>>是</option>
            <option value="0" <c:if test="${0==queryParam.hotStatus}">selected="selected"</c:if>>否</option>
        </select>
                       是否启用：
        <select name="status">
        	<option value="" <c:if test="${''==queryParam.status}">selected="selected"</c:if>>所有</option>
            <option value="1" <c:if test="${1==queryParam.status}">selected="selected"</c:if>>是</option>
            <option value="0" <c:if test="${0==queryParam.status}">selected="selected"</c:if>>否</option>
        </select>
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
						<th>全名</th>
						<th>名称</th>
		                <th>代码</th>
		                <th>拼音全名</th>
		                <th>拼音简写</th>
		                <th>首字母</th>
		                <th>状态</th>
		                <th>是否热门</th>
		                <th>序号</th>
		                <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="dto">
            	<tr>
	                <td>${dto.fullName}</td>
	                <td>${dto.cname}</td>
	                <td>${dto.code}</td>
	                <td>${dto.ename}</td>
	                <td>${dto.shortPy}</td>
	                <td>${dto.pyszm}</td>
	                <td>
	                	<c:choose>
	                		<c:when test="${dto.status eq 0 or dto.status eq null}">停用</c:when>
	                		<c:otherwise>启用</c:otherwise>
	                	</c:choose>
	                </td>
	                <td>
	                	<c:choose>
	                		<c:when test="${dto.hotStatus eq 1}">是</c:when>
	                		<c:otherwise></c:otherwise>
	                	</c:choose>
	                </td>
	                <td>${dto.orderIndex}</td>
	                <td class="handle">
	                    <a href="toEditDictContent.do?type=${dto.type}&pid=${dto.id}">新增子节点</a>
	                    <a href="toEditDictContent.do?type=${dto.type}&pid=${dto.pid}&id=${dto.id}">修改</a>
	                    <a href="#" onclick="del('${dto.type}','${dto.id}')">删除</a>
	                    <c:choose>
	                		<c:when test="${dto.status eq 0 or dto.status eq null}">
	                		<a href="#" onclick="userEdit('${dto.type}','${dto.id}',1)">启用
	                		</a></c:when>
	                		<c:otherwise>
	                		<a href="#" onclick="userEdit('${dto.type}','${dto.id}',0)">停用	                		
	                		</a></c:otherwise>
	                	</c:choose>
	                	<c:choose>
	                		<c:when test="${dto.hotStatus eq 1}">
	                		<a href="#" onclick="hotEdit('${dto.type}','${dto.id}',0)"> 		
	                		取消热门</a></c:when>
	                		<c:otherwise>
	                		<a href="#" onclick="hotEdit('${dto.type}','${dto.id}',1)"> 
	                		设为热门</a></c:otherwise>
	                	</c:choose>
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
		<script type="text/javascript" charset="utf-8">
		$("button[type=button]").click(function(){
				//alert("");
				var texts=$("input[type=text]");
				texts.val("");
				$("select").Option[0].selected=true;
			});
	</script>
</form>	
</body>

</html>