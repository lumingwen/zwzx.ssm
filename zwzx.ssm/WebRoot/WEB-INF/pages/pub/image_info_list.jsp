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
    function add() {
		var url = 'addImageNews.do';
		location = url;
	}
    	
    	function search(page){
    		$('input[name="page"]').val(page?page:1);
    		$('#myForm').submit();
    	}
    	
    </script>
</head>
<body onload="init()">
<form action="listImageInfo.do" name="myForm" id="myForm" method="post"  style="height:100%;">
	<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								图片新闻管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							图片列表
						</li>
					</ul>
				</div>  
				
				
				       
<div id="page-content" class="clearfix">
          <div class="tools_bar">
				<a href="javascript:void(0);" onclick="add();" class="tools_btn">
					<span><b class="add">添加</b></span>
				</a>
			</div>
			<div class="page-header position-relative">
         图片标题：<input type="text" class="small1" name="title" value="${queryParam.title}" />		
				&nbsp;
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
						<th>图片标题</th>
		                <th>图片来源</th>
                        <th>创建时间</th>
		                <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${imageList}" var="dto">
            	<tr>
	                <td>${dto.id}</td>
	                <td>${dto.title}</td>
	                <td>${dto.source}</td>
	                <td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${dto.createTime}"/></td>
	    
	                <td class="handle">
	                    <a href="#" onclick="del('${dto.id}' )">删除</a>
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