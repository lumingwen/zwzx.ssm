<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
body{ font-size:14px;}
input{ vertical-align:middle; margin:0; padding:0}
.file-box{ position:relative;width:340px}
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
</style>
<head>
<link href="../res/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="../css/valuedate.css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jeecms.js" type="text/javascript"></script>
<script src="../res/jeecms/js/admin.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/function.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript">
$(function() {
	attrChange("image");
	$("#textColor").colorPicker();
	$("#jvForm").validate();
});
var attr_all=["image","flash","text","code"];
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
	var name = "#attr_"+value;
	$(name).hide();
	$(name+" input,"+name+" select,"+name+" textarea").each(function() {
		$(this).attr("disabled","disabled");
	});
}
function showAttr(value) {
	var name = "#attr_"+value;
	$("#attr_"+value).show();
	$(name+" input,"+name+" select,"+name+" textarea").each(function() {
		$(this).removeAttr("disabled");
	});
}
</script>
<style type="text/css">
.attr{padding:3px;margin:0;}
</style>
</head>
<body >
<script type="text/javascript">
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
<iframe name="flash_iframe" frameborder="0" border="0" style="display:none;width:0px;height:0px;"></iframe><div class="box-positon">
	<div class="rpos">当前位置: 广告管理 - 添加</div>
	<form class="ropt">
		<input type="submit" value="返回列表" onclick="this.form.action='listAdvertisingInfo.do?page=1&limit=10';" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<form method="post" action="saveAdvertisingByImage.do" id="jvForm">
<c:if test="${ type ne 'insert'}">
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
<tr>
<input type="hidden" maxlength="100" name="advertisingId" class="required" maxlength="100"  value="${dto.advertisingId}" / >
<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>
名称:</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text" maxlength="100" name="adName" class="required" maxlength="100"  value="${dto.adName}" / >
</td><td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>版位:</td><td colspan="1" width="38%" class="pn-fcontent">
<select name="adspaceId">
	<c:forEach items="${advertingSpace}" var="list">
<c:choose>
                   <c:when test="${list.adspaceId eq dto.adspaceId}">
                   <option value="${list.adspaceId}"  selected = "selected">${list.adName }</option>   
                  </c:when>
                  <c:otherwise>
                 <option value="${list.adspaceId}" >${list.adName }</option>   
                 </c:otherwise>
                 </c:choose>
	</c:forEach>
</select>
</td></tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>
类型:</td><td colspan="3" width="88%" class="pn-fcontent">
<label><input type="radio" value="image"   <c:if test="${'image'==dto.category}">   checked="checked" </c:if> name="category" onclick="attrChange(this.value)"/>
图片</label> 
 <label><input type="radio" value="text" name="category"  <c:if test="${'text'==dto.category}">   checked="checked" </c:if> onclick="attrChange(this.value)"/>文字</label> </td>
</tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>广告内容:</td><td colspan="3" width="88%" class="pn-fcontent">
<div id="attr_image">
	<p class="attr">图片地址: 
	<input type="text" id="uploadImgPath1" name="imageUrl"   value="${dto.imageUrl }"   class="required" maxlength="255" style="width:300px;"/></p>
	<p class="attr">图片上传:
	<span id="ufc1" style="position:relative">
	  <input type='text'  id='textfield' class='txt' />  
      <input type='button' class='btn' value='浏览...' />
      <input type="file" name="file" class="file" id="file" onchange="document.getElementById('textfield').value=this.value" />
      <input type="button"  class='btn' value="上传" onclick="uploadFile()"/>
	</span>	
	</p>
	<p class="attr">图片预览： 
	<img id="attchmentImage" src="../resAttachmentController/viewImage.do?attachmentId=${dto.imageId}"  width="1000" height="200"/>
    </p>
    <input type="hidden" name="imageId" value="${dto.imageId}"/>
	<p class="attr">链接地址: <input type="text" name="imageLink"  value="${dto.imageLink}"   maxlength="255" style="width:300px;"/></p>
	<p class="attr">链接提示: <input type="text" name="imagePoint"  value="${dto.imagePoint}"    maxlength="255" style="width:300px;"/></p>
    <p class="attr">链接目标: <label><input type="radio"  value="_blank"  checked="checked"  name="imageTarget"/>新窗口</label> <label><input type="radio" value="_self" />原窗口</label>
</p>
</div>
<div id="attr_text" style="display:none;">
	<p class="attr">文字内容: <input type="text" name="fontDetail" value="${dto.fontDetail}" class="required" maxlength="255" style="width:300px;"/></p>
	<p class="attr">文字链接: <input type="text" name="fontLink" value="${dto.fontLink}"  maxlength="255" style="width:300px;"/></p>
	<p class="attr">文字颜色: <input type="text" id="fontColor"  value="${dto.fontColor}"  name="attr_text_color" maxlength="50" style="width:70px"/></p>
	<p class="attr">文字大小: <input type="text" name="fontSize"  value="${dto.fontSize}"  maxlength="50" style="width:70px;"/> <span class="pn-fhelp">如：12px</span></p>
	<p class="attr">链接目标: <label><input type="radio"  <c:if test="${'_blank'==dto.fontTarget} ">  checked="checked" </c:if> name="fontTarget"/>新窗口</label> <label><input type="radio" <c:if test="${'_self'==dto.fontTarget} " >  checked="checked" </c:if> value="_self" />原窗口</label>
