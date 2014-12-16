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
		<title>中闻在线</title>
		<meta name="description" content="中闻传播-传播中闻" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
		
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/front/jquery-1.8.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/front/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>		
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/front/startMove.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/front/imageMove.js"></script>
		
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
		  window.open(url ,"_blank") ;
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
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}" width="211" height="115"/>
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
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="790"  height="97"/>
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
					<c:forEach items="${importentNews}" var="importentNews"  varStatus="status">
					 <c:if test="${status.index eq 0}">
					<div id="fw_cov2" class="h_part2_top">
						<div id="hot_tt" class="img">
						<a href="javascript:toNewsDetail(${importentNews.id })" >
							<c:choose>
							 <c:when test="${fn:length(importentNews.title) > 20}">
									${fn:substring(importentNews.title,0,20)}
							 </c:when>
							 <c:otherwise>
							 ${importentNews.title}
							 </c:otherwise>
							 </c:choose>
							</a>

						</div>
						<div id="hot_zy" class="textlink">
							<a href="javascript:toNewsDetail(${importentNews.id })" >
							
                	<c:choose>
				        <c:when test="${fn:length(importentNews.remark) > 60}">
					           ${fn:substring(importentNews.remark,0,60)}[详细]<span></span>
	                     </c:when>
				    <c:otherwise>
					${importentNews.remark }
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

	<ul id="pic_list">
	<c:forEach items="${recommendNews}" var="recommendNews"  varStatus="status">
	 <c:if test="${recommendNews.isRecommend eq 1 }">	
	  <c:if test="${recommendNews.imageId ne null}">
	   <c:if test="${status.index eq 1}">
	     <li style="z-index:2;opacity:1;fliter:alpha(opacity=100);">
		<a href="javascript:toNewsDetail(${recommendNews.id })" ><img width="535" height="500" src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${recommendNews.imageId}" alt="" />
		</a></li>
		</c:if>
		<c:if test="${status.index ne 1}">
		<li>
		<a href="javascript:toNewsDetail(${recommendNews.id })" ><img width="535" height="500" src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${recommendNews.imageId}" alt="" />
		</a></li>
		</c:if>
      </c:if></c:if>
		
	</c:forEach>
	</ul>

	<div class="marke"></div>
	<ul id="text_list">
	<c:forEach items="${recommendNews}" var="recommendNews"  varStatus="status">
	 <c:if test="${recommendNews.isRecommend eq 1 }">	
	  <c:if test="${recommendNews.imageId ne null}">
	   <c:if test="${status.index eq 1}">
	    <li><h2 class="show">
		<a href="javascript:toNewsDetail(${recommendNews.id })" >
		${recommendNews.title }
		</a></h2></li>
		</c:if>
		<c:if test="${status.index ne 1}">
		<li><h2>
		<a href="javascript:toNewsDetail(${recommendNews.id })" >
		${recommendNews.title }
		</a></h2></li>
		</c:if>
      </c:if></c:if>
		
	</c:forEach>
	</ul>
	
	<div id="ico_list">
		<ul>
		
		<c:forEach items="${recommendNews}" var="recommendNews"  varStatus="status">
		 <c:if test="${recommendNews.isRecommend eq 1 }">	
		  <c:if test="${recommendNews.imageId ne null}">
		   <c:if test="${status.index eq 1}">
		    <li class="active"><a href="javascript:void(0)">
			<img width="64" height="34" src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${recommendNews.imageId}" alt="" />
			</a></h2></li>
			</c:if>
			<c:if test="${status.index ne 1}">
			<li><h2>
			<a href="javascript:void(0)">
			<img width="64" height="34" src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${recommendNews.imageId}" alt="" />
			</a></h2></li>
			</c:if>
	      </c:if></c:if>
			
		</c:forEach>
		
		</ul>
	</div>
	
	<a href="javascript:void(0)" id="btn_prev" class="btn"></a>
	<a href="javascript:void(0)" id="btn_next" class="btn showBtn"></a>

