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
		<title>中闻传播-传播中闻</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
		<script src="${pageContext.request.contextPath}/js/front/jquery-1.8.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/front/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/front/datugundong.js" type="text/javascript" charset="utf-8"></script>		
		<link type="text/css" href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.event.drag-1.5.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.touchSlider.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			
				$(".main_visual").hover(function(){
					$("#btn_prev,#btn_next").fadeIn()
				},function(){
					$("#btn_prev,#btn_next").fadeOut()
				});
				
				$dragBln = false;
				
				$(".main_image").touchSlider({
					flexible : true,
					speed : 200,
					btn_prev : $("#btn_prev"),
					btn_next : $("#btn_next"),
					paging : $(".flicking_con a"),
					counter : function (e){
						$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
					}
				});
				
				$(".main_image").bind("mousedown", function() {
					$dragBln = false;
				});
				
				$(".main_image").bind("dragstart", function() {
					$dragBln = true;
				});
				
				$(".main_image a").click(function(){
					if($dragBln) {
						return false;
					}
				});
				
				timer = setInterval(function(){
					$("#btn_next").click();
				}, 5000);
				
				$(".main_visual").hover(function(){
					clearInterval(timer);
				},function(){
					timer = setInterval(function(){
						$("#btn_next").click();
					},5000);
				});
				
				$(".main_image").bind("touchstart",function(){
					clearInterval(timer);
				}).bind("touchend", function(){
					timer = setInterval(function(){
						$("#btn_next").click();
					}, 5000);
				});
				
			});
		</script>
		
		
		<script type="text/javascript">
		function toNewsDetail(id)
		{
		  var url="${pageContext.request.contextPath}/front/editNewsContentCount.do?newsId="+id;		
		  location=url;
		}
		</script>
	</head>
	<body>
		<div class="main">
			<div class="top">

			</div>
			<div class="header">
				<div class="logo">
					<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight eq 1 }">
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}" width="215" height="115"/>
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
							<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=11" width="500" height="15" frameborder="0"></iframe>
						</a>
					</div>
					<div>
					<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight eq 2 }">
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="790"  height="95"/>
					</c:if>
					</c:forEach>
					</div>
				</div>
			</div>
			<!--header end-->
			<div class="nav">
			<a href="index.do">
			首页
			</a>
			<c:forEach items="${menulist}" var="menulist">
			  	<a href="${pageContext.request.contextPath}/front/findBroadcastListByNewsTypeId.do?contentTypeId=${menulist.id}&newsTypeId=${menulist.pid}" >
					${menulist.cname }
				</a>
			</c:forEach>
			</div>
			
			<div class="nav_img">
				<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight eq 3 }">
					     <a href="${ newsAdvertisingList.imageLink}" target="${ newsAdvertisingList.imageTarget}">
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="1000" height="99"/>
					    </a>
					</c:if>
				</c:forEach>
			</div>
			<!---->	
			<div class="content">
				<div class="h_part2">
					<c:forEach items="${latestNewsContent}" var="latestNews"  varStatus="status">
					 <c:if test="${status.index eq 0}">
					<div id="fw_cov2" class="h_part2_top">
						<div id="hot_tt" class="img">
						<a href="javascript:toNewsDetail(${latestNews.id })">
							<c:choose>
							 <c:when test="${fn:length(latestNews.title) > 15}">
									${fn:substring(latestNews.title,0,15)}...
							 </c:when>
							 <c:otherwise>
							 ${latestNews.title}
							 </c:otherwise>
							 </c:choose>
							</a>

						</div>
						<div id="hot_zy" class="textlink">
							<a href="javascript:toNewsDetail(${latestNews.id })">
							
                	<c:choose>
				        <c:when test="${fn:length(latestNews.remark) > 40}">
					           ${fn:substring(latestNews.remark,0,40)}....[详细]<span></span>
	                     </c:when>
				    <c:otherwise>
					${latestNews.remark }
									[详细]
								<span></span>
				     </c:otherwise>
			      </c:choose>
							</a>
						</div>
					</div>
					</c:if>
					</c:forEach>
					
					<div id="fwl_cov4" class="h_part2_left">
						<div class="flicking_con">
							<c:forEach items="${latestNewsContent}" var="latestNews"  varStatus="status">	
							   <c:if test="${status.index lt 6}">
							    <c:if test="${latestNews.isRecommend eq 1 }">
							  <c:if test="${latestNews.imageId ne null}">
							    <a href="#">${status.index}</a>
							 </c:if></c:if>
							</c:if>
                            </c:forEach>
						</div>
					<div class="main_image">
						<ul>							
							<c:forEach items="${latestNewsContent}" var="latestNews"  varStatus="status">	
	                         <c:if test="${status.index lt 6}">
							 <c:if test="${latestNews.isRecommend eq 1 }">
							 <c:if test="${latestNews.imageId ne null}">
							 <a href="http://www.baidu.com">
							 <li><img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${latestNews.imageId}"  width="790"  height="300"></img></li></a>
                            </c:if></c:if>
                            </c:if>
							</c:forEach>
						</ul>
							<a href="javascript:;" id="btn_prev"></a>
							<a href="javascript:;" id="btn_next"></a>
						</div>
					</div>
					<div id="fwl_cov5" class="h_part2_right">
						<!--重要新闻-->
						<ul class="list fontblue">
						<c:forEach items="${latestNewsContent}" var="latestNews"  varStatus="status">
				        <c:if test="${status.index lt 12 and status.index gt 0}">
							<c:if test="${latestNews.isRecommend eq 1 }">
							<li>
								<span class="fontb  font_title2">
								<a href="javascript:toNewsDetail(${latestNews.id })">						     
										[${latestNews.contentTypeName }
										<c:if test="${latestNews.newsTypeName ne '' and !empty  latestNews.newsTypeName }">										
										-${latestNews.newsTypeName }</c:if>  ]
							<c:choose>
							 <c:when test="${fn:length(latestNews.title) > 15}">
									${fn:substring(latestNews.title,0,15)}...
							 </c:when>
							 <c:otherwise>
							 ${latestNews.title}
							 </c:otherwise>
							 </c:choose>
									</a>
			                  </span>
							</li>
							</c:if>
								<c:if test="${latestNews.isRecommend eq 0 }">
							<li class="fontblue2">
								<a href="javascript:toNewsDetail(${latestNews.id })">
										[${latestNews.contentTypeName }	
										<c:if test="${latestNews.newsTypeName ne '' and !empty  latestNews.newsTypeName  }">										
										-${latestNews.newsTypeName }</c:if>]
										<c:choose>
							 <c:when test="${fn:length(latestNews.title) > 15}">
									${fn:substring(latestNews.title,0,15)}...
							 </c:when>
							 <c:otherwise>
							 ${latestNews.title}
							 </c:otherwise>
							 </c:choose>
								</a>
							</li>
							</c:if>
                            </c:if>
                            </c:forEach>
						</ul>
						<!--重要新闻-->
					</div>
				</div>
				<!--new end-->
				<div class="weibo">
					<div class="weibo_title">
						热点微博
					</div>
					<ul>
					<c:forEach items="${friendlinklist}" var="linklist" varStatus="status">
					<c:if test="${status.index lt 8}">
						<li>
						<a href="${linklist.domain }"  target="_blank">			
				        <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ linklist.imageId}"  width="70" height="70"/>
							</a>
						</li>
				</c:if>
				</c:forEach>
					</ul>
				</div>
			</div>
			<!--end-->
			<div class="hot_right">
				<!--左边   -->			 
				 <c:forEach items="${newscontentList}"  var="contentlist" varStatus="status">		
				 <c:choose>
				   	<c:when test="${ status.index eq 0}">
				   	<div class="h_title" style="float: none;">		
				   	<span class="fl"><b class="c0486aa">${contentlist.newsTypeName}&nbsp;</b></span><span class="fr">
						<a href="${pageContext.request.contextPath}/front/findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }" >
							更多&gt;&gt;
						</a></span>
				</div>
				
			  <c:forEach items="${contentlist.contentList}" var="newscontentlist" varStatus="status1">
			  	<c:choose>
			  	<c:when test="${status1.index eq 0}">		  
			     <c:if test="${newscontentlist.imageId ne null or newscontentlist.imageUrl ne '' or newscontentlist.imageUrl ne null }">
				<div class="tab_box_content" style="display: block;">
					<div style="width:290px;" class="qzlx_pictit">
						<p class="img">
						<c:if test="${newscontentlist.imageUrl ne '' and newscontentlist.imageUrl ne null }">
						    <a href="javascript:toNewsDetail(${newscontentlist.id })">
								<img width="290" height="134" border="0" alt="" src="${newscontentlist.imageUrl}">
							</a>
							</c:if>
						<c:if test="${newscontentlist.imageId ne null }">
						   <a href="javascript:toNewsDetail(${newscontentlist.id })">
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="290" height="134" border="0" />
						</a>
						</c:if>
                        </p>
                        
						<p class="bg"></p>
						<p class="name">
						  <a href="javascript:toNewsDetail(${newscontentlist.id })">
							<c:choose>
							 <c:when test="${fn:length(newscontentlist.title) > 18}">
									${fn:substring(newscontentlist.title,0,18)}...
							 </c:when>
							 <c:otherwise>
							 ${newscontentlist.title}
							 </c:otherwise>
							 </c:choose>
							</a>
						</p>
					</div>
				</div>
				
				</c:if>
				</c:when>
				</c:choose>
				</c:forEach>
				
				<ul class="left_ul">
				
				<c:forEach items="${contentlist.contentList}" var="newscontentlist"  varStatus="status2">
				<c:if test="${status2.index lt 8 and status2.index gt 0}">		 
			
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				<a href="javascript:toNewsDetail(${newscontentlist.id })">
				    [ ${newscontentlist.newsTypeName}  ]
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				 <a href="javascript:toNewsDetail(${newscontentlist.id })">
				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
		          </li>	
		  
		</c:if>       
		        </c:forEach>
				</ul>
				</c:when>
			
				<c:when test="${ status.index eq 3 or status.index eq 6 or status.index eq 9}">				
				<div class="h_title" style="float: none;">
				 <!-- 体育,健康，时尚 -->
					<span class="fl"><b class="c0486aa">${contentlist.newsTypeName}&nbsp;</b></span><span class="fr">
							<a href="${pageContext.request.contextPath}/front/findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"   >
							更多&gt;&gt;
						</a></span>
				</div>
				<div id="part_pd2_12" class="list_pic left_pic left_pic2">
					<ul>
				<c:forEach items="${contentlist.contentList}" var="newscontentlist"  varStatus="status3">		
					 <c:if test="${status3.index eq 0 or status3.index eq 1 }">	  
			       <c:if test="${newscontentlist.imageId ne null or newscontentlist.imageUrl ne '' }" >	
			      
						<li>
					   <c:if test="${newscontentlist.imageUrl ne '' }">
							<a href="javascript:toNewsDetail(${newscontentlist.id })">
								<img width="139" height="95"  alt="${newscontentlist.imageUrl}" src="${newscontentlist.imageUrl}">
							</a>
							</c:if>
						<c:if test="${newscontentlist.imageId ne null }">
						<a href="javascript:toNewsDetail(${newscontentlist.id })">
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="139" height="95" border="0" />
						</a>
						</c:if>
							<p class="bg"></p>
							<p class="name">
								<a href="javascript:toNewsDetail(${newscontentlist.id })">
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 10}">
				${fn:substring(newscontentlist.title,0,10)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
								</a>
							</p>
						</li>
					
						</c:if>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				
				<ul class="left_ul">
				<c:forEach items="${contentlist.contentList}" var="newscontentlist"  varStatus="status4">
				<c:if test="${status4.index lt 8 and status4.index gt 1}">	 
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })">
				    [ ${newscontentlist.newsTypeName}  ]
				   				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				  	<a href="javascript:toNewsDetail(${newscontentlist.id })">
				  				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
		          </li>	
		</c:if>       
		        </c:forEach>
		        </ul>
				</c:when>
				
			<c:when test="${ status.index eq 12 }">	
	          <!-- 娱乐 -->
				<div class="h_title" style="float: none;">
					<span class="fl"><b class="c0486aa">${contentlist.newsTypeName}&nbsp;</b></span><span class="fr">
						<a href="${pageContext.request.contextPath}/front/findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"  >
							更多&gt;&gt;
						</a></span>
				</div>
				<div class="list_pic fontblue2">				
					<ul>
						<c:forEach items="${contentlist.contentList}" var="newscontentlist" varStatus="status12">
						<c:if test="${status12.index lt 8 }">
						<li>
						<p class="img">
						<a href="javascript:toNewsDetail(${newscontentlist.id })">
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newscontentlist.imageId}"  width="139" height="95" border="0" />
						</a>
						</p>
						<p class="name">
								<a href="javascript:toNewsDetail(${newscontentlist.id })">
			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 10}">
				${fn:substring(newscontentlist.title,0,10)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
								</a>
							</p>
						</li>
						</c:if>
						</c:forEach>
						
					</ul>
					<div class=""></div>
				</div>
				</c:when>
</c:choose>
</c:forEach>
</div>
<!-- 右边 -->
<div class="box_con">
 <c:forEach items="${newscontentList}" var="contentlist" varStatus="status">		
		<c:choose>
		<c:when test="${ status.index eq 1 or status.index eq 2}">        
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">${contentlist.newsTypeName}&nbsp;</b></span><span class="fr">
							<a href="${pageContext.request.contextPath}/front/findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"   >
								更多&gt;&gt;
							</a></span>
					</div>
				
			 <c:forEach items="${contentlist.contentList}" var="newscontentlist" varStatus="status5">	
			 <c:if test="${status5.index eq 0}">	 
			 <c:if test="${newscontentlist.imageUrl ne '' or newscontentlist.imageId ne null }" >  
					<dl>
						<dt class="fl">
							<div>
							   <c:if test="${newscontentlist.imageUrl ne null and newscontentlist.imageUrl ne ''}">
							    <a href="javascript:toNewsDetail(${newscontentlist.id })">
								<img width="95" height="70" border="0" alt="" src="http://www.xinhuanet.com/titlepic/119970757_title0h.jpg">
							   </a>
							  </c:if>
						      <c:if test="${newscontentlist.imageId ne null }">
						     <a href="javascript:toNewsDetail(${newscontentlist.id })">
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="95" height="70" border="0" />
						   </a>
						    </c:if>
							</div>
						</dt>
						<dd class="fr">
							<h4>
				<a href="javascript:toNewsDetail(${newscontentlist.id })">
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 15}">
				${fn:substring(newscontentlist.title,0,15)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
							</a></h4>
							<p class="c969696">
							<c:choose>
				              <c:when test="${fn:length(newscontentlist.remark) > 30}">
					           ${fn:substring(newscontentlist.remark,0,30)}...<span></span>
	                         </c:when>
				                <c:otherwise>
					            ${newscontentlist.remark}…<span></span>
				                </c:otherwise>
			                 </c:choose>
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					</c:if>
					</c:if>	
			</c:forEach>
					
					<ul>
				<c:forEach items="${contentlist.contentList}" var="newscontentlist"  varStatus="status6">
				<c:if test="${ status.index eq 1}"> 
				<c:if test="${status6.index lt 7 and status6.index gt 0}">
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })">
				    [ ${newscontentlist.newsTypeName}  ]
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </c:if>
		          </li>	
		          </c:if>	
		</c:if>
		<c:if test="${ status.index eq 2}"> 
				<c:if test="${status6.index lt 10}">
				 
				 <c:if test="${newscontentlist.imageId eq null and newscontentlist.imageUrl eq '' }">
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })">
				    [ ${newscontentlist.newsTypeName}  ]
			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				 				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </c:if>
		          </li>	
		          </c:if>
		          </c:if>	
		</c:if>   
		          </c:forEach>	
					</ul>

				</div>
