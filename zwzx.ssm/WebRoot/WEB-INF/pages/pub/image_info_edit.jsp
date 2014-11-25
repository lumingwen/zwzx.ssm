<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
  
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/zwzxcms.css"/>
	<script type="text/javascript" src="../js/image/jquery.js"></script>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="../js/image/jspxcms.js"></script>
	<script type="text/javascript" src="../js/swfupload/swfupload.js"></script>
	<script type="text/javascript" src="../js/swfupload/swfupload.queue.js"></script>
	<script type="text/javascript" src="../js/swfupload/fileprogress.js"></script>
	<script type="text/javascript" src="../js/swfupload/handlers.js"></script>
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
</head>
<body class="c-body">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:5px 0;border-top:1px solid #ccc;">
			<tbody>
			<tr>
			<td class="in-lab" width="15%">标题</td>
			<td class="in-ctt" width="85%" colspan="3">
			<div>
			 <input type="text" name="title" maxlength="150" style="width:500px;" class="required"/>
			 <label>
			 <input type="checkbox" onclick="$('#linkDiv').toggle(this.checked);">
			 转向链接
			 </label>
			</div>
			<div id="linkDiv" style="padding-top:2px;display:none;">
			 <input type="text" name="link" maxlength="255" style="width:500px;">
			 </div>
			 </td>
			 </tr>
			 <tr>
			 <td class="in-lab" width="15%">发布时间</td>
			 <td class="in-ctt" width="85%" colspan="3">
			 <input type="text" name="publishDate" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});" class="" style="width:120px;">
			 
                                                          至
              <input type="text" name="offDate" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});" class="" style="width:120px;">
			 </td>
			 </tr>
			 <tr>
			<td class="in-lab" width="15%">标题图:</td>
			<td class="in-ctt" width="85%" colspan="3">
			<script type="text/javascript">
					function fn_smallImage(src) {
						Cms.scaleImg("img_smallImage",300,100,src);
					};
					</script>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody><tr>
							<td width="620">
					      <div style="margin-top:2px;">
					      	<span id="ufc1" style="position:relative">
							  <input type='text'  id='textfield' class='txt' />  
						      <input type='button' class='btn' value='浏览...' />
						      <input type="file" name="file" class="file" id="file" onchange="document.getElementById('textfield').value=this.value" />
						      <input type="button"  class='btn' value="上传" onclick="uploadFile()"/>
							</span>	
					      <div style="margin-top:2px;">
					        宽: <input type="text" id="w_smallImage" value="140" style="width:70px;"> &nbsp;
					        高: <input type="text" id="h_smallImage" value="100" style="width:70px;">
					      </div>
					    </td>
					    <td width="0">
					      <div id="smallImageSwfProgress" style="position:absolute;"></div>
					    </td>
					    <td align="center" valign="middle">
					      <img id="img_smallImage" style="display: none;">
							</td>
						</tr>
					</tbody></table>
					</td>
					</tr>
					<tr>
					<td class="in-lab" width="15%">图片集:</td>
					<td class="in-ctt" width="85%" colspan="3">
					<textarea id="imagesTemplateArea" style="display:none;">		
					&lt;table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:5px 0;border-top:1px solid #ccc;"&gt;
								&lt;tbody&gt;
								&lt;tr&gt;
									&lt;td&gt;
							  		&lt;div style="margin-top:2px;"&gt;
							  		  &lt;input type="hidden" name="imagesName"/&gt;
					            &lt;textarea id="imagesText{0}" name="imagesText" style="width:98%;height:45px;"&gt;{2}&lt;/textarea&gt;
					          &lt;/div&gt;
					          &lt;div style="margin-top:2px;"&gt;
							  			&lt;input type="text" id="imagesImage{0}" name="imagesImage" value="{1}" style="width:98%;" onchange="fn_imagesImage{0}(this.value);"/&gt;
							  		&lt;/div&gt;
					          &lt;div style="margin-top:2px;"&gt;
					            宽: &lt;input type="text" id="w_imagesImage{0}" value="800" style="width:70px;"/&gt; &nbsp;
					            高: &lt;input type="text" id="h_imagesImage{0}" value="800" style="width:70px;"/&gt; &nbsp;
					            			    
					            &lt;input type='text'  id='textfield'  style="height:22px; border:1px solid #red; width:180px;"/&gt;
					            &lt;input type='button'  value="浏览..." style="background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;"/&gt;
					            &lt;input type="file" name="file"  style="position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px" id="file" onchange="document.getElementById('textfield').value=this.value"/&gt;
					            &lt;input type="button"  class='btn' value="上传" onclick="uploadFile()"/&gt;

					            &lt;script type="text/javascript"&gt;
					            $(function() {
					              Cms.f7.uploads("imagesImage{0}","imagesText{0}",{
					                settings: {"title": "选择附件"},
					                callbacks: {"ok": function(src){
					                	fn_imagesImage{0}(src);
					                }}
					              });
					            });
					            &lt;/script&gt;
					          &lt;/div&gt;
							    &lt;/td&gt;
							    &lt;td width="210" align="center" valign="middle"&gt;
										&lt;img id="img_imagesImage{0}" style="display:none;"/&gt;
									  &lt;script type="text/javascript"&gt;
									    function fn_imagesImage{0}(src) {
									    	Cms.scaleImg("img_imagesImage{0}",200,100,src);
									    };
									    fn_imagesImage{0}("{1}");
									  &lt;/script&gt;
									&lt;/td&gt;
									&lt;td width="80" align="center"&gt;
										&lt;div&gt;&lt;input type="button" value="删除" onclick="imagesRemove(this);"&gt;&lt;/div&gt;
										&lt;div&gt;&lt;input type="button" value="上移" onclick="imagesMoveUp(this);"&gt;&lt;/div&gt;
										&lt;div&gt;&lt;input type="button" value="下移" onclick="imagesMoveDown(this);"&gt;&lt;/div&gt;
					          &lt;div&gt;&lt;input type="button" value="新增一行" onclick="addImageRow('','',this);"/&gt;&lt;/div&gt;
									&lt;/td&gt;
								&lt;/tr&gt;
								&lt;/tbody&gt;
							&lt;/table&gt;
							</textarea>
							<script type="text/javascript">
							var imageRowIndex = 0;
							var imageRowTemplate = $.format($("#imagesTemplateArea").val());
							function addImageRow(image,text,button) {
								if(button) {
									$(imageRowTemplate(imageRowIndex++,image,text)).insertAfter($(button).parent().parent().parent().parent().parent());
								} else {
									$(imageRowTemplate(imageRowIndex++,image,text)).appendTo("#imagesContainer");
								}
							}
							$(function() {
						    
							});
							function imagesRemove(button) {
								var toMove = $(button).parent().parent().parent().parent().parent();
								toMove.remove();
							}
							function imagesMoveUp(button) {
								var toMove = $(button).parent().parent().parent().parent().parent();
								toMove.prev().before(toMove);
							}
							function imagesMoveDown(button) {
								var toMove = $(button).parent().parent().parent().parent().parent();
								toMove.next().after(toMove);
							}
							</script>
							<div>
					      <input type="button" value="新增一行" onclick="addImageRow('','');">

					    <div id="imagesSwfProgress"></div>
							<div id="imagesContainer"></div>
							</td>
							</tr>
							</tbody>
							<table border="0" cellpadding="0" cellspacing="0" class="in-tb">
				    <tbody><tr>
				    <td colspan="4" class="in-opt">
				      <div class="in-btn"><input type="submit" value="保存"></div>
				      
				      <div style="clear:both;"></div>
				    </td>
				  </tr>
				</tbody></table>
</body>
</html>