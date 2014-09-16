<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>字典内容编辑</title>
    <meta http-equiv="content" content="text/html" charset="utf-8"/>
		<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
		<link rel="stylesheet" type="text/css" href="../css/dialog.css"/>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="../css/staff-add.css" />
    <script type="text/javascript">
    	function init(){
    		
    	}
    	function search(){
    	 $.ligerDialog.confirm('确认提交?', function(yes) {
	        if(yes){
           $('#myForm').submit();
              }
           });
    	}
    	
    </script>
</head>
<body onload="init()">
<form action="editDictContent.do" name="myForm" id="myForm" method="post"  style="height:100%;">
<input type="hidden" name="type" value="${dto.type}" />
<input type="hidden" name="id" value="${dto.id}" />
<input type="hidden" name="pid" value="${dto.pid}" />
	<div class="content-right-add">

			<h3>添加</h3>
			<div class="content-right-addinfo">
				<p>字典内容</p>
				<ul>
					<li>
						<span>字典类型：</span> 
						<span>${dictTypeName}</span>
					</li>
					<li>
						<span>上级节点：</span> 
						<span>${pidName }</span>
					</li>
					<li>
						<span>中文名：</span> 
						<span><input type="text" name="cname" value="${dto.cname }" maxlength="20"/></span>
					</li>
					<li>
						<span>拼音全称：</span> 
						<span><input type="text" name="ename" value="${dto.ename }" maxlength="20"/></span>
					</li>
					<li>
						<span>拼音简称：</span> 
						<span><input type="text" name="shortPy" value="${dto.shortPy }" maxlength="20"/></span>
					</li>
					<li>
						<span>拼音首字母：</span> 
						<span><input type="text" name="pyszm" value="${dto.pyszm }" maxlength="1"/></span>
					</li>
					<li>
						<span>代码：</span> 
						<span><input type="text" name="code" value="${dto.code }" maxlength="20"/></span>
					</li>
					<li>
						<span>排序(大在前)：</span> 
						<span><input type="text" name="orderIndex" value="${dto.orderIndex }" 
								onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46"
								onpaste="return !clipboardData.getData('text').match(/\D/)"
								ondragenter="return false"
								style="ime-mode:Disabled"
							/>
						</span>
						
					</li>
				</ul>

				<div class="content-right-addinfo-sure">
					<button class="button1" onclick="search();return false;">保存提交</button>
					<button class="button2"
						onclick="history.back();return false;">取消返回</button>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../js/function.js"></script>
</form>	
</body>

</html>