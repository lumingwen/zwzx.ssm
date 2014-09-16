<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>字典目录</title>
    <meta http-equiv="content" content="text/html" charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
    <script type="text/javascript">
    	function init(){
    		
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
								系统管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							字典管理列表
						</li>
					</ul>
				</div>         
<div id="page-content" class="clearfix">
			<div class="tools_bar">
				<span><b class="add">字典目录</b></span>
			</div>
			<table id="table_bug_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>目录名称</th>
                <th>目录代码</th>
                <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${dictMap}" var="dto">
            	<tr>
	                <td style="text-align: left;">${dto.value}</td>
	                <td>${dto.key}</td>
	                <td class="handle">
	                	<a href="editDict.do?type=${dto.key}">树形设置</a>
	                    <a href="contentList.do?type=${dto.key}&limit=10">列表设置</a>
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
	
</form>	
</body>

</html>