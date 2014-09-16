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
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/ueditor/ueditorshort.config.js"></script>
<script type="text/javascript" src="../js/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="../js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../js/artDialog/artDialog.js"></script>
<script type="text/javascript" src="../js/checkInput.js"></script>
<script src="../js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="../js/artDialog/plugins/iframeTools.js"></script>
<script type="text/javascript">
    var page = 2;	
	//查看更多
	function getMore(){
		$('#moremess').text('数据加载中,请稍候...');
		$.ajax({    
	        type:'POST',       
	        url:'../frontDetail/getMoreAjax.do',
	        data : {'page':page,'contentId':${pubBroadcastContent.id}},
	        cache:false, 
	        success:function(data){
	        $('#moremess').text("加载更多");   	
	        	if (data!=null && data.length>0){
	        		appendMessage(data,2);
	        		page++;
	        	}else{
	        		$('#moremess').css('display','none');
	        		$('#nonemess').css('display','block');
	        	}
	        }
		});
	}
	var countComent=0;
    //发送评论
	function sendMsgAjax(){
		countComent=$("#countComment").text();
		$.ajax({    
	        type:'POST',      
            url:'../frontDetail/saveCommentAjax.do',
            data : {'text':$('textarea[name="text"]').val(),'contentId':${pubBroadcastContent.id}},
	        cache:false,
            success:function(data){
            	$('input[name="text"]').val('');
            	countComent++;
            	$('#countComment').text(countComent);
            	$('#top_textarea').val('');
            	appendMessage(data,1);
            }
		});
		}
	//添加最新消息到页面(direction:1添加到顶部,2添加到底部)
	function appendMessage(datas,direction){
		if (datas!=null && datas.length>0){
			var html = '';
            var date=new Date();
			for (var i=0;i<datas.length;i++){
				var data = datas[i];
		
			    html += '<li class="np-post  topIco np-label-digest topAll topno">';		
			    html += '<div class="np-post-body">';
				html += '<div class="np-post-header">';
				
				html += '<span class=""><a post_uid="11722796" class="np-user popClick " title="啊龙" href="javascript:void(0)">';
				html += data.ip;
				html += '</a> </span>';
				
				html += '<span data="1406424157" class="np-time">';			
			    
			    html +=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate())+" "+date.getHours()+":"+date.getMinutes();
				
				html += '</span></div>';
				
				html += '<div class="np-post-content" data-height="5"><p>';
				
				html += data.text;	

				html += '</p></div></div></li>';
			}
			if (direction==1){
				$("#commentStart").before(html);
			}else{
				$("#commentEnd").after(html);
			}
		}
}
/*时间判断*/
function getTime(time)
{
  alert(time);
	if(time<10)
	{
 	return "0"+time;
	}else
	{
	return time;
}
}

/* json 日期转字符串 */
function jsonDataToString(dateStr) {
    if (dateStr.indexOf('T') != -1 && dateStr.indexOf('.') != -1) {
        dateStr = dateStr.replace('T', ' ').substring(0, dateStr.indexOf('.'));
    }
    return dateStr;
}
</script>
</head>
<body>
	<div class="main">
			<div class="header">
				<div class="logo">
				<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight eq 1 }">
					     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}" />
					</c:if>
				</c:forEach>
				</div>
				<div class="search">
					<div class="right_top">
						<a href="/font/index.do">
							首页
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#">
							成都天气：2014-14-14&nbsp;&nbsp;&nbsp;农历5月20&nbsp;&nbsp;&nbsp;
						</a>

						欢迎您来到互帮天下… 今天是2014年07月20日 星期天
					</div>
				<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight eq 2 }">
					     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="790"  height="95"/>
					</c:if>
			</c:forEach>
				</div>
			</div>