</c:when>
</c:choose>
</c:forEach>

<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
    <c:if test="${newsAdvertisingList.adWeight eq 4 }">
    <a href="${ newsAdvertisingList.imageLink}" target="${ newsAdvertisingList.imageTarget}">
    <div class="inlist_02" style="height: auto;">
     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="323" height="64"/>
	</div>
	</a>

	</c:if>
	
	<c:if test="${newsAdvertisingList.adWeight eq 5 }">
	<a href="${ newsAdvertisingList.imageLink}" target="${ newsAdvertisingList.imageTarget}">
	 <div class="inlist_02" style="height: auto;">
	 <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="323" height="64"/>
	</div>
	</a>
	</c:if>
</c:forEach>

	 <c:forEach items="${newscontentList}" var="contentlist" varStatus="status" >		
		<c:choose>
		<c:when test="${ status.index eq 4 or status.index eq 5 or status.index eq 7 or status.index eq 8}">        
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">${contentlist.newsTypeName}&nbsp;</b></span><span class="fr">
							<a href="${pageContext.request.contextPath}/front/findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"  >
								更多&gt;&gt;
							</a></span>
					</div>
				
			 <c:forEach items="${contentlist.contentList}" var="newscontentlist" 	 varStatus="status7">	
			 <c:if test="${status7.index eq 0}">
			 <c:if test="${newscontentlist.imageUrl ne '' or newscontentlist.imageId ne null }" >  
					<dl>
						<dt class="fl">
							<div>
							   <c:if test="${newscontentlist.imageUrl ne null and newscontentlist.imageUrl ne ''}">
							    <a href="javascript:toNewsDetail(${newscontentlist.id })">
								<img width="95" height="70" border="0" alt="" src="http://www.xinhuanet.com/titlepic/119970757_title0h.jpg">
							   </a>
							  </c:if>
						      <c:if test="${newscontentlist.imageId ne null }">
						     <a href="javascript:toNewsDetail(${newscontentlist.id })">
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="95" height="70" border="0" />
						   </a>
						    </c:if>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="javascript:toNewsDetail(${newscontentlist.id })">
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 15}">
				${fn:substring(newscontentlist.title,0,15)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
							</a></h4>
							<p class="c969696">
								<c:choose>
				              <c:when test="${fn:length(newscontentlist.remark) > 30}">
					           ${fn:substring(newscontentlist.remark,0,30)}...<span></span>
	                         </c:when>
				                <c:otherwise>
					            ${newscontentlist.remark}…<span></span>
				                </c:otherwise>
			                 </c:choose>
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					</c:if>	
					</c:if>
			</c:forEach>
					
					<ul>
				<c:forEach items="${contentlist.contentList}" var="newscontentlist"  varStatus="status8">
				<c:if test="${status8.index lt 7 and status8.index gt 0 }">
				 
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })">
				    [ ${newscontentlist.newsTypeName}  ]
				  			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				 			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </c:if>
		          </li>	
		          </c:if>	  
		          </c:forEach>
					
					</ul>

				</div>
