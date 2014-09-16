<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>需求管理</title>
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

	//获取json
	function sendAllTypeAjax(pId) {
		if(pId==0)
		{
			
		 //获得XML文档中的所有<select>标记 
          var select_root = document.getElementById('newsType'); 
          //获得网页中的第二个下拉框 
          select_root.options.length=0;
          var option = new Option("全部", ""); 		
		  select_root.add(option);
		}else{
		$.ajax({
			type : "post",
			url : '../dict/queryNewsType.do?pId='+pId,
			async : false,
			success : function(data) {
			    //获得XML文档中的所有<select>标记 
                var select_root = document.getElementById('newsType'); 
                //获得网页中的第二个下拉框 
                if( data.length>0)
                {
                  select_root.options.length=0; 
                  var option = new Option("全部", ""); 		
       		      select_root.add(option); 
                 }else
                {
                 select_root.options.length=0; 
                 var option = new Option("全部", ""); 		
       		      select_root.add(option); 
                 }
                
			    for (var i = 0; i < data.length; i++) {
					var cid = data[i].id;
					var cname = data[i].cname;
					//添加子节点  
					var option = new Option(cname, cid); 	
					
					select_root.add(option);
				}
			  	  
			},
			error : function(data) {
			    alert('error');
			}
		});
	}}
	
	
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
			window.open('findBroadcastById.do?bid='+(id?id:''));
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
								旅客播报管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							内容列表
						</li>
					</ul>
				</div>
	<form action="listBroadcastInfo.do" name="myForm" id="myForm" method="post">
	<div id="page-content" class="clearfix">
		
			<div class="tools_bar">
				<a href="javascript:void(0);" onclick="add();" class="tools_btn">
					<span><b class="add">添加</b></span>
				</a>
			</div>
			<div class="page-header position-relative">
			  类型：
			   <select name="contentTypeId" onchange="sendAllTypeAjax(this.value)">
			   <option value=""  selected = "selected">全部</option> 
				    <c:forEach items="${contenttypelist}" var="contentTypelist">
									    <c:choose>
                   <c:when test="${contentTypelist.id eq queryParam.contentTypeId}">
                   <option value="${contentTypelist.id}"  selected = "selected">${contentTypelist.cname }</option>   
                  </c:when>
                  <c:otherwise>
                  <option value="${contentTypelist.id}" >${contentTypelist.cname }</option>
                </c:otherwise>
  
                 </c:choose>
				  </c:forEach>
			     </select>
			     
	               <select  name="newsTypeId" id="newsType">
	                <option value=""  selected = "selected">全部</option>
				   <c:forEach items="${newstypelist}" var="newstypelist">
					
				     <c:choose>
                   <c:when test="${newstypelist.id eq queryParam.newsTypeId}">
                   <option value="${newstypelist.id}"  selected = "selected">${newstypelist.cname }</option>   
                  </c:when>
                  <c:otherwise>
                 <option value="${newstypelist.id}" >${newstypelist.cname }</option>
                </c:otherwise>
                 </c:choose>			  
				  </c:forEach>
			     </select> 
			
			
				名称：<input type="text" name="title" class="small2" value="${queryParam.title}" />
				发布人：<input type="text" name="userName" class="small2" value="${queryParam.userName}" />
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
						<th>发布人</th>
						<th>内容类型</th>
						<th>新闻类型</th>
						<th>添加时间</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>
		<c:forEach items="${list}" var="requirement">
                        <tr>
							<td>${requirement.id}</td>
							<td>${requirement.title}</td>
							<td>${requirement.userName}</td>
							<td>${requirement.contentTypeName}</td>
							<td>${requirement.newsTypeName}</td>
							<td><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${requirement.createTime}"/></td>
							<td class="handle">
	                        <span class="iconfont show" onclick="view(${requirement.id});"><i class="fa fa-eye"></i></span>                   
	                    	<span class="iconfont update" onclick="edit(${requirement.id});"><i class="fa fa-edit"></i></span>
	                    	<span class="iconfont deletes" onclick="del(${requirement.id});"><i class="fa fa-trash-o"></i></span>	              
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

	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</form>
</body>
</html>