<!--header end-->
			<div class="nav">
			<a href="index.do">
				首页
			</a>
			<c:forEach items="${menulist}" var="menulist">
				<a href="findBroadcastListByNewsTypeId.do?contentTypeId=${menulist.id}&newsTypeId=${menulist.pid}" >
					${menulist.cname }
				</a>
			</c:forEach>
			</div>
			<div class="nav_img">
			<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					  
					<c:if test="${newsAdvertisingList.adWeight eq 3 }">
					 <a href="${ newsAdvertisingList.imageLink}" target="${ newsAdvertisingList.imageTarget}">
					     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="1000" height="99"/>
					</a>
					</c:if>
			</c:forEach>
			</div>
			<!---->
			<div class="content">
				<div class="c_left">
					<div class="main_tit">
						<h1 id="title"> 
						<c:choose>
							 <c:when test="${fn:length(pubBroadcastContent.title) > 22}">
									${fn:substring(pubBroadcastContent.title,0,22)}...
							 </c:when>
							 <c:otherwise>
							 ${pubBroadcastContent.title}
							 </c:otherwise>
							</c:choose>
						
						 </h1>
						<div class="info">
							<span id="pubtime"> <fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium"  value="${pubBroadcastContent.createTime}"/> </span>
							<span id="source"> 来源：
								${pubBroadcastContent.source} &nbsp;</span>

							<div>
								<div class="bdsharebuttonbox">
									<a href="#" class="bds_more" data-cmd="more"></a>
									<a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a>
									<a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a>
									<a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a>
									<a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a>
									<a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a>
									<a title="分享到百度贴吧" href="#" class="bds_tieba" data-cmd="tieba"></a>
									<a title="分享到腾讯朋友" href="#" class="bds_tqf" data-cmd="tqf"></a>
									<a title="分享到QQ好友" href="#" class="bds_sqq" data-cmd="sqq"></a>
								</div>
								<script>
								window._bd_share_config = {
								"common" : {
								"bdSnsKey" : {},
								"bdText" : "",
								"bdMini" : "2",
								"bdMiniList" : false,
								"bdPic" : "",
								"bdStyle" : "0",
								"bdSize" : "16"
								},
								"share" : {},
								"image" : {
								"viewList" : ["qzone", "tsina", "tqq", "renren", "weixin", "tieba", "tqf", "sqq"],
								"viewText" : "分享到：",
								"viewSize" : "16"
								},
								"selectShare" : {
								"bdContainerClass" : null,
								"bdSelectMiniList" : ["qzone", "tsina", "tqq", "renren", "weixin", "tieba", "tqf", "sqq"]
								}
								};
								with (document)
								0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
								</script>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					
					
					<div id="content" class="content1">
                      ${pubBroadcastContent.content}
					</div>
					
					
						<div id="top_reply">
						<h1 class="np-title">
						<a id="commentTotleNum" href=""hidefocus="true">
							<span id="countComment">
							<c:choose>
						    <c:when test="${empty pubBroadcastContent.commentCount}">
							0
							</c:when>
							<c:otherwise>
							${pubBroadcastContent.commentCount}
							</c:otherwise>
							</c:choose>
							</span>条评论
						</a><strong>网友评论</strong></h1>
                           
						<div class="out" id="commentArea">
							<div style="height:120px" id="np-reply-box" class="np-reply-box blueLight np-reply-box-active">

								<div class="np-reply-box-content textarea">
									<textarea id="top_textarea" accesskey="u" name="text" autocomplete="off" tabindex="1" style=""></textarea>
								</div>
								<div id="p_login_btn" style="position:relative;display:block;height:40px" class="commtSub np-reply-box-footer">
									<div class="submitBtn">
										<a id="top_post_btn" class="np-btn np-btn-submit" href="javascript:sendMsgAjax();" hidefocus="true">
											提交
										</a>
										<span style="display:none" class="np-tip-error"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="allComments">
					<c:if test="${list.size()>0}">
					<li class="np-title-hot">
								热门评论
					</li>	
					</c:if>
						<ul class="post-list np-comment-list" >
							<li id="commentStart"></li>
							<c:forEach items="${list}" var="dto" varStatus="status">
							<c:if test="${status.index lt 10}">
							<li class="np-post  topIco np-label-digest topAll topno ">
								<div class="np-post-body">
									<div class="np-post-header">
										<span class="">
											<a post_uid="11722796" class="np-user popClick " title="啊龙" href="javascript:void(0)">
												 ${dto.ip }
											</a> </span>
										<span data="1406424157" class="np-time">${dto.strCreateTime}</span>
									</div>
									<div class="np-post-content" data-height="5">
										<p>
											${dto.text }
										</p>
									</div>
								</div>

							</li>
							</c:if>
							</c:forEach>
							<li id="commentEnd"></li>
						</ul>
					</div>
					<c:if test="${list.size()>10}"> 
					<div class="np-load-more" id="loadMore" style="display: block;">
					   
						<a href="javascript:getMore();"><span id="moremess" name="moremess" style="display: block;">加载更多</span></a>
						<center><em id="nonemess" style="display: none;color:red" class="np-load-more-loading">没有更多了!</em></center>

					</div>
					</c:if>
				</div>
				<div class="c_right">
					<div id="data_pdtj">
						<div class="combox pdtj">
							<h2>频道推荐</h2>
							<div class="con">
								<div class="list_pic bg_pic">
									<ul id="pdtj1">
				  <c:forEach items="${newscontentList}" var="contentlist" varStatus="status">
					<c:forEach items="${contentlist.contentList}" var="newscontentlist">		  
			          <c:if test="${newscontentlist.imageId ne null or newscontentlist.imageUrl ne '' }">	
						<li>
					   <c:if test="${newscontentlist.imageUrl ne '' }">
							<p class="img">
							 <a href="editNewsContentCount.do?newsId=${newscontentlist.id}" >
								<img width="135" height="100" border="0"  alt="${newscontentlist.imageUrl}" src="${newscontentlist.imageUrl}">
							</a>
							</p>
						</c:if>
						<c:if test="${newscontentlist.imageId ne null }">
						<p class="img">
						 <a href="editNewsContentCount.do?newsId=${newscontentlist.id}" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="135" height="100" border="0" />
						</a>
						</p>
						</c:if>
							<p class="bg"></p>
							<p class="name">
								 <a href="editNewsContentCount.do?newsId=${newscontentlist.id}" >
									${newscontentlist.title}
								</a>
							</p>
						</li>
						</c:if>
						</c:forEach>
			</c:forEach>
