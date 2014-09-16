<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户管理</title>
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
		var url = 'addBroadcast.do';
		location = url;
	}
	
	function edit(id) {
		var url = 'editBroadcast.do?bid=' + (id ? id : '');
		location = url;
	}
	
	function del(id){
    		confirms("确认删除","deleteBroadcastInfo.do?id=" + ( id ? id : ''));
    	}
    	
	function view(id){
			location = 'findBroadcast.do?bid='+(id?id:'');
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
								用户管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							用户列表
						</li>
					</ul>
				</div>
	<form action="listBroadcastInfo.do" name="myForm" id="myForm" method="post">
	<div id="page-content" class="clearfix">
		
			<div class="tools_bar">
				<a href="javascript:void(0);" onclick="add();" class="tools_btn">
					<span><b class="add">添加</b></span>
				</a>
				<a id="btnSave" class="tools_btn" onclick="alerts('success','保存成功!')" href="javascript:__doPostBack('btnSave','')">
					<span><b class="send">保存排序</b></span>
				</a>
				<a href="javascript:void(0);" onclick="checkAll(this);" class="tools_btn">
					<span><b class="all">全选</b></span>
				</a>
				<a onclick="return confirms('你确定要删除信息吗?')" id="btnDelete" class="tools_btn" href="javascript:void()">
					<span><b class="delete">批量删除</b></span>
				</a>
			</div>
			<div class="page-header position-relative">
				 编号：<input type="text" name="title" class="small2" value="${queryParam.title}" />
				 姓名：<input type="text" name="userName" class="small2" value="${queryParam.userName}" />
				 状态：<input type="text" name="userName" class="small2" value="${queryParam.userName}" />
				 创建时间：<input type="text" name="createTimeStart" class="small7" value="${queryParam.createTimeStart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>至<input type="text" name="createTimeEnd" value="${queryParam.createTimeEnd}" class="small7" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
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
						<th>姓名</th>
						<th>状态</th>
						<th>创建时间</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>
		<c:forEach items="${userList}" var="list">
                        <tr>
							<td>${list.id}</td>
							<td>${list.name}</td>
							<c:if test="${list.status==0}">
							<td>不可用</td>
							</c:if>
							<c:if test="${list.status==1}">
							<td>可用</td>
							</c:if>
							<td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${list.createTime}"/></td>
							<td class="handle">
	                        <span class="iconfont show" onclick="view(${list.id});"><i class="fa fa-eye"></i></span>                   
	                    	<span class="iconfont update" onclick="edit(${list.id});"><i class="fa fa-edit"></i></span>
	                    	<span class="iconfont deletes" onclick="del(${list.id});"><i class="fa fa-trash-o"></i></span>	              
	                        </td>
					  </tr>
       </c:forEach>
</tbody>
</table>
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

	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

</form>
</body>
</html>