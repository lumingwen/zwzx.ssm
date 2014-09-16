<%@page import="com.shili.lu.common.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>评论内容</title>
    <meta http-equiv="content" content="text/html" charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
    	function init(){
    		
    	}
    	function del(id){
    	confirms("确认删除",'editComment.do?id='+id+'&deleteFlag=<%=Constants.DEL_FLAG_YES%>');
    	}
    	function userEdit(id,isRecommend){
    	if(isRecommend==1)
    	{
    	confirms("确认推荐",'editComment.do?id='+id+'&isRecommend=1');
    	}else
    	{
    	confirms("确认不推荐",'editComment.do?id='+id+'&isRecommend=0');
    	}
    	}
    	
    	function hotEdit(id,isChecked){
    	if(isChecked==1)
    	{
    	confirms("确认通过审核",'editComment.do?id='+id+'&isChecked=1');
    	}else
    	{
    	confirms("确认不通过审核",'editComment.do?id='+id+'&isChecked=0');
    	}
    	}
    	
    	function search(page){
    		$('input[name="page"]').val(page?page:1);
    		$('#myForm').submit();
    	}
    	
    </script>
</head>
<body onload="init()">
<form action="listNewsCommentInfo.do" name="myForm" id="myForm" method="post"  style="height:100%;">
	<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								新闻管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							评论列表
						</li>
					</ul>
				</div>         
<div id="page-content" class="clearfix">
			<div class="page-header position-relative">
         新闻标题：<input type="text" class="small1" name="title" value="${queryParam.title}" />		
				&nbsp;
          是否推荐：
        <select name="isRecommend">
        	<option value="" <c:if test="${''==queryParam.isRecommend}">selected="selected"</c:if>>所有</option>
            <option value="1" <c:if test="${1==queryParam.isRecommend}">selected="selected"</c:if>>是</option>
            <option value="0" <c:if test="${0==queryParam.isRecommend}">selected="selected"</c:if>>否</option>
        </select>
                       是否审核：
        <select name="isChecked">
        	<option value="" <c:if test="${''==queryParam.isChecked}">selected="selected"</c:if>>所有</option>
            <option value="1" <c:if test="${1==queryParam.isChecked}">selected="selected"</c:if>>是</option>
            <option value="0" <c:if test="${0==queryParam.isChecked}">selected="selected"</c:if>>否</option>
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
						<th>编号</th>
						<th>新闻标题</th>
		                <th>评论内容</th>
		                <th>评论时间</th>
		                <th>支持数</th>
		                <th>反对数</th>
		                <th>是否推荐</th>
		                <th>是否审核</th>
		                <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="dto">
            	<tr>
	                <td>${dto.commentId}</td>
	                <td>${dto.title}</td>
	                <td>${dto.text}</td>
	                <td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${dto.createTime}"/></td>
	                <td>${dto.ups}</td>
	                <td>${dto.downs}</td>
	                <td>
	                	<c:choose>
	                		<c:when test="${dto.isRecommend eq 0 or dto.isRecommend eq null}">否</c:when>
	                		<c:otherwise>是</c:otherwise>
	                	</c:choose>
	                </td>
	                <td>
	                	<c:choose>
	                	     <c:when test="${dto.isChecked  eq 0 or dto.isChecked eq null}">否</c:when>
	                		<c:otherwise>是</c:otherwise>
	                	</c:choose>
	                </td>
	                <td class="handle">
	                    <a href="#" onclick="del('${dto.commentId}' )">删除</a>
	                    <c:choose>
	                		<c:when test="${dto.isRecommend eq 0 }">
	                		<a href="#" onclick="userEdit('${dto.commentId}',1)">推荐
	                		</a></c:when>
	                		<c:otherwise>
	                		<a href="#" onclick="userEdit('${dto.commentId}',0)">不推荐              		
	                		</a></c:otherwise>
	                	</c:choose>
	                	<c:choose>
	                		<c:when test="${dto.isChecked eq 1}">
	                		<a href="#" onclick="hotEdit('${dto.commentId}',0)"> 		
	                		通过审核</a></c:when>
	                		<c:otherwise>
	                		<a href="#" onclick="hotEdit('${dto.commentId}',1)"> 
	                		取消审核</a></c:otherwise>
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