</ul>
									<div class="clear"></div>
								</div>
								<ul id="pdtj2" class="list">
				<c:forEach items="${newscontentList}" var="contentlist" varStatus="status">
				<c:forEach items="${contentlist.contentList}" var="newscontentlist"  varStatus="status1">
				<c:if test="${status1.index lt 11 and status1.index gt 6}">
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				 <a href="editNewsContentCount.do?newsId=${newscontentlist.id}" >
				    [ ${newscontentlist.newsTypeName}  ]
				   ${newscontentlist.title }
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				  ${newscontentlist.title }
				  </c:if>
		          </li>	
		  </c:if>       
		        </c:forEach>
		        </c:forEach>
				</ul>
							</div>
						</div>
						
						<div class="combox pdtj">
							<h2>热评新闻</h2>
							<div class="con">
								<div class="list_pic bg_pic">
									<ul id="pdtj1">
					<c:forEach items="${newscontentMostCommentList}" var="mostCommentList">		  
			          <c:if test="${mostCommentList.imageId ne null or mostCommentList.imageUrl ne '' }">	
						<li>
					   <c:if test="${mostCommentList.imageUrl ne '' }">
							<p class="img">
							<a href="editNewsContentCount.do?newsId=${mostCommentList.id}" >
								<img width="135" height="100" border="0"  alt="${mostCommentList.imageUrl}" src="${mostCommentList.imageUrl}">
							</a>
							</p>
						</c:if>
						<c:if test="${mostCommentList.imageId ne null }">
						<p class="img">
						<a href="editNewsContentCount.do?newsId=${mostCommentList.id}" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${mostCommentList.imageId}"  width="135" height="100" border="0" />
						</a>
						</p>
						</c:if>
							<p class="bg"></p>
							<p class="name">
							<a href="editNewsContentCount.do?newsId=${mostCommentList.id}" >
									${mostCommentList.title}
								</a>
							</p>
						</li>
						</c:if>
						</c:forEach>