</c:when>
</c:choose>
</c:forEach>		
<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
    <c:if test="${newsAdvertisingList.adWeight eq 6 }">
       <a href="${ newsAdvertisingList.imageLink}" target="${ newsAdvertisingList.imageTarget}">
      <div class="inlist_02" style="height: auto;">
     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="340" height="64"/>
	</div>
	</a>
	</c:if>
	<c:if test="${newsAdvertisingList.adWeight eq 7 }">
	   <a href="${ newsAdvertisingList.imageLink}" target="${ newsAdvertisingList.imageTarget}">
	 <div class="inlist_02" style="height: auto;">
	 <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="340" height="64"/>
	</div>
	</a>
	</c:if>
</c:forEach>
	<c:forEach items="${newscontentList}" var="contentlist" varStatus="status">		
		<c:choose>
		<c:when test="${ status.index eq 10 or status.index eq 11 or status.index eq 13 or status.index eq 14}">     
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">${contentlist.newsTypeName}&nbsp;</b></span><span class="fr">
							<a href="${pageContext.request.contextPath}/front/findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"   >
								更多&gt;&gt;
							</a></span>
					</div>
				
			 <c:forEach items="${contentlist.contentList}" var="newscontentlist" varStatus="status9">	
			  <c:if test="${status9.index eq 0}">
			 <c:if test="${newscontentlist.imageUrl ne '' or newscontentlist.imageId ne null }" >  
					<dl>
						<dt class="fl">
							<div>
							   <c:if test="${newscontentlist.imageUrl ne null and newscontentlist.imageUrl ne ''}">
							    <a href="javascript:toNewsDetail(${newscontentlist.id })">
								<img width="95" height="70" border="0" alt="" src="http://www.xinhuanet.com/titlepic/119970757_title0h.jpg">
							   </a>
							  </c:if>
						      <c:if test="${newscontentlist.imageId ne null }">
						     <a href="javascript:toNewsDetail(${newscontentlist.id })">
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="95" height="70" border="0" />
						   </a>
						    </c:if>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="javascript:toNewsDetail(${newscontentlist.id })">
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 15}">
				${fn:substring(newscontentlist.title,0,15)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
							</a></h4>
							<p class="c969696">
							<c:choose>
				              <c:when test="${fn:length(newscontentlist.remark) > 30}">
					           ${fn:substring(newscontentlist.remark,0,30)}...<span></span>
	                         </c:when>
				                <c:otherwise>
					            ${newscontentlist.remark}…<span></span>
				                </c:otherwise>
			                 </c:choose>
								<a href="javascript:toNewsDetail(${newscontentlist.id })">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					</c:if>	
					</c:if>
			</c:forEach>
					
					<ul>
				<c:forEach items="${contentlist.contentList}" var="newscontentlist"  varStatus="status10">
				<c:if test="${status10.index lt 7 and status10.index gt 0}">
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })">
				    [ ${newscontentlist.newsTypeName}  ]
				 			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })">
				  			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}...
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
		          </li>	
		          </c:if>	 
		          </c:forEach>
					
					</ul>

				</div>
