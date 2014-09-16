<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">

var attr_all=["0","1"];
function attrChange(value) {
	for(var attr in attr_all) {
		if(attr_all[attr]==value) {
			showAttr(attr_all[attr]);
		} else {
			hideAttr(attr_all[attr]);
		}
	}
}
function hideAttr(value) {

	var name = "#attr_image";
	$(name).hide();

}
function showAttr(value) {
	var name = "#attr_image";
	$(name).show();
}
</script>
<style type="text/css">
.attr{padding:3px;margin:0;}
</style>
<style type="text/css">
body{ font-size:14px;}
input{ vertical-align:middle; margin:0; padding:0}
.file-box{ position:relative;width:340px}
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
</style>
<head>
<title>需求管理</title>
<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
<link rel="stylesheet" type="text/css" href="../css/staff-add.css" />
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
<script type="text/javascript" src="../js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="../js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../js/artDialog/artDialog.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/checkInput.js"></script>
<script type="text/javascript" src="../js/function.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="../js/artDialog/plugins/iframeTools.js"></script>
	
	<script type="text/javascript">
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
	//上传文件
	   function uploadFile(){
	    	if ($('#file').val()==''){
	    		return;
	    	}
	    	alert($('#file').val());
	    	
	    	$.ajaxFileUpload( 
			           { 
			               url:'../resAttachmentController/ajaxUpload.do',
			               secureuri:false, 
			               fileElementId:'file',
			               dataType: 'json',
			               success: function (data, status) 
			               { 
				           		if (data==null||data.id<=0){
				           			alert('上传失败!');
				           		}else{
				           			$('#attchmentImage').attr('src','../resAttachmentController/viewImage.do?attachmentId='+data.id);
				           			$('input[name="imageId"]').val(data.id);
				           			 $('#addressEdit1').remove();
				           			alert('上传成功!');
				           		}
				            }, 
			            error: function (data, status, e)
			            { 
			               alert(e);
			            } 
			        } 
			    );
	    }
</script>
	
	
</head>
<body onload="init()">
	
			<c:if test="${type=='edit'}">
			   <div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								新闻管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							修改新闻内容
						</li>
					</ul>
				</div>
	<form action="saveBroadcast.do"  id="form1"  method="post">
		<!--添加新员工开始-->
		<div class="content-right-add">
			<h3>修改信息</h3>
			<div class="content-right-addinfo">
				<input type="hidden" name="id" value="${dto.id}" />		
				<ul>
					 <li><span><h3> 类型：</h3></span>
			        <select name="contentTypeId" onchange="sendAllTypeAjax(this.value)">
				    <c:forEach items="${contenttypelist}" var="contentTypelist">
									    <c:choose>
                   <c:when test="${contentTypelist.id eq dto.contentTypeId}">
                   <option value="${contentTypelist.id}"  selected = "selected">${contentTypelist.cname }</option>   
                  </c:when>
                  <c:otherwise>
                  <option value="${contentTypelist.id}" >${contentTypelist.cname }</option>
                </c:otherwise>
  
                 </c:choose>
				  </c:forEach>
			     </select>
			     
	               <select  name="newsTypeId" id="newsType">
				   <c:forEach items="${newstypelist}" var="newstypelist">
					
				     <c:choose>
                   <c:when test="${newstypelist.id eq dto.newsTypeId}">
                   <option value="${newstypelist.id}"  selected = "selected">${newstypelist.cname }</option>   
                  </c:when>
                  <c:otherwise>
                 <option value="${newstypelist.id}" >${newstypelist.cname }</option>
                </c:otherwise>
                 </c:choose>			  
				  </c:forEach>
			     </select> 
				     
			
			     </li>
			  
					<li><span><h3>标题：</h3></span> <input type="text" id="biaoti" name="title" value="${dto.title}"  maxlength ="20"
						 /> <span class="error">请输入正确标题</span>最多输入20字符标题
					</li>
					<li><span><h3>推荐：</h3></span> 
					 <label><input type="radio" value="1"  checked="checked" name="isRecommend" onclick="attrChange(this.value)"/>
                                                        推荐</label> 
                      <label><input type="radio" value="0" name="isRecommend"  <c:if test="${'0'==dto.isRecommend}">   checked="checked" </c:if> onclick="attrChange(this.value)"/>
                                                        不推荐</label> </td>
					
              
					</li>
	
	<div id="attr_image"  style="padding: 0 30px;">
	<p class="attr">图片上传:
	<span id="ufc1" style="position:relative">
	  <input type='text'  id='textfield' class='txt' />  
      <input type='button' class='btn' value='浏览...' />
      <input type="file" name="file" class="file" id="file" onchange="document.getElementById('textfield').value=this.value" />
      <input type="button"  class='btn' value="上传" onclick="uploadFile()"/>
	</span>	
	</p>
	<p class="attr">图片预览： 
	<img id="attchmentImage" src="../resAttachmentController/viewImage.do?attachmentId=${dto.imageId}" />
    </p>
