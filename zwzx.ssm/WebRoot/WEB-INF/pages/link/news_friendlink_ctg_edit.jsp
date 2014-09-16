<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="content" content="text/html" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="../css/staff-add.css" />
<link rel="stylesheet" type="text/css" href="../css/index.css" />
		<link rel="stylesheet" href="../js/artDialog/skins/blue.css" />
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
<style type="text/css">
body{ font-size:14px;}
input{ vertical-align:middle; margin:0; padding:0}
.file-box{ position:relative;width:340px}
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
</style>
<script type="text/javascript" src="../js/checkInput.js"></script>

</head>
<body onload="init()">

	<form id="myForm" action="saveFriendlinkCtg.do" method="post">
		<input type="hidden" name="friendlinkctgId" value="${dto.friendlinkctgId}" />
		<div class="content-right-add">

			<h3>添加/修改</h3>
			<div class="content-right-addinfo">
				<p>基本信息</p>
				<ul>
					<li>
						<span>名称：</span> 
						<span><input type="text" name="friendlinkctgName" value="${dto.friendlinkctgName}" maxlength="20" /></span> 
					</li>
					<li>
						<span>排列顺序：</span> 
						<span><input type="text" name="priority" value="${dto.priority}" maxlength="20" /></span> 
					</li>
					
				</ul>
				<div class="content-right-addinfo-sure">
					<button class="button1" onclick="submitForm();return false;">保存提交</button>
					<button class="button2"
						onclick="location='listFriendlinkCtgInfo.do';return false;">取消返回</button>
				</div>
			</div>
		</div>
	</form>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../js/checkInput.js"></script>
<script type="text/javascript">    
	    function init(){
			<c:if test="${not empty message}"> 
				alert('${message}');
			</c:if>
		}    
    	function submitForm(){
    		try{
    			var flag = true;
    			if (!notNull($('input[name="friendlinkctgName"]'),"请输入名称")){
    				flag=false;
    			}
    			 
    			if (!notNull($('input[name="priority"]'),"请输入顺序")){
    				flag=false;
    			}

    			if(flag){$('#myForm').submit();}
    			
    		}catch(e){
    			alert(e.message);
    		}
    	}
    </script>
</body>

</html>