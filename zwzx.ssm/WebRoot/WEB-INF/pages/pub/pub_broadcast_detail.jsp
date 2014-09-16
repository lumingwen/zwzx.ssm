<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>内容查看</title>
<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
<link rel="stylesheet" type="text/css" href="../css/staff-add.css" />
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="../js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../js/artDialog/artDialog.js"></script>
<script type="text/javascript"
	src="../js/artDialog/plugins/iframeTools.js"></script>
</head>
<body onload="init()">
  <div>
   <center><h1>${pubBroadcastContent.title }</h1><br>
       ${pubBroadcastContent.source } 
       <fmt:formatDate type="date" dateStyle="default" value="${pubBroadcastContent.createTime}"/>
      <br>
       ${pubBroadcastContent.content } 
   
   
   
   </center>
  
  
  
  </div>
       <script type="text/javascript">
		function save() {
			var valStr1 = $('input[name="title"]');
			var flag=true;
			if (!notNull(valStr1,"请输入标题")) {
				flag=false;
			}
			if (!editor.hasContents()) {
				alert('请输入内容!');
			}
			if (flag) {
				document.forms[0].submit();
			}
		}
		function cancel() {
			location = 'listBroadcastInfo.do?page=1&limit=10';
		}
	</script>
</body>
</html>