<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>广告版位修改</title>
<meta http-equiv="content" content="text/html" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="../css/staff-add.css" />
<script type="text/javascript">
function init()
{
<c:if test="${not empty message}"> 
	alert('${message}');
</c:if>
}
</script>
</head>
<body onload="init()">

		<div class="content-right-add">
		<c:if test="${type=='edit'}">
			<form id="myForm" action="saveAdvertisingSpace.do?type=edit" method="post">
			<h3>修改</h3>
			<div class="content-right-addinfo">
				<p>基本信息</p>
				<ul>		
				 <li> <span>版位名称：</span> <input type="text" name="adName"
						value="${newsAdvertisingSpace.adName}" /> </li>
						<li>  <input type="hidden" name="id"
						value="${newsAdvertisingSpace.adspaceId}" /> </li>					
						
	               <li> <span>  启用状态：</span>
                   <select name="isEnabled">
					<option value=""
						<c:if test="${''==newsAdvertisingSpace.isEnabled}">selected="selected"</c:if>>全部</option></li>
					<option value="0"
						<c:if test="${'0'==newsAdvertisingSpace.isEnabled}">selected="selected"</c:if>>停用</option></li>
					<option value="1"
					<c:if test="${'1'==newsAdvertisingSpace.isEnabled}">selected="selected"</c:if>>启用</option></li>
				</select>
				<li> <span>描述：</span> <input type="text" name="description"
						value="${newsAdvertisingSpace.description}" /> </li>
						<li> 
				
				</ul>
				<div class="content-right-addinfo-sure">
					<button class="button1" onclick="submit()">保存提交</button>
					<button class="button2"
						onclick="location='listAdvertisingSpaceInfo.do?page=1&limit=10';return false;">取消返回</button>
				</div>
			</div>
			</form>
			</c:if>
			
			<c:if test="${type=='detail'}">
			<h3>详细</h3>
			<div class="content-right-addinfo">
				<p>基本信息</p>
				<ul>		
				 <li> <span>版位名称：</span> <input type="text" name="adName"
						value="${newsAdvertisingSpace.adName}" /> </li>
						<li>  <input type="hidden" name="id"
						value="${newsAdvertisingSpace.adspaceId}" /> </li>					
						
	               <li> <span>  启用状态：</span>
                   <select name="isEnabled">
					<option value=""
						<c:if test="${''==newsAdvertisingSpace.isEnabled}">selected="selected"</c:if>>全部</option></li>
					<option value="0"
						<c:if test="${'0'==newsAdvertisingSpace.isEnabled}">selected="selected"</c:if>>停用</option></li>
					<option value="1"
					<c:if test="${'1'==newsAdvertisingSpace.isEnabled}">selected="selected"</c:if>>启用</option></li>
				</select>
				<li> <span>描述：</span> <input type="text" name="description"
						value="${newsAdvertisingSpace.description}" /> </li>
						<li> 				
				</ul>
				<div class="content-right-addinfo-sure">
					<button class="button2"
						onclick="location='listAdvertisingSpaceInfo.do?page=1&limit=10';return false;">取消返回</button>
				</div>
			</div>
			</c:if>
			
			
			
		<c:if test="${type=='insert'}">
	<form id="myForm" action="saveAdvertisingSpace.do?type=insert" method="post">
			<h3>添加</h3>
			<div class="content-right-addinfo">
				<p>基本信息</p>
				<ul>		
					<li><span><h3>版位名称：</h3></span> <input type="text" id="name" name="adName"
						 /> <span class="error">请输入正确标题</span>
					</li>								
						
	               <li> <span>  启用状态：</span>
                   <select name="isEnabled">
					<option value="0">停用</option></li>
					<option value="1">启用</option></li>
				</select>
				   <li> <span>  描述：</span>
				   <textarea  style="width:50%;height:50%;" id="description" name="description">			   
				   </textarea>
				</li>			
				</ul>
				<div class="content-right-addinfo-sure">
					<button class="button1" onclick="submit()">保存提交</button>
					<button class="button2"
						onclick="listAdvertisingSpaceInfo.do?page=1&limit=10';return false;">取消返回</button>
				</div>
			</div>
				</form>
			</c:if>
		</div>

</body>
</html>