<p class="attr" id="addressEdit1">图片来源：<span id="ufc1" style="position:relative"><input type="text" id="imageUrl" name="imageUrl"
						value="${dto.imageUrl}" /> </span></p>
    <input type="hidden" name="imageId" value="${dto.imageId}"/>
</div>
					<li><span><h3>来源：</h3></span><input type="text" id="source" name="source"
						value="${dto.source}" /> <span class="error"></span>
					</li>
					<li><span><h3>摘要：</h3></span><textarea rows="5" cols="40" name="remark">${dto.remark}</textarea><span class="error"></span>
					</li>
					<li><span><h3>内容：</h3></span> <script id="container" name="content" 
							type="text/plain">
						${dto.content}
					</script> <script type="text/javascript">
						var editor = UE.getEditor('container');
					</script>
					</li>
				</ul>
				</form>
</c:if>
			<c:if test="${type=='insert'}">
                	<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								新闻内容管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							添加内容
						</li>
					</ul>
				</div>
	<form action="saveBroadcast.do"  id="form1"  method="post">
		<!--添加新员工开始-->
		<div class="content-right-add">
			<h3>添加信息</h3>
			<div class="content-right-addinfo">            
              <ul>
            <li><span><h3> 类型：</h3></span>
			<select name="contentTypeId"
				onchange="sendAllTypeAjax(this.value)" >
				<option value="">全部</option>
				<c:forEach items="${typelist}" var="typelist">
                   <option value="${typelist.id}" >${typelist.cname }</option>   
				</c:forEach>
			</select> 
				<select  name="newsTypeId" id="newsType">
                    <option value="">请选择</option>   
			     </select>
			     </li>
			  
					<li><span><h3>标题：</h3></span> <input type="text" id="biaoti" name="title" maxlength="30"
						 /> <span class="error">请输入正确标题</span>最多输入20字符标题
					</li>
					<li><span><h3>推荐：</h3></span> 
					 <label><input type="radio" value="1"  checked="checked" name="isRecommend" onclick="attrChange(this.value)"/>
                                                        推荐</label> 
                      <label><input type="radio" value="0" name="isRecommend"  <c:if test="${'0'==dto.isRecommend}">   checked="checked" </c:if> onclick="attrChange(this.value)"/>
                                                        不推荐</label> </td>
					
              
					</li>
	
	<div id="attr_image"  style="padding: 0 30px;">
	<p class="attr">图片上传:
	<span id="ufc1" style="position:relative">
	  <input type='text'  id='textfield' class='txt' />  
      <input type='button' class='btn' value='浏览...' />
      <input type="file" name="file" class="file" id="file" onchange="document.getElementById('textfield').value=this.value" />
      <input type="button"  class='btn' value="上传" onclick="uploadFile()"/>
	</span>	
	</p>
	<p class="attr">图片预览： 
	<img id="attchmentImage" src="../resAttachmentController/viewImage.do?attachmentId=${dto.imageId}" />
    </p>
    <p class="attr" id="addressEdit1">图片来源：<span id="ufc1" style="position:relative">
    <input type="text" id="imageUrl" name="imageUrl"
						value="${dto.imageUrl}" /> </span></p>
    <input type="hidden" name="imageId" value="${dto.imageId}"/>
</p>
</div>
					<li><span><h3>来源：</h3></span> <input type="text" id="source" name="source"
						/> <span class="error"></span>
					</li>
					<li><span><h3>摘要：</h3></span>
					<textarea rows="5" cols="40" name="remark"></textarea>
				    <span class="error"></span>
					</li>
					<li><span><h3>内容：</h3></span> <script id="container" name="content"
							type="text/plain">
					</script> <script type="text/javascript">
						var editor = UE.getEditor('container');
					</script>
					</li>
				</ul>
			</c:if>
				<div class="content-right-addinfo-sure">
					<button class="button1" onclick="save();return false;">保存提交</button>
					<button class="button1" onclick="see();return false;">预览</button>
					<button class="button2" onclick="cancel();return false;">取消返回</button>
				</div>

			</div>
		</div>
		<!--添加新员工完-->
	</form>
	
	<script type="text/javascript">
		function save() {
			var valStr1 = $('input[name="title"]');	
			var valStr3 = $('input[name="source"]');
			var valStr2 = $('input[name="remark"]');
			var flag=true;
			if (!notNull(valStr1,"请输入来源")) {
				flag=false;
			}
			if (!notNull(valStr2,"请输入摘要")) {
				flag=false;
			}
			if (!notNull(valStr3,"请输入标题")) {
				flag=false;
			}
			if (!editor.hasContents()) {
				alert('请输入内容!');
				flag=false;
			}
			if (flag) {
				document.forms[0].submit();
			}
		}
		function see() {
            $("#form1").attr("action","viewBroadcast.do");		
			document.forms[0].submit();
		}
		
		function cancel() {
			location = 'listBroadcastInfo.do?page=1&limit=10';
		}
	</script>
</body>
</html>