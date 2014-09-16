<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>链接管理</title>
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
		var url = 'managerFriendlink.do';
		location = url;
	}
	
	function edit(id) {
		var url = 'editFriendlink.do?bid=' + (id ? id : '');
		location = url;
	}
	
	function del(id){
    		confirms("确认删除","deleteFriendlinkInfo.do?id=" + ( id ? id : ''));
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
								链接管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							链接内容列表
						</li>
					</ul>
				</div>
				
	<form action="listFriendlinkInfo.do" name="myForm" id="myForm" method="post">
	<div id="page-content" class="clearfix">
		
			<div class="tools_bar">
				<a href="javascript:void(0);" onclick="add();" class="tools_btn">
					<span><b class="add">添加</b></span>
				</a>
			</div>
			<div class="page-header position-relative">
				网站名称：<input type="text" name="siteName" class="small2" value="${queryParam.siteName}" />
				
				添加者：<input type="text" name="userName" class="small2" value="${queryParam.userName}" />
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
					    <th>图片</th>
						<th>名称</th>			
						<th>发布人</th>
						<th>描述</th>
						<th>点击次数</th>
						<th>排列顺序</th>
					   <th>添加时间</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>
		<c:forEach items="${list}" var="requirement">
                        <tr>
							<td>${requirement.friendlinkId}</td>
							<td><img id="attchmentImage"  height="100" width="100" src="../resAttachmentController/viewImage.do?attachmentId=${requirement.imageId}" /> </td>
							<td>${requirement.siteName}</td>
							<td>${requirement.userName}</td>
							<td>${requirement.description}</td>
							<td>${requirement.views}</td>
							<td>${requirement.priority}</td>
							<td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${requirement.createTime}"/></td>
							<td class="handle">
	                        <span class="iconfont show" onclick="view(${requirement.domain});"><a href="${requirement.domain}" target="_blank"><i class="fa fa-eye"></i></a></span>                   
	                    	<span class="iconfont update" onclick="edit(${requirement.friendlinkId});"><i class="fa fa-edit"></i></span>
	                    	<span class="iconfont deletes" onclick="del(${requirement.friendlinkId});"><i class="fa fa-trash-o"></i></span>	              
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