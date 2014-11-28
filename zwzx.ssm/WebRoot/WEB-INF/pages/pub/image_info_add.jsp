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
<link rel="stylesheet" type="text/css" href="../css/image.css"/>
<script type="text/javascript" src="../js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="../js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../js/artDialog/artDialog.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/checkInput.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath}/js/from_min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/swfupload/swfupload.handlers.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/swfupload/swfupload.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
			   <div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="#">
								图片管理
							</a><span class="divider"><i class="fa fa-angle-right"></i></span>
						</li>
						<li class="active">
							修改内容
						</li>
					</ul>
				</div>
	<form action="saveImageNews.do"  id="myForm"  method="post">
		<!--添加新员工开始-->
		<div class="content-right-add">
			<h3>修改信息</h3>
			<div class="content-right-addinfo">
				<ul>			  
					<li><span><h3>标题：</h3></span> <input type="text" id="biaoti" name="title" value="${dto.title}"  maxlength ="20"
						 /> <span class="error">请输入正确标题</span>最多输入20字符标题
					</li>
					<li><span><h3>来源：</h3></span> <input type="text" id="source" name="source" value="${dto.source}"  maxlength ="20"
						 /> <span class="error">
					</li>
					<li>
						<div class="upload_img">
							<div class="upload-box upload-album">
							</div>
							<div class="photo-list">
								<input type="hidden" name="imageId" value="${dto.imageId}" />
								<ul id="imageUl">
									<c:forEach items="${dto.imageMaterialDetail}" var="it" varStatus="st">
										<li>
										    <input type="hidden" name="theImageId" value="${it.imageId}" />
											<c:if test="${dto.imageId ne it.imageId }">
											<div class="img-box">
												<img src="${pageContext.request.contextPath}/resAttachmentController/viewImage.do?attachmentId=${it.imageId}"><span  onclick="delImg(this)" class="remark"></span>
											</div>
											</c:if>
											<c:if test="${dto.imageId eq it.imageId }">
											 <div class="img-box selected">
											  <img src="${pageContext.request.contextPath}/resAttachmentController/viewImage.do?attachmentId=${it.imageId}"/> <span  onclick="delImg(this)" class="remark"></span>               
            		  		                 </div>
											</c:if>
											<input type="text" name="sortNumber" value='+data.sortNumber+' style="width:20px;"/><br>
											<textarea rows="5" cols="50" name="imageDetail" >${it.imageDetail}</textarea></br>
											<a onclick="setMyFocusImg(this,${it.imageId});" href="javascript:void(0);">设为主图</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						</li>
						<li>
			         <button onclick="myFrom();">保存</button>
				</ul>
				</form>
				
		<script type="text/javascript"> 
				function myFrom(){
		           $("#myForm").Validform({beforeSubmit:function()
		           {
			        //设置图片
			    	var images = $('input[name="theImageId"]');
			    	if(images.length<1)
			    	{
			    	$.ligerDialog.warn("请设置图片");
			    	return false;
			    	}
			    	
			    	//图片序号
			    	var sort= $('input[name="sortNumber"]');
			    	   sort.each(function(idx,et){
		    				$(et).attr('name','imageMaterialDetail['+idx+'].sortNumber');
			    		});
			    	var imageDetail= $('textarea[name="imageDetail"]');
			    	   imageDetail.each(function(idx,et){
		    				$(et).attr('name','imageMaterialDetail['+idx+'].imageDetail');
			    		});
			    		
			    	//图片描叙
			    	
			    	
			    	images.each(function(idx,et){
		    				$(et).attr('name','photos['+idx+'].id');
			    		});
				    return true;
		    	}}).submitForm();
		 };
			
			var validateForm;
		
			//初始化
			$(function() {
				<%@ include file="../common/swfupload.jsp" %>
				$(".upload-album").each(function() {
					$(this).InitSWFUpload({
						post_params:{'swfuploadUser':'<%=swfuploadUser%>','swfuploadPass':'<%=swfuploadPass%>'},
						use_query_string : true,
						btntext: "添加图片(最多12张)",
						btnwidth: 130,
						single: false,
						water: true,
						file_upload_limit:12,
						thumbnail: true,
						filesize: "2048",
						sendurl: "../resAttachmentController/ajaxUpload.do",
						flashurl: "${pageContext.request.contextPath}/js/swfupload/swfupload.swf",
						filetypes: "*.jpg;*.jpge;*.png;*.gif;",
						uploadSuccess:function(file,data){
							data = eval('(' + data + ')');
							var htmlstr = '<li>';
							htmlstr += '<input type="hidden" name="theImageId" value='+data.id+' />';
							htmlstr += '<div class="img-box">';
							htmlstr += '<img src="${pageContext.request.contextPath}/resAttachmentController/viewImage.do?attachmentId='+data.id+'"><span onclick="delImg(this)"  class="remark"></span>';
							
							htmlstr += '</div>	<input type="text" name="sortNumber"  style="width:20px;"/><br><textarea rows="5" cols="50" name="imageDetail" ></textarea></br><a onclick="setMyFocusImg(this,'+data.id+')" href="javascript:void(0);">设为主图</a>';
							htmlstr += '</li>';
							$('#imageUl').append(htmlstr);
							var focusPhotoObj = $('#imageUl').find(".selected");
						    if (focusPhotoObj.val()==undefined) {
						        $('#imageUl').find(".img-box").addClass("selected");
						        $('input[name="imageId"]').val(data.id);
						    }
						}
					});
				});
			});
		
			//设置主图
		function setMyFocusImg(obj,id){
				$('input[name="imageId"]').val(id);
				setFocusImg($(obj).siblings('div'));
		}

</script>			
				
</body>
</html>