</p>
</div>
<div id="attr_code" style="display:none;">
	<textarea name="code" rows="7" cols="60" maxlength="655350"></textarea>
</div>
</td></tr>

<tr><td width="12%" class="pn-flabel pn-flabel-h">
<span class="pn-frequired">*</span>点击次数:</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text" value="0" name="clickCount" class="required digits" style="width:70px"/>
</td>
<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>展现次数:</td><td colspan="1" width="38%" class="pn-fcontent"><input type="text" value="0" name="displayCount" class="required digits" style="width:70px"/></td></tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h">
<span class="pn-frequired">*</span>
权重:</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text"  value="${dto.adWeight}"  name="adWeight" class="required digits" style="width:70px"/>
</td><td width="12%" class="pn-flabel pn-flabel-h">
<span class="pn-frequired">*</span>启用:</td>
<td colspan="1" width="38%" class="pn-fcontent"><label>
<input type="radio"  checked="checked"  value="1" name="isEnabled"/>是</label> 
<label>
<input type="radio" value="0" name="isEnabled"/>否</label></td>
</tr>
<c:if test="${ type ne 'detail'}">
<tr><td colspan="4" class="pn-fbutton">
<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; <input type="reset" value="重置" class="reset" class="reset"/></td>
</tr></c:if></table>
</c:if>
<c:if test="${ type eq 'insert'}">
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
<tr>
<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>
名称:</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text" maxlength="100" name="adName" class="required" maxlength="100"/>
</td><td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>版位:</td><td colspan="1" width="38%" class="pn-fcontent">
<select name="adspaceId">
	<c:forEach items="${advertingSpace}" var="list">
                   <option value="${list.adspaceId}" >${list.adName }</option>   
				</c:forEach>
</select>
</td></tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>
类型:</td><td colspan="3" width="88%" class="pn-fcontent">
<label><input type="radio" value="image" checked="checked" name="category" onclick="attrChange(this.value)"/>
图片</label> 
 <label><input type="radio" value="text" name="category" onclick="attrChange(this.value)"/>文字</label> </td>
</tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>广告内容:</td><td colspan="3" width="88%" class="pn-fcontent">
<div id="attr_image">
	<p class="attr">图片地址: 
	<input type="text" id="uploadImgPath1" name="imageUrl" class="required" maxlength="255" style="width:300px;"/></p>
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
    <input type="hidden" name="imageId" value="${dto.imageId}"/>
	<p class="attr">链接地址: <input type="text" name="imageLink" value="http://" maxlength="255" style="width:300px;"/></p>
	<p class="attr">链接提示: <input type="text" name="imagePoint" maxlength="255" style="width:300px;"/></p>
	<p class="attr">链接目标: <label><input type="radio"  value="_blank"  checked="checked"  name="imageTarget"/>新窗口</label> <label><input type="radio" value="_self" />原窗口</label>
</p>
</div>
<div id="attr_text" style="display:none;">
	<p class="attr">文字内容: <input type="text" name="fontDetail" class="required" maxlength="255" style="width:300px;"/></p>
	<p class="attr">文字链接: <input type="text" name="fontLink" value="http://" maxlength="255" style="width:300px;"/></p>
	<p class="attr">文字颜色: <input type="text" id="fontColor" name="attr_text_color" maxlength="50" style="width:70px"/></p>
	<p class="attr">文字大小: <input type="text" name="fontSize" maxlength="50" style="width:70px;"/> <span class="pn-fhelp">如：12px</span></p>
	<p class="attr">链接目标: <label><input type="radio" value="_blank" checked="checked" name="fontTarget"/>新窗口</label> <label><input type="radio" value="_self" />原窗口</label>
</p>
</div>
<div id="attr_code" style="display:none;">
	<textarea name="code" rows="7" cols="60" maxlength="655350"></textarea>
</div>
</td></tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h">开始时间:
</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text" name="createTimeStart" class="Wdate"  style="width:120px" value="${queryParam.createTimeStart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
</td><td width="12%" class="pn-flabel pn-flabel-h">
结束时间:</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text" name="createTimeEnd"  style="width:120px" value="${queryParam.createTimeEnd}" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
</td></tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h">
<span class="pn-frequired">*</span>点击次数:</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text" value="0" name="clickCount" class="required digits" style="width:70px"/>
</td>
<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>展现次数:</td><td colspan="1" width="38%" class="pn-fcontent"><input type="text" value="0" name="displayCount" class="required digits" style="width:70px"/></td></tr>
<tr><td width="12%" class="pn-flabel pn-flabel-h">
<span class="pn-frequired">*</span>
权重:</td><td colspan="1" width="38%" class="pn-fcontent">
<input type="text" value="1" name="adWeight" class="required digits" style="width:70px"/>
</td><td width="12%" class="pn-flabel pn-flabel-h">
<span class="pn-frequired">*</span>启用:</td>
<td colspan="1" width="38%" class="pn-fcontent"><label>
<input type="radio"  checked="checked" value="1" name="isEnabled"/>是</label> 
<label>
<input type="radio" value="0" name="isEnabled"/>否</label></td>
</tr>
<tr><td colspan="4" class="pn-fbutton">
<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; <input type="reset" value="重置" class="reset" class="reset"/></td>
</tr></table>
</c:if>
</form>
</div>
</body>

</html>