</div>					
					
					
					
					<div id="fwl_cov5" class="h_part2_right">
						<!--重要新闻-->
						<ul class="list fontblue">
						<c:forEach items="${importentNews}" var="importentNews"  varStatus="status">
				        <c:if test="${status.index lt 12 and status.index gt 0}">
							<c:if test="${importentNews.isRecommend eq 1 }">
							<li>
								<span class="fontb  font_title2">
								<a href="javascript:toNewsDetail(${importentNews.id })" >					
							<c:choose>
							 <c:when test="${fn:length(importentNews.title) > 20}">
									${fn:substring(importentNews.title,0,20)}
							 </c:when>
							 <c:otherwise>
							 ${importentNews.title}
							 </c:otherwise>
							 </c:choose>
									</a>
			                  </span>
							</li>
							</c:if>
								<c:if test="${importentNews.isRecommend eq 0 }">
							<li class="fontblue2">
								<a href="javascript:toNewsDetail(${importentNews.id })" >
										<c:choose>
							 <c:when test="${fn:length(importentNews.title) > 20}">
									${fn:substring(importentNews.title,0,20)}
							 </c:when>
							 <c:otherwise>
							 ${importentNews.title}
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
						<a href="${linklist.domain }"  >			
				        <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ linklist.imageId}"  width="70" height="74"/>
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
				   	<c:when test="${status.index eq 0}">
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
						    <a href="javascript:toNewsDetail(${newscontentlist.id })" >
								<img width="290" height="134" border="0" alt="" src="${newscontentlist.imageUrl}">
							</a>
							</c:if>
						<c:if test="${newscontentlist.imageId ne null }">
						   <a href="javascript:toNewsDetail(${newscontentlist.id })" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="290" height="134" border="0" />
						</a>
						</c:if>
                        </p>
                        
						<p class="bg"></p>
						<p class="name">
						  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
							<c:choose>
							 <c:when test="${fn:length(newscontentlist.title) > 18}">
									${fn:substring(newscontentlist.title,0,18)}
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
				<a href="javascript:toNewsDetail(${newscontentlist.id })" >
				    [ ${newscontentlist.newsTypeName}  ]
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				 <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}
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
							<a href="javascript:toNewsDetail(${newscontentlist.id })" >
								<img width="139" height="95"  alt="${newscontentlist.imageUrl}" src="${newscontentlist.imageUrl}">
							</a>
							</c:if>
						<c:if test="${newscontentlist.imageId ne null }">
						<a href="javascript:toNewsDetail(${newscontentlist.id })" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="139" height="95" border="0" />
						</a>
						</c:if>
							<p class="bg"></p>
							<p class="name">
					<a href="javascript:toNewsDetail(${newscontentlist.id })" >
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 10}">
				${fn:substring(newscontentlist.title,0,10)}
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
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				    [ ${newscontentlist.newsTypeName}  ]
				   				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				  	<a href="javascript:toNewsDetail(${newscontentlist.id })" >
				  				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}
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
						<c:if test="${status12.index lt 6 }">
						<li>
						<p class="img">
						<a href="javascript:toNewsDetail(${newscontentlist.id })" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newscontentlist.imageId}"  width="139" height="95" border="0" />
						</a>
						</p>
						<p class="name">
								<a href="javascript:toNewsDetail(${newscontentlist.id })" >
			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 10}">
				${fn:substring(newscontentlist.title,0,10)}
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
							    <a href="javascript:toNewsDetail(${newscontentlist.id })" >
								<img width="95" height="70" border="0" alt="" src="http://www.xinhuanet.com/titlepic/119970757_title0h.jpg">
							   </a>
							  </c:if>
						      <c:if test="${newscontentlist.imageId ne null }">
						     <a href="javascript:toNewsDetail(${newscontentlist.id })" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="95" height="70" border="0" />
						   </a>
						    </c:if>
							</div>
						</dt>
						<dd class="fr">
							<h4>
				<a href="javascript:toNewsDetail(${newscontentlist.id })" >
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 15}">
				${fn:substring(newscontentlist.title,0,15)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
							</a></h4>
							<p class="c969696">
							<c:choose>
				              <c:when test="${fn:length(newscontentlist.remark) > 30}">
					           ${fn:substring(newscontentlist.remark,0,30)}<span></span>
	                         </c:when>
				                <c:otherwise>
					            ${newscontentlist.remark}<span></span>
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
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				    [ ${newscontentlist.newsTypeName}  ]
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				 <c:if test="${newscontentlist.newsTypeName eq null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 18}">
				${fn:substring(newscontentlist.title,0,18)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
			    </a>
				  </c:if>
				
		          </li>	
		          </c:if>	
		</c:if>
		<c:if test="${ status.index eq 2}"> 
				<c:if test="${status6.index lt 10}">
				 
				 <c:if test="${newscontentlist.imageId eq null and newscontentlist.imageUrl eq '' }">
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				    [ ${newscontentlist.newsTypeName}  ]
			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 20}">
				${fn:substring(newscontentlist.title,0,20)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				   <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				 				 <c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 20}">
				${fn:substring(newscontentlist.title,0,20)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
			  	  </a>
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
							    <a href="javascript:toNewsDetail(${newscontentlist.id })" >
								<img width="95" height="70" border="0" alt="" src="http://www.xinhuanet.com/titlepic/119970757_title0h.jpg">
							   </a>
							  </c:if>
						      <c:if test="${newscontentlist.imageId ne null }">
						     <a href="javascript:toNewsDetail(${newscontentlist.id })" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="95" height="70" border="0" />
						   </a>
						    </c:if>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="javascript:toNewsDetail(${newscontentlist.id })" >
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 20}">
				${fn:substring(newscontentlist.title,0,20)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
							</a></h4>
							<p class="c969696">
								<c:choose>
				              <c:when test="${fn:length(newscontentlist.remark) > 30}">
					           ${fn:substring(newscontentlist.remark,0,30)}<span></span>
	                         </c:when>
				                <c:otherwise>
					            ${newscontentlist.remark}<span></span>
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
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				    [ ${newscontentlist.newsTypeName}  ]
				  			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 20}">
				${fn:substring(newscontentlist.title,0,20)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				<c:if test="${newscontentlist.newsTypeName eq null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				 			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 20}">
				${fn:substring(newscontentlist.title,0,20)}
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
							    <a href="javascript:toNewsDetail(${newscontentlist.id })" >
								<img width="95" height="70" border="0" alt="" src="http://www.xinhuanet.com/titlepic/119970757_title0h.jpg">
							   </a>
							  </c:if>
						      <c:if test="${newscontentlist.imageId ne null }">
						     <a href="javascript:toNewsDetail(${newscontentlist.id })" >
						    <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${newscontentlist.imageId}"  width="95" height="70" border="0" />
						   </a>
						    </c:if>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="javascript:toNewsDetail(${newscontentlist.id })" >
				<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 15}">
				${fn:substring(newscontentlist.title,0,15)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
							</a></h4>
							<p class="c969696">
							<c:choose>
				              <c:when test="${fn:length(newscontentlist.remark) > 30}">
					           ${fn:substring(newscontentlist.remark,0,30)}<span></span>
	                         </c:when>
				                <c:otherwise>
					            ${newscontentlist.remark}…<span></span>
				                </c:otherwise>
			                 </c:choose>
								<a href="javascript:toNewsDetail(${newscontentlist.id })" >
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
				<c:if test="${status10.index lt 10 and status10.index gt 0}">
			     	<li>
			     <c:if test="${newscontentlist.newsTypeName ne null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				    [ ${newscontentlist.newsTypeName}  ]
				 			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}
				 </c:when>
		          <c:otherwise>
		          ${newscontentlist.title}
			  </c:otherwise>
			  </c:choose>
				  </a>
				  </c:if>
				  <c:if test="${newscontentlist.newsTypeName eq null}">
				  <a href="javascript:toNewsDetail(${newscontentlist.id })" >
				  			<c:choose>
  			    <c:when test="${fn:length(newscontentlist.title) > 17}">
				${fn:substring(newscontentlist.title,0,17)}
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
					     <img width="350" height="302" style="vertical-align: middle;" src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}" />
					        	<i class="title">${ newsAdvertisingList.adName}</i>
					      </a>
					      </c:if>					    
					      </c:forEach>
							
							</a>
						</li>					
					<c:forEach items="${findImageMaterial}" var="findImageMaterial" varStatus="item">
					    <li class="photo_bor">
					    <a href="${pageContext.request.contextPath}/front/findImageNewsByImageId.do?imageMaterialId=${findImageMaterial.id}" target="_blank">
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${findImageMaterial.imageId}"  width="189" height="117" />
					     <i class="title">${findImageMaterial.title}</i>
					     </a>
					     </li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<!---->
			<div class="foot_LoopBox line-down line-top">
				<div class="bd">
					<div style="overflow:hidden; position:relative; width:966px" class="tempWrap">
						<ul style="width: 2415px; position: relative; overflow: hidden; padding: 0px; margin: 0px; left: -498px;">
					<c:forEach items="${newsEndAdvertisingList}" var="newsEndAdvertisingList">
					    <li class="clone" style="float: left; width: 145px;">
					    <a href="${newsEndAdvertisingList.imageLink}" target="_blank">
					     <img src="${pageContext.request.contextPath}/resClientAttachmentController/clientViewImage.do?attachmentId=${newsEndAdvertisingList.imageId}"  />
					     </a>
					     </li>
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

				<p style=" width:980px; margin:0 auto">
					<span style=" width:1000px;">
			 <c:forEach items="${friendlinklist1}" var="linklist" varStatus="status">
			       <c:if test="${linklist.isEnabled eq 'true'}">
					<a href="${linklist.domain }"  target="_blank">			
				      ${linklist.siteName }
					</a>|	
					</c:if>
				</c:forEach>			
			  </span>
				</p>
				<p>
					Copyright &copy; 2014-2018 <a href="http://www.zwzxnews.com" target="_blank">zwzxnews.com</a> All Rights Reserved.本网登载的内容（凡注明来源为“中闻在线”）版权属中闻在线文化传播（四川）有限公司独家所有使用，未经协议授权禁止下载使用。
					</p>
					<p>
					24小时信息报料热线:18000539556 18030799556 合作交流QQ：45681026 欢迎访问中闻在线<a href="http://www.zwzxnews.com" target="_blank"zwzxnews.com</a> 法律顾问:张杰  中华人民共和国信息产业部备案登记号：蜀ICP备14023943号
				</p>
			</div>
		</div>
	</body>
</html>
