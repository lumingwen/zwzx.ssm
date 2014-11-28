<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>详细列表</title>
<link href="../css/piccontext.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="../js/piccontent.min.js" type="text/javascript"></script>
</head>
<body>
	<!--主体内容-->
<div class="main"> 
  <!--弹出层开始-->
  <div class="bodymodal"></div>
  <!--播放到第一张图的提示-->
  <div class="firsttop">
    <div class="firsttop_left"> 
		广告图片
		<img src="../images/potoList/1.jpg" alt="" bigimg="../images/potoList/1.jpg">
    </div>
    <div class="firsttop_right">
      <div class="close2"> <a class="closebtn1" title="关闭" href="javascript:void(0)"></a> </div>
      <div class="replay">
        <h2 id="div-end-h2"> 已到第一张图片了。 </h2>
        <p> <a class="replaybtn1" href="javascript:;">重新播放</a> </p>
      </div>
      <div class="pictwo">
        <ul>
          <li><a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialPreval.id}" title="${imageMaterialPreval.title }" target="_blank">
           <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialPreval.imageId}" alt="${imageMaterialPreval.title }" /></a>
            <div class="imgdivtext"> <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialPreval.id}" title="${imageMaterialPreval.title }" target="_blank">上一图集</a> </div>
          </li> 
          
                   
          <li><a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialNext.id}" title="${imageMaterialNext.title }" target="_blank">
          <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialNext.imageId}" alt="${imageMaterialNext.title}" /></a>
            <div class="imgdivtext"> <a href="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialNext.imageId}" title="${imageMaterialPreval.title }" target="_blank">下一图集</a> </div>
          </li>
        </ul>
      </div>
      <div class="returnbtn"> <a href="http://www.17sucai.com">返回图库首页</a> </div>
    </div>
  </div>
  <!--播放到最后一张图的提示-->
  <div class="endtop">
    <div class="firsttop_left"> 
	广告图片
	<img src="../images/potoList/1.jpg" alt="" bigimg="../images/potoList/1.jpg">
    </div>
    <div class="firsttop_right">
      <div class="close2"> <a class="closebtn2" title="关闭" href="javascript:void(0)"></a> </div>
      <div class="replay">
        <h2 id="H1"> 已到最后一张图片了。 </h2>
        <p> <a class="replaybtn2" href="javascript:;">重新播放</a> </p>
      </div>
      <div class="pictwo">
        <ul>
          <li><a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialPreval.id}" title="${imageMaterialPreval.title }" target="_blank">
           <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialPreval.imageId}" alt="${imageMaterialPreval.title }" /></a>
            <div class="imgdivtext"> <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialPreval.id}" title="${imageMaterialPreval.title }" target="_blank">上一图集</a> </div>
          </li> 
          
                   
          <li><a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialNext.id}" title="${imageMaterialNext.title }" target="_blank">
          <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialNext.imageId}" alt="${imageMaterialNext.title}" /></a>
            <div class="imgdivtext"> <a href="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialNext.imageId}" title="${imageMaterialPreval.title }" target="_blank">下一图集</a> </div>
          </li>
        </ul>
      </div>
      <div class="returnbtn"> <a href="http://www.17sucai.com">返回图库首页</a> </div>
    </div>
  </div>
  <!--弹出层结束--> 
  <!--图片特效内容开始-->
  <div class="piccontext">
    <h2> ${imageMaterial.title } </h2>
    <div class="source">
      <div class="source_left"> 来源： ${imageMaterial.source }<span><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${imageMaterial.createTime}"/></span> </div>
      <div class="source_right">
        <div class="support"> 支持<img src="../images/potoList/jiantou1.jpg" />键翻阅图片 </div>
        <span>|</span><a href="#myspeak" class="spell">我有话说</a><span>|</span><a href="javascript:;" class="list">列表查看</a> </div>
      <div class="source_right1"> <a href="javascript:;" class="gaoqing">高清查看</a> </div>
    </div>
    <!--大图展示-->
    <div class="picshow">
      <div class="picshowtop">
          <a href="#"><img src="" alt="" id="pic1" curindex="0" /></a>
          <a id="preArrow" href="javascript:void(0)" class="contextDiv" title="上一张"><span id="preArrow_A"></span></a>
          <a id="nextArrow" href="javascript:void(0)" class="contextDiv" title="下一张"><span id="nextArrow_A"></span></a>
      </div>
      <div class="picshowtxt">
        <div class="picshowtxt_left">
        <c:if test="${imageNewsCount gt 0}">
        <span>1</span>/<i>${imageNewsCount}</i>
        </c:if>
        </div>
        <div class="picshowtxt_right"></div>
      </div>
      <div class="picshowlist"> 
        <!--上一条图库-->
        <div class="picshowlist_left">
          <div class="picleftimg">
           <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialPreval.id}" title="${imageMaterialPreval.title }" target="_blank">
           <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialPreval.imageId}" alt="${imageMaterialPreval.title }" />
           </a> 
           </div>
          <div class="piclefttxt"> 
          <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialPreval.id}" title="${imageMaterialPreval.title }" target="_blank">${imageMaterialPreval.title }</a> </div>
        </div>
        <div class="picshowlist_mid">
          <div class="picmidleft"> <a href="javascript:void(0)" id="preArrow_B"><img src="../images/potoList/left1.jpg" alt="上一个" /></a> </div>
          <div class="picmidmid">
            <ul>
            <c:forEach items="${imageMaterialDetailList}" var="imageMaterialDetailList">
				<li> <a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialDetailList.imageId}" alt="" bigimg="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ imageMaterialDetailList.imageId}" text="${ imageMaterialDetailList.imageDetail}" /></a></li>	
					
			</c:forEach>   
            </ul>
          </div>
          <div class="picmidright"> <a href="javascript:void(0)" id="nextArrow_B"><img src="../images/potoList/right1.jpg" alt="下一个" /></a> </div>
        </div>
        <!--下一张图库新闻-->
        <div class="picshowlist_right">
          <div class="picleftimg"> <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialNext.id}" title="${imageMaterialNext.title }" target="_blank"><img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialNext.imageId}" alt="${imageMaterialNext.title }" /></a> </div>
          <div class="piclefttxt"> <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialNext.id}" title="${imageMaterialNext.title }" target="_blank">${imageMaterialNext.title }</a> </div>
        </div>
      </div>
    </div>
    
    <!--列表展示-->
    <div class="piclistshow">
      <ul>
       
        <c:forEach items="${imageMaterialDetailList}" var="imageMaterialDetailList" varStatus="item">
				<li>
		          <div class="picimg"><img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialDetailList.imageId}" alt="" /></div>
		          <div class="pictxt">
		            <h3>${ imageMaterialDetailList.imageDetail}<span>(${item.index+1}/${imageNewsCount})</span></h3>
		          </div>
		        </li>		
	   </c:forEach>   
      </ul>
    </div>
  </div>
 
</div>
</div>
</body>
</html>