</c:when>
</c:choose>
</c:forEach>		

<div class="clear">

					</div>
				</div>
				<div class="clear">
				</div>	
				<!---->
			<div class="Jphoto">
				<div class="section-hd">
					<span class="mark">
						<a href="#">
							精彩图片
						</a></span>
					<span class="mark-sub">
						<a target="_blank" href="${pageContext.request.contextPath}/front/findImageNews.do">
							图片精选更多&gt;&gt;
						</a>
				 </span>
				</div>
				<div id="JslidePic" class="tab-wrap photo" style="overflow: hidden;">
					<ul class="pics" style="float: left;">
						<li class="photo-first">
							<a href="#">
						<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					       <c:if test="${newsAdvertisingList.adWeight eq 15 }">
					     <a href="${ newsAdvertisingList.imageLink}"  target="${ newsAdvertisingList.imageTarget}">
					     <img width="330" height="300" style="vertical-align: middle;" src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}" />
					        	<i class="title">${ newsAdvertisingList.adName}</i>
					      </a>
					      </c:if>					    
					      </c:forEach>
							
							</a>
						</li>					
					<c:forEach items="${findImageMaterial}" var="findImageMaterial" varStatus="item">
					<c:if test="${item.index lt 7}">
					    <li class="photo_bor">
					    <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${findImageMaterial.id}" target="_blank">
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${findImageMaterial.imageId}"  width="189" height="117" />
					     <i class="title">${findImageMaterial.title}</i>
					     </a>
					     </li>
					</c:if>
					</c:forEach>
					</ul>
				</div>
			</div>
			<!---->
			<div class="foot_LoopBox line-down line-top">
				<div class="bd">
					<div style="overflow:hidden; position:relative; width:966px" class="tempWrap">
						<ul style="width: 2415px; position: relative; overflow: hidden; padding: 0px; margin: 0px; left: -498px;">
					<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight gt 14}">
					<c:if test="${newsAdvertisingList.adWeight gt 1 }">
					    <li class="clone" style="float: left; width: 145px;">
					    <a href="${ newsAdvertisingList.imageLink}" target="_blank">
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  />
					     </a>
					     </li>
					</c:if>
					</c:if>
					</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				jQuery(".foot_LoopBox").slide({
					mainCell : ".bd ul",
					effect : "leftMarquee",
					vis : 6,
					interTime : 40,
					autoPlay : true
				});
			</script>
		</div>
		<!---->
				
			</div>
			<div class="clear">

			</div>
			
		<div id="footer" class="footer">
			<div class="content p10">
				<p>
					Copyright &copy; 2014-2018 <a href="http://www.zwzxnews.com" target="_blank">zwzxnews.com</a> All Rights Reserved.本站所刊登的各种新闻﹑信息和各种专题专栏资料，均为中闻在线权所有，未经协议授权禁止下载使用。
				</p>
				<p style=" width:980px; margin:0 auto">
					<span style=" width:1000px;">
			 <c:forEach items="${friendlinklist1}" var="linklist" varStatus="status">
					<a href="${linklist.domain }"  target="_blank">			
				      ${linklist.siteName }
					</a>|	
				</c:forEach>			
			  </span>
				</p>
			</div>
		</div>
	</body>
</html>