</ul>
				<div class="clear"></div>
				</div>
				<ul id="pdtj2" class="list">
				<c:forEach items="${newscontentMostCommentList}" var="mostCommentList"  varStatus="status1">
				<c:if test="${status1.index lt 11 and status1.index gt 6}">
			     	<li>
			     	<a href="editNewsContentCount.do?newsId=${mostCommentList.id}" >
				   ${mostCommentList.title }
		          </li>	
		          </c:if> 
		        </c:forEach>
				</ul>
				</div>
				</div>


	        <div class="combox pdtj">
							<h2>点击排行</h2>
							<div class="con">
								<div class="list_pic bg_pic">
									<ul id="pdtj1">
					<c:forEach items="${newscontentMostViewList}" var="mostViewList">		  
			          <c:if test="${mostViewList.imageId ne null or mostViewList.imageUrl ne '' }">	
						<li>
					   <c:if test="${mostViewList.imageUrl ne '' }">
							<p class="img">
							 <a href="editNewsContentCount.do?newsId=${mostViewList.id}" >
								<img width="135" height="100" border="0"  alt="${mostViewList.imageUrl}" src="${mostViewList.imageUrl}">
							</a>
							</p>
						</c:if>
						<c:if test="${mostViewList.imageId ne null }">
						<p class="img">
				 <a href="editNewsContentCount.do?newsId=${mostViewList.id}" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${mostViewList.imageId}"  width="135" height="100" border="0" />
						</a>
						</p>
						</c:if>
							<p class="bg"></p>
							<p class="name">
							   <a href="editNewsContentCount.do?newsId=${mostViewList.id}" >
									${mostViewList.title}
								</a>
							</p>
						</li>
						</c:if>
						</c:forEach>
</ul>
				<div class="clear"></div>
				</div>
				<ul id="pdtj2" class="list">
				<c:forEach items="${newscontentMostViewList}" var="mostViewList"  varStatus="status1">
				<c:if test="${status1.index lt 11} and status1.index gt 6">
			     	<li>
			     <a href="editNewsContentCount.do?newsId=${mostViewList.id}" >
				   ${mostViewList.title }
				   </a>
		          </li>	
		          </c:if>
		        </c:forEach>
				</ul>
				</div>
				</div>
	
					</div>
				</div>
			</div>
			<div class="clear">

			</div>
		</div>
		
		<!---->
		<div id="footer" class="footer">
			<div class="content p10">
				<p>
					Copyright &copy; 2000-2014 XINHUANET.com All Rights Reserved.本站所刊登的各种新闻﹑信息和各种专题专栏资料，均为####权所有，未经协议授权禁止下载使用。
				</p>
				<p style=" width:980px; margin:0 auto">
					<span style=" width:1000px;">
						<a target="_blank" href="#">
							简介
						</a> |
						<a target="_blank" href="#">
							关于我们
						</a> |
						<a target="_blank" href="#">
							联系我们
						</a> |
						<a target="_blank" href="#">
							我要链接
						</a> |
						<a target="_blank" href="#">
							版权声明
						</a> |
						<a target="_blank" href="#">
							法律顾问
						</a> |
						<a target="_blank" href="#">
							广告服务
						</a> |
						<a target="_blank" href="#">
							技术服务中心
						</a>
						<a target="_blank" href="#">
							京ICP证010042号
						</a> | 京公网安备：110000000015号 |
						<a href="#">
							网上传播视听节目许可证(0103020)
						</a> |
						<a href="#">
							中国互联网视听节目服务自律公约
						</a> |
						<a href="#">
							可信网站认证
						</a> |
						<a href="#">
							百度原创星火计划
						</a></span>
				</p>
			</div>


</div>

</body>
</html>