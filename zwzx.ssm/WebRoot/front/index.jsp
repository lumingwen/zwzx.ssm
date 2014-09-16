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
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/main.css"/>
		<script src="../js/front/jquery-1.8.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/front/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/front/datugundong.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		function toNewsDetail(id)
		{
		  var url="editNewsContentCount.do?newsId="+id;		
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
					<div>
					<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight eq 2 }">
					     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="790"  height="95"/>
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
						<div id="bigpic">
							<div id="focus_pic" class="focusPic">
								<div id="l_btn01" class="l_btn"></div>
								<div id="r_btn01" class="r_btn"></div>
								<div class="bigpic_box">
									<div class="fpic" style="display: none;">
										<a target="_blank" href="#">
											<img width="522" height="270" border="0" alt="习近平参观阿根廷共和国庄园" src="http://www.xinhuanet.com/titlepic/1111703484_title0h.jpg">
										</a>
										<h3>
										<a target="_blank" href="#">
											习近平参观阿根廷共和国庄园
										</a></h3>
										<span class="f_bg"></span>
										<div id="bigPicDetail" class="item_detail_info">
											<div class="close">
												<a href="javascript:void(0)"></a>
											</div>
											<div class="detail_info_left">
												<p class="pic">
													<a target="_blank" href="#">
														<img border="0" alt="揭秘赌王4老婆11千金" src="http://www.xinhuanet.com/titlepic/115068384_title0h.jpg">
													</a>
												</p>
												<p class="name2">
													<a target="_blank" href="#">
														揭秘赌王4老婆11千金
													</a>
												</p>
											</div>
											<div class="detail_info_right">
												<ul>
													<li>
														<a target="_blank" href="#">
															利率正攻坚 汇率待放宽
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															健美锦标赛 女选手前凸后翘秀好身材
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															超萌动物GIF 组图
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															女富二代接班 中国女掌门人比例或将高于美国
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															气温攀升 年轻女孩上演“清凉style”
														</a>
													</li>
												</ul>
											</div>
										</div>
										<a style="display:none" href="javascript:void(0)" class="btn_zk">
											展开
										</a>
									</div>
									<div class="fpic" style="display: none;">
										<a target="_blank" href="#">
											<img width="522" height="270" border="0" alt="习近平参观阿根廷共和国庄园" src="http://www.xinhuanet.com/titlepic/1111703484_title0h.jpg">
										</a>
										<h3>
										<a target="_blank" href="#">
											习近平参观阿根廷共和国庄园
										</a></h3>
										<span class="f_bg"></span>
										<div id="bigPicDetail" class="item_detail_info">
											<div class="close">
												<a href="javascript:void(0)"></a>
											</div>
											<div class="detail_info_left">
												<p class="pic">
													<a target="_blank" href="#">
														<img border="0" alt="揭秘赌王4老婆11千金" src="http://www.xinhuanet.com/titlepic/115068384_title0h.jpg">
													</a>
												</p>
												<p class="name2">
													<a target="_blank" href="#">
														揭秘赌王4老婆11千金
													</a>
												</p>
											</div>
											<div class="detail_info_right">
												<ul>
													<li>
														<a target="_blank" href="#">
															利率正攻坚 汇率待放宽
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															健美锦标赛 女选手前凸后翘秀好身材
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															超萌动物GIF 组图
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															女富二代接班 中国女掌门人比例或将高于美国
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															气温攀升 年轻女孩上演“清凉style”
														</a>
													</li>
												</ul>
											</div>
										</div>
										<a style="display:none" href="javascript:void(0)" class="btn_zk">
											展开
										</a>
									</div>
									<div class="fpic" style="display: none;">
										<a target="_blank" href="#">
											<img width="522" height="270" border="0" alt="习近平参观阿根廷共和国庄园" src="http://www.xinhuanet.com/titlepic/1111703484_title0h.jpg">
										</a>
										<h3>
										<a target="_blank" href="#">
											习近平参观阿根廷共和国庄园
										</a></h3>
										<span class="f_bg"></span>
										<div id="bigPicDetail" class="item_detail_info">
											<div class="close">
												<a href="javascript:void(0)"></a>
											</div>
											<div class="detail_info_left">
												<p class="pic">
													<a target="_blank" href="#">
														<img border="0" alt="揭秘赌王4老婆11千金" src="http://www.xinhuanet.com/titlepic/115068384_title0h.jpg">
													</a>
												</p>
												<p class="name2">
													<a target="_blank" href="#">
														揭秘赌王4老婆11千金
													</a>
												</p>
											</div>
											<div class="detail_info_right">
												<ul>
													<li>
														<a target="_blank" href="#">
															利率正攻坚 汇率待放宽
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															健美锦标赛 女选手前凸后翘秀好身材
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															超萌动物GIF 组图
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															女富二代接班 中国女掌门人比例或将高于美国
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															气温攀升 年轻女孩上演“清凉style”
														</a>
													</li>
												</ul>
											</div>
										</div>
										<a style="display:none" href="javascript:void(0)" class="btn_zk">
											展开
										</a>
									</div>
									<div class="fpic" style="display: none;">
										<a target="_blank" href="#">
											<img width="522" height="270" border="0" alt="习近平参观阿根廷共和国庄园" src="http://www.xinhuanet.com/titlepic/1111703484_title0h.jpg">
										</a>
										<h3>
										<a target="_blank" href="#">
											习近平参观阿根廷共和国庄园
										</a></h3>
										<span class="f_bg"></span>
										<div id="bigPicDetail" class="item_detail_info">
											<div class="close">
												<a href="javascript:void(0)"></a>
											</div>
											<div class="detail_info_left">
												<p class="pic">
													<a target="_blank" href="#">
														<img border="0" alt="揭秘赌王4老婆11千金" src="http://www.xinhuanet.com/titlepic/115068384_title0h.jpg">
													</a>
												</p>
												<p class="name2">
													<a target="_blank" href="#">
														揭秘赌王4老婆11千金
													</a>
												</p>
											</div>
											<div class="detail_info_right">
												<ul>
													<li>
														<a target="_blank" href="#">
															利率正攻坚 汇率待放宽
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															健美锦标赛 女选手前凸后翘秀好身材
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															超萌动物GIF 组图
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															女富二代接班 中国女掌门人比例或将高于美国
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															气温攀升 年轻女孩上演“清凉style”
														</a>
													</li>
												</ul>
											</div>
										</div>
										<a style="display:none" href="javascript:void(0)" class="btn_zk">
											展开
										</a>
									</div>
									<div class="fpic" style="display: none;">
										<a target="_blank" href="#">
											<img width="522" height="270" border="0" alt="习近平参观阿根廷共和国庄园" src="http://www.xinhuanet.com/titlepic/1111703484_title0h.jpg">
										</a>
										<h3>
										<a target="_blank" href="#">
											习近平参观阿根廷共和国庄园
										</a></h3>
										<span class="f_bg"></span>
										<div id="bigPicDetail" class="item_detail_info">
											<div class="close">
												<a href="javascript:void(0)"></a>
											</div>
											<div class="detail_info_left">
												<p class="pic">
													<a target="_blank" href="#">
														<img border="0" alt="揭秘赌王4老婆11千金" src="http://www.xinhuanet.com/titlepic/115068384_title0h.jpg">
													</a>
												</p>
												<p class="name2">
													<a target="_blank" href="#">
														揭秘赌王4老婆11千金
													</a>
												</p>
											</div>
											<div class="detail_info_right">
												<ul>
													<li>
														<a target="_blank" href="#">
															利率正攻坚 汇率待放宽
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															健美锦标赛 女选手前凸后翘秀好身材
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															超萌动物GIF 组图
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															女富二代接班 中国女掌门人比例或将高于美国
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															气温攀升 年轻女孩上演“清凉style”
														</a>
													</li>
												</ul>
											</div>
										</div>
										<a style="display:none" href="javascript:void(0)" class="btn_zk">
											展开
										</a>
									</div>
									<div class="fpic" style="display: none;">
										<a target="_blank" href="#">
											<img width="522" height="270" border="0" alt="习近平参观阿根廷共和国庄园" src="http://www.xinhuanet.com/titlepic/1111703484_title0h.jpg">
										</a>
										<h3>
										<a target="_blank" href="#">
											习近平参观阿根廷共和国庄园
										</a></h3>
										<span class="f_bg"></span>
										<div id="bigPicDetail" class="item_detail_info">
											<div class="close">
												<a href="javascript:void(0)"></a>
											</div>
											<div class="detail_info_left">
												<p class="pic">
													<a target="_blank" href="#">
														<img border="0" alt="揭秘赌王4老婆11千金" src="http://www.xinhuanet.com/titlepic/115068384_title0h.jpg">
													</a>
												</p>
												<p class="name2">
													<a target="_blank" href="#">
														揭秘赌王4老婆11千金
													</a>
												</p>
											</div>
											<div class="detail_info_right">
												<ul>
													<li>
														<a target="_blank" href="#">
															利率正攻坚 汇率待放宽
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															健美锦标赛 女选手前凸后翘秀好身材
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															超萌动物GIF 组图
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															女富二代接班 中国女掌门人比例或将高于美国
														</a>
													</li>
													<li>
														<a target="_blank" href="#">
															气温攀升 年轻女孩上演“清凉style”
														</a>
													</li>
												</ul>
											</div>
										</div>
										<a style="display:none" href="javascript:void(0)" class="btn_zk">
											展开
										</a>
									</div>
								</div>
								
								<ul style="width:120px" class="btPhoto">
									
								</ul>
							</div>
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
					<c:forEach items="${friendlinklist}" var="linklist">
						<li>
						<a href="${linklist.domain }"  target="_blank">			
				        <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ linklist.imageId}"  width="70" />
							</a>
						</li>
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
						<a href="findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }" >
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
							<a href="findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"   >
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
						<a href="findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"  >
							更多&gt;&gt;
						</a></span>
				</div>
				<div class="list_pic fontblue2">				
					<ul>
						<c:forEach items="${contentlist.contentList}" var="newscontentlist">
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
							<a href="findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"   >
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
							<a href="findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"  >
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
							<a href="findBroadcastListByContentTypeId.do?contentTypeId=${contentlist.contentTypeId }"   >
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
						<a target="_blank" href="#">
							图片精选
						</a>
						<a target="_blank" class="more" href="#">
							更多&gt;&gt;
						</a> </span>
				</div>
				<div id="JslidePic" class="tab-wrap photo" style="overflow: hidden;">
					<ul class="pics" style="float: left;">
						<li class="photo-first">
							<a href="#">
						<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					       <c:if test="${newsAdvertisingList.adWeight eq 15 }">
					     <a href="${ newsAdvertisingList.imageLink}"  target="${ newsAdvertisingList.imageTarget}">
					     <img width="330" height="300" style="vertical-align: middle;" src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}" />
					        	<i class="title">${ newsAdvertisingList.adName}</i>
					      </a>
					      </c:if>					    
					      </c:forEach>
							
							</a>
						</li>					
					<c:forEach items="${newsAdvertisingList}" var="newsAdvertisingList">
					<c:if test="${newsAdvertisingList.adWeight gt 7 && newsAdvertisingList.adWeight lt 14  }">
					    <li class="photo_bor">
					    <a href=" ${newsAdvertisingList.imageLink }" target="_blank">
					     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  width="189" />
					     <i class="title">${ newsAdvertisingList.adName}</i>
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
					     <img src="../resClientAttachmentController/clientViewImage.do?attachmentId=${ newsAdvertisingList.imageId}"  />
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
