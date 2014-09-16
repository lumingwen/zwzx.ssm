<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>详细列表</title>
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
function toNewsDetail(id)
{
   var url="editNewsContentCount.do?newsId="+id;		
   location=url;
}
 var page = 2;	
//查看更多
function getMore(){
		$('#moremess').text('数据加载中,请稍候...');
		$.ajax({    
	        type:'POST',       
	        url:'../front/getMoreNewsListAjax.do',
	        data : {'page':page,'contentTypeId':${contentTypeId}},
	        cache:false, 
	        success:function(data){
	        	if (data!=null && data.length>0){
	        		appendMessage(data,1);
	        		page++;
	        	}else{
	        	    $('#moremess').css('display','none');	        	 
	        		$('#nonemess').css('display','block');
	        	}
	        }
		});
	}	
	//添加最新消息到页面(direction:1添加到顶部,2添加到底部)
function appendMessage(datas,direction){
		if (datas!=null && datas.length>0){
			var html = '';
            
			for (var i=0;i<datas.length;i++){
				var data = datas[i];
			    html += '<div class="Q-tpList"><div class="Q-tpWrap" id="Q-tpWrap">	';					   
				html += '<em bosszone="news2" class="f14 l24"><span><span>';
				html += '<a href="editNewsContentCount.do?newsId="'+data.id+'  class="linkto">';
				html +=  data.title;
				html += '</a></span></span></em>';
				if(data.remark.length>110)
				{
				 html += data.remark.substring(0,110);
				}
                else
                {
                 html += data.remark;
                }
				html += '<div class="btns">';
				html += '<a href="editNewsContentCount.do?newsId="'+data.id+'  class="discuzBtn">';
				html +=  data.commentCount;
				html += '</a></div></div><div class="clear"></div></div>';
			}
			
			if (direction==1){
				$("#loadMore").before(html);
				$('#moremess').text('加载更多');
			}else{
				$("#loadMore").after(html);
			}
		}
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
						<a href="index.do">
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
					     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="1000"  height="99"/>
					</a>
					</c:if>
			</c:forEach>
			</div>
			<!---->
			
			<div class="main">
			
			<div class="db_left">
			
				<c:forEach items="${newscontentList}" var="newsContentList" varStatus="status">			
				<c:if test="${status.index lt 10}">
				<div class="Q-tpList">
					<div class="Q-tpWrap" id="Q-tpWrap">					
					<em bosszone="news2" class="f14 l24"><span><span>
						<a href="editNewsContentCount.do?newsId=${ newsContentList.id}"  class="linkto">
									${newsContentList.title}
						</a></span></span></em>
							<c:choose>
				              <c:when test="${fn:length(newsContentList.remark) > 110}">
					            <p class="l22">
					           ${fn:substring(newsContentList.remark,0,110)}
					           </p>
	                         </c:when>
				                <c:otherwise>
				                <p class="l22">
					            ${newsContentList.remark}
					             </p>
				                </c:otherwise>
			                 </c:choose>
			                	
			                
						<div class="btns">
						<a href="editNewsContentCount.do?newsId=${ newsContentList.id}"  class="discuzBtn">
								${newsContentList.commentCount}
							</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				</c:if>
				
				
				</c:forEach>
				<c:if test="${newscontentList.size()>10}"> 
					<div class="np-load-more" id="loadMore" style="display: block;">					   
						<a href="javascript:getMore();"><span id="moremess" style="display: block;">加载更多</span></a>
						<span id="nonemess" style="display: none;" class="np-load-more-loading">没有更多了</span>
					</div>
					</c:if>	
			</div>
			
		<div class="c_right">	
					<div id="data_pdtj">
						<div class="combox pdtj">
							<h2>最新新闻</h2>
							<div class="con">
								<div class="list_pic bg_pic">
									<ul id="pdtj1">
					<c:forEach items="${newscontentNewstNewsList}" var="mostNewstList" varStatus="status">
					<c:if test="${status.index lt 6}">		  
			          <c:if test="${mostNewstList.imageId ne null or mostNewstList.imageUrl ne '' }">	
						<li>
					   <c:if test="${mostNewstList.imageUrl ne '' }">
							<p class="img">
							<a href="editNewsContentCount.do?newsId=${ mostNewstList.id}" >
								<img width="135" height="100" border="0"  alt="${mostNewstList.imageUrl}" src="${mostNewstList.imageUrl}">
							</a>
							</p>
						</c:if>
						<c:if test="${mostNewstList.imageId ne null }">
						<p class="img">
						<a href="editNewsContentCount.do?newsId=${ mostNewstList.id}" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${mostNewstList.imageId}"  width="135" height="100" border="0" />
						</a>
						</p>
						</c:if>
							<p class="bg"></p>
							<p class="name">
								<a href="editNewsContentCount.do?newsId=${ mostNewstList.id}" >
									${mostNewstList.title}
								</a>
							</p>
						</li>
						</c:if>
						</c:if>
						</c:forEach>
</ul>
				<div class="clear"></div>
				</div>
				<ul id="pdtj2" class="list">
				<c:forEach items="${newscontentNewstNewsList}" var="newstNesList"  varStatus="status1">
				<c:if test="${status1.index lt 11 and status1.index gt 6}">
			     	<li>
			     	<a href="editNewsContentCount.do?newsId=${ newstNesList.id}" >
				   ${newstNesList.title }
				   </a>
		          </li>	
		          </c:if>      
		        </c:forEach>
				</ul>
				</div>
				</div>
						<div class="combox pdtj">
							<h2>热评新闻</h2>
							<div class="con">
								<div class="list_pic bg_pic">
									<ul id="pdtj1">
					<c:forEach items="${newscontentMostCommentList}" var="mostCommentList"  varStatus="status">	
					<c:if test="${status.index lt 6}">		  
			          <c:if test="${mostCommentList.imageId ne null or mostCommentList.imageUrl ne '' }">	
						<li>
					   <c:if test="${mostCommentList.imageUrl ne '' }">
							<p class="img">
						 <a href="editNewsContentCount.do?newsId=${ mostCommentList.id}" >
								<img width="135" height="100" border="0"  alt="${mostCommentList.imageUrl}" src="${mostCommentList.imageUrl}">
							</a>
							</p>
						</c:if>
						<c:if test="${mostCommentList.imageId ne null }">
						<p class="img">
						<a href="editNewsContentCount.do?newsId=${ mostCommentList.id}" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${mostCommentList.imageId}"  width="135" height="100" border="0" />
						</a>
						</p>
						</c:if>
							<p class="bg"></p>
							<p class="name">
									<a href="editNewsContentCount.do?newsId=${ mostCommentList.id}" >
									${mostCommentList.title}
								</a>
							</p>
						</li>
						</c:if>
						</c:if>
						</c:forEach>
</ul>
				<div class="clear"></div>
				</div>
				<ul id="pdtj2" class="list">
				<c:forEach items="${newscontentMostCommentList}" var="mostCommentList" varStatus="status1">
				<c:if test="${status1.index lt 11 and status1.index gt 6}">
			     	<li>
			     <a href="editNewsContentCount.do?newsId=${ mostCommentList.id}" >
				   ${mostCommentList.title }
				   </p>
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
					<c:forEach items="${newscontentMostViewList}" var="mostViewList" varStatus="status">
					<c:if test="${status.index lt 6}">			  
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
						</c:if>
						</c:forEach>
</ul>
				<div class="clear"></div>
				</div>
				<ul id="pdtj2" class="list">
				<c:forEach items="${newscontentMostViewList}" var="mostViewList"  varStatus="status1">
				<c:if test="${status1.index lt 11 and status1.index gt 6}">
			     	<li>
			     	<a href="editNewsContentCount.do?newsId=${mostViewList.id}" >
				   ${mostViewList.title }
				   </p>
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