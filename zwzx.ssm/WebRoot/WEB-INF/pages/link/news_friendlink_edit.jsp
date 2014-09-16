<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
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
</script>
</head>
<body>
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

<iframe name="hiddenIframe" frameborder="0" border="0" style="display:none;width:0px;height:0px;"></iframe><div class="box-positon">
	<div class="rpos">当前位置: 友情链接管理 - 添加</div>
	<form class="ropt">
		<input type="submit" value="返回列表" onclick="this.form.action='listFriendlinkInfo.do?page=1&limit=10';" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
<form method="post" action="saveFriendlink.do" id="jvForm">
<c:if test="${ type ne 'insert'}">
<input type="hidden" maxlength="100" name="friendlinkId" class="required" maxlength="100"  value="${dto.friendlinkId}" / >
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
<tr>
<td width="15%" class="pn-flabel pn-flabel-h">
<span class="pn-frequired">*</span>网站名称:</td>
<td colspan="1" width="35%" class="pn-fcontent">
<input type="text" maxlength="150" name="siteName"  value="${dto.siteName}"  class="required" maxlength="150"/></td>
<td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>网站地址:</td>
<td colspan="1" width="35%" class="pn-fcontent">
<input type="text" maxlength="255"  value="${dto.domain}"  name="domain" class="required" style="width:200px" maxlength="255"/></td></tr>
<tr><td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>网站类别:</td>
<td colspan="1" width="35%" class="pn-fcontent">
<select name="friendlinkctgId" class="required">
<c:forEach items="${friendlinkctglist}" var="linkctglist">
<option value="${linkctglist.friendlinkctgId }">${linkctglist.friendlinkctgName }</option>
</c:forEach>
</select>
</td>
<td width="15%" class="pn-flabel pn-flabel-h">站长邮箱:</td><td colspan="1" width="35%" class="pn-fcontent">
<input type="text" maxlength="100" name="email"  value="${dto.email}"  maxlength="100"/></td></tr>
<tr>
<td id="linkLogo" width="15%" class="pn-flabel">网站LOGO:</td>
<td>
	<span id="ufc1" style="position:relative">
	  <input type='text'  id='textfield' class='txt' />  
      <input type='button' class='btn' value='浏览...' />
      <input type="file" name="file" class="file" id="file" onchange="document.getElementById('textfield').value=this.value" />
      <input type="button"  class='btn' value="上传" onclick="uploadFile()"/>
</span>	
</td>
<td colspan="2" class="pn-fbutton">
<img id="attchmentImage" alt="预览" src="../resAttachmentController/viewImage.do?attachmentId=${dto.imageId}"  style="width:100px;height:70px;background-color:#ccc;border:1px solid #333"/>
</td></tr>
<input type="hidden" name="imageId" value="${dto.imageId}"/>
<tr><td width="15%" class="pn-flabel pn-flabel-h">网站简介:</td>
<td colspan="3" width="85%" class="pn-fcontent">
<textarea cols="50" rows="3" name="description"   value="${dto.description}"  maxlength="255">${dto.description}</textarea>
</td></tr>
<tr><td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" width="35%" class="pn-fcontent">
<input type="text" maxlength="11" value="10" name="priority"  value="${dto.priority}"  class="required" style="width:100px" maxlength="11"/></td>
<td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>点击次数:</td><td colspan="1" width="35%" class="pn-fcontent">
<input type="text" maxlength="11" value="0" name="views"  value="${dto.views}"  class="required" style="width:100px" maxlength="11"/></td></tr>
<tr><td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>显示:</td><td colspan="3" width="85%" class="pn-fcontent"><label>
<input type="radio" value="true"  name="isEnabled"    <c:if test="${'true'==dto.isEnabled} ">  checked="checked" </c:if>  class="required"/>是</label> <label>
<input type="radio" value="false" name="isEnabled"  <c:if test="${'false'==dto.isEnabled} ">  checked="checked" </c:if>  class="required"/>否</label></td>
</tr>
<c:if test="${ type ne 'detail'}">
<tr><td colspan="4" class="pn-fbutton">
<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; <input type="reset" value="重置" class="reset" class="reset"/></td>
</tr>
</c:if>
</table>
</c:if>

<c:if test="${ type eq 'insert'}">
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
<tr>
<td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>网站名称:</td><td colspan="1" width="35%" class="pn-fcontent">
<input type="text" maxlength="150" name="siteName" class="required" maxlength="150"/></td><td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>
网站地址:</td><td colspan="1" width="35%" class="pn-fcontent"><input type="text" maxlength="255" value="http://" name="domain" class="required" style="width:200px" maxlength="255"/></td></tr>
<tr><td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>
网站类别:</td><td colspan="1" width="35%" class="pn-fcontent">
<select name="friendlinkctgId" class="required">
<c:forEach items="${friendlinkctglist}" var="linkctglist">
<option value="${linkctglist.friendlinkctgId }">${linkctglist.friendlinkctgName }</option>
</c:forEach>
</select>
</td><td width="15%" class="pn-flabel pn-flabel-h">站长邮箱:</td><td colspan="1" width="35%" class="pn-fcontent">
<input type="text" maxlength="100" name="email" maxlength="100"/></td></tr>
<tr>
<td id="linkLogo" width="15%" class="pn-flabel">网站LOGO:</td>
<td>
	<span id="ufc1" style="position:relative">
	  <input type='text'  id='textfield' class='txt' />  
      <input type='button' class='btn' value='浏览...' />
      <input type="file" name="file" class="file" id="file" onchange="document.getElementById('textfield').value=this.value" />
      <input type="button"  class='btn' value="上传" onclick="uploadFile()"/>
</span>	
</td>
<td colspan="2" class="pn-fbutton">
<img id="attchmentImage" alt="预览" src="../resAttachmentController/viewImage.do?attachmentId=${dto.imageId}"  style="width:100px;height:70px;background-color:#ccc;border:1px solid #333"/>
</td></tr>
<input type="hidden" name="imageId" value="${dto.imageId}"/>
<tr><td width="15%" class="pn-flabel pn-flabel-h">网站简介:</td>
<td colspan="3" width="85%" class="pn-fcontent">
<textarea cols="50" rows="3" name="description" maxlength="255"></textarea>
</td></tr>
<tr><td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>排列顺序:</td><td colspan="1" width="35%" class="pn-fcontent"><input type="text" maxlength="11" value="10" name="priority" class="required" style="width:100px" maxlength="11"/></td>
<td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>点击次数:</td><td colspan="1" width="35%" class="pn-fcontent"><input type="text" maxlength="11" value="0" name="views" class="required" style="width:100px" maxlength="11"/></td></tr>
<tr><td width="15%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>显示:</td><td colspan="3" width="85%" class="pn-fcontent"><label>
<input type="radio" value="true" checked="checked" name="isEnabled" class="required"/>是</label> <label><input type="radio" value="false" name="isEnabled" class="required"/>否</label></td>
</tr>
<c:if test="${ type ne 'detail'}">
<tr><td colspan="4" class="pn-fbutton">
<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; <input type="reset" value="重置" class="reset" class="reset"/></td>
</tr>
</c:if>
</table>
</c:if>


</form>
</div>
</body>
</html>