<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>瀑布流</title>
		<meta name="keywords" content="瀑布流,jQuery,waterfall,woo" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/waterfall-master/css/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/waterfall-master/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/waterfall-master/css/woo.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/waterfall-master/css/gotop.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/waterfall-master/css/pagine.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/waterfall-master/css/resize.css" />
		<script src="${pageContext.request.contextPath}/waterfall-master/js/jquery-1.6.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/waterfall-master/js/browser.js"></script>
		<script src="${pageContext.request.contextPath}/waterfall-master/js/history.js"></script>
		<script src="${pageContext.request.contextPath}/waterfall-master/js/template.min.js"></script>
		<script src="${pageContext.request.contextPath}/waterfall-master/js/tabswitch.js"></script>
		<script src="${pageContext.request.contextPath}/waterfall-master/js/woo.js"></script>
		<script src="${pageContext.request.contextPath}/waterfall-master/js/masnunit.js"></script>
	</head>
	<body>
	
<div id="content">
	<div id="woo-holder">
		<!-- When gotop button is clicked, scrollbar will be positioned where the anchor is. -->
		<a name="woo-anchor"></a>
		<ul id="switchholder">
		<li class="woo-swa woo-cur"><a href="javascript:;">my pics</a></li>
		</ul>

		<div class="woo-swb">
			<!-- data-totalunits is set here, then pager nums would be fixed -->
			<!-- It would have been Hasnext Mode if you didn't do it -->
			<div class="woo-pcont woo-masned my-pic" data-totalunits="185" data-wootemp="0" data-subpagenum="4">
				<!-- .woo-pcont 节点内可预先放好若干个单元(个数没有限制) -->
				<!-- 预先放置的会被当做第一子页数据，后面会直接从第二子页开始 -->
				<!-- 可以选择不放置 -->
				  <c:forEach items="${imageMaterialList}" var="imageMaterialList" varStatus="item">
				<div data-id="97219875" class="woo"><div class="j">
				<div class="mbpho" style="height:266px;">
				<a target="_blank" class="a" href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${imageMaterialList.id}">
				<img data-rootid="97219875" data-iid="7007475" srcd="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${imageMaterialList.imageId}" height="266"/>
				</a>
				<div class="collbtn" data-favorite='{"id":97219875,"owner":1629580}'>
				<a class="y" href="#">52</a><a class="z" href="#">0</a>
				<a class="x" href="#">0</a></div></div><div class="d">
				<span class="d1">52</span><span class="d2">0</span>
				<span class="d3">0</span></div><div class="g">古风</div>
				<ul><li class="f"><a target="_blank" href="http://www.duitang.com/people/1629580/"> 
				<img width="24" height="24" srcd="http://cdn.duitang.com/uploads/people/201307/29/20130729212849_MiajP.thumb.24_24_c.jpeg" /> </a><p>
				<a class="p" target="_blank" href="http://www.duitang.com/people/1629580/">香水座</a>&nbsp;收集到&nbsp;
				<a target="_blank" href="http://www.duitang.com/album/4319045/">手绘</a>&nbsp;专辑中</p></li></ul></div></div>
				</c:forEach>
				
			</div>
			<div class="woo-pager"></div>
		</div>

	</div>
	<!-- Woo holder over -->

</div>
<div id="footer">
&copy;Copyright by 堆糖 2010-2013 duitang.com, all rights reserved
</div>
<style>
/* invisible holder for the page */
#win-holder{overflow:hidden;height:0px;}
</style>
<div id="win-holder">
	<form id="woo-form-album" action="${pageContext.request.contextPath}/front/getMoreImageAjax.do?page=">
	</form>
</div>
<script>
function love(){
alert("mylove you");
}



$(function (){
	// Append buttons gonext, gopre, gotop to the body as you like.
	$('<div id="mycontrols"><a id="gonext" href="javascript:;" title="下一页"></a><a href="javascript:;" id="gotop"></a><a id="gopre" href="javascript:;"  title="上一页"></a></div>').appendTo('body');

	var conf = {
		// Prefix of form id. Each form represents a subpage data request.
		"formprefix" : '#woo-form-',

		// Identification of a single waterfall. There are 4 waterfalls in main.html.
		// You can get the form in #win-holder by putting formprefix and one identification together.
		// <form id="woo-form-(collect|original|album|favalbum)">
		"arrform" : ['album','favalbum','collect','original'], 

		// arrsplit, the last part of the url which has been split by page number.
		// The first part of the url has already been put in the action attribute of the proper form.
		// Page number can be seen neighther in the first part nor the last part.
		// Why and how we do this? Think a simple url like '/message/list/1/tail/?type=hot'
		// First, we put '/message/list/' in form action.
		// Then, we can make a hidden input in this form <input type="hidden" name="type" value="hot"/>.
		// Finally, we put '/tail/' into arrsplit.
		// Or, we could choose no hidden input and '/tail/?type=hot' into arrsplit.
		// Nevertheless, we put them together and get the entire url.
		//"arrsplit" : ['/?type=hot','','',''],

		// The extend width of each common column including margin between two cols.
		"arrmasnw" : [245,250,250,245],

		// The margin between two cols.
		// In this example, visible column width is 245-21=224.
		"arrmargin" : [21,42,42,21],

		// Diff value of special column width, default 0.
		// Why the value is 0, not [0,0,0,0]?
		// We simplified params by converting equal-value array [0,0,0,0] to single value 0.
		// Params arrsplit, arrmasnw, arrmargin and arrgap can be treated on the same principle.
		// But, param arrform is out of the principle.
		"arrfmasnw" : 0,

		// The gap between units in one column.
		"arrgap" : 0,


		// Install $gopre $gonext $gotop as you like.
		"gopre" : '#gopre',
		"gonext" : '#gonext',
		"gotop" : '#gotop',

		// Footer selctor, any node below the pager can be treated as footer.
		"footer" : '#footer,#preserve',

		// Open resize mode.
		// If you open it, every time window resizes, waterfall will be repainted.
		// Not recommend in ie.
		"resize" : true,

		// Sth you do during scrolling, say, pop out a login confirm.
		"onScroll" : function (tp){
			// tp current scrolltop
//			if( (typeof ALREADYNOTICED === 'undefined' || !ALREADYNOTICED) && tp >= 1000 ){
//				ALREADYNOTICED = true
//				alert("login")
//			}
		}
	}

	// Let's go.
	$.Woo(conf);
})
</script>
  </body>
</html>
