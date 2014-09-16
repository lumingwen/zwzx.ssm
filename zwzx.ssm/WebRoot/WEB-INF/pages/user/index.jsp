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
	</head>
	<body>
		<div class="main">
			<div class="top">

			</div>
			<div class="header">
				<div class="logo">
					<img src=""/>
				</div>
				<div class="search">
					<div class="right_top">
						<a href="#">
							首页
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#">
							成都天气：2014-14-14&nbsp;&nbsp;&nbsp;农历5月20&nbsp;&nbsp;&nbsp;
						</a>

						欢迎您来到互帮天下… 今天是2014年07月20日 星期天
					</div>
					<img src=""/>
				</div>
			</div>
			<!--header end-->
			<div class="nav">
			<c:forEach items="${menulist}" var="menulist">
			  <a href="#">
					${menulist.cname }
				</a>
			</c:forEach>
			</div>
			<div class="nav_img">
				<img src="../images/header/img_headcontent.jpg" width="1000"/>
			</div>
			<!---->
     <div class="xx1"  style="width: 68%;float: left;">
   	<c:forEach items="${newscontentList}" var="contentlist">
   	
   	<div style="width:48%;float: left;">
		<div><h4>${contentlist.newsTypeName}</h4></div>
		<div style="float: left;"><img src="<%=path%>/img/index/img_index1.jpg"/></div><div><h5>任正非接受凤凰采访：美国打压的不是华为而是中国</h5></div>
		<div style="clear: both;"></div>
		<div>
			<ul>
			   <c:forEach items="${contentlist.contentList}" var="newscontentlist">
				<li><img src="<%=path%>/img/index/point.jpg"/>${newscontentlist.title }
		        </li>
		        </c:forEach>
			</ul>
		</div>
	</div>
	</c:forEach>
	</div>
			
			
			
			
			
			
			<div class="content">
				<div class="h_part2">
					<div id="fw_cov2" class="h_part2_top">
						<div id="hot_tt" class="img">
							<a target="_blank" href="#">
								习近平参观阿根廷共和国庄园
							</a>

						</div>
						<div id="hot_zy" class="textlink">
							<a target="_blank" href="#">
								习近平同阿根廷总统会谈习近平同阿根廷总统会谈习近平同阿根廷总统会谈习近平同阿根廷总统会谈习近平同阿根廷总统会谈<span>[详细]</span>
							</a>

						</div>
					</div>
					<div id="fwl_cov4" class="h_part2_left">
						<div id="bigpic">
							<div id="focus_pic" class="focusPic">
								<div id="l_btn01" class="l_btn"></div>
								<div id="r_btn01" class="r_btn"></div>
								<div class="bigpic_box">
									<div class="fpic" style="display: block;">
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
								<ul style="width:100px" class="btPhoto">
									<li class="bt02 current"></li>
								</ul>
							</div>
						</div>
					</div>
					<div id="fwl_cov5" class="h_part2_right">
						<!--重要新闻-->
						<ul class="list fontblue">
							<li>
								<span class="fontb  font_title2">
									<a target="_blank" href="#">
										习近平谈互联网治理
									</a>
									<a target="_blank" href="#">
										评:决不该有双重标准
									</a></span>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									李克强重申宏观调控新指南:不搞"大水漫灌"
								</a>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									中组部:防止干部成西方道德价值“应声虫”
								</a>
							</li>
							<li class="fenduan">
								<span class="fontb font_title2">
									<a target="_blank" href="#">
										瞭望:让亿万青年都有人生出彩的机会
									</a></span>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									马航空难:俄反对擅自宣布原因
								</a>
								<a target="_blank" href="#">
									黑匣子在哪
								</a>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									<span class="icon3"></span>
								</a>
								<a target="_blank" href="#">
									遇难者遗体运出
								</a>
								<a target="_blank" href="#">
									本网记者走访坠机现场
								</a>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									95个中央部门单位公车费用未降反增1.3亿
								</a>
							</li>
							<li class="fenduan">
								<span class="fontb font_title2">
									<a target="_blank" href="#">
										天津市政协副主席、公安局长武长顺被调查
									</a></span>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									<span class="icon3"></span>
								</a>
								<a target="_blank" href="#">
									"威马逊"致18人亡
								</a>
								<a target="_blank" href="#">
									一片狼藉
								</a>
								<a target="_blank" href="#">
									鲸被吹上岸
								</a>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									<span class="icon4"></span>
								</a>
								<a target="_blank" href="#">
									沪昆高速事故
								</a>
								<a target="_blank" href="#">
									43亡
								</a>
								<a target="_blank" href="#">
									违规组客
								</a>
								<a target="_blank" href="#">
									1秒变火海
								</a>
							</li>
							<li class="fontblue2">
								<a target="_blank" href="#">
									[思客]
								</a>
								<a target="_blank" href="#">
									金砖银行，一场超越零和的博弈
								</a>
							</li>
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
				<div class="h_title" style="float: none;">
					<span class="fl"><b class="c0486aa">高层声音&nbsp;</b></span><span class="fr">
						<a href="#">
							更多&gt;&gt;
						</a></span>
				</div>
				<div class="tab_box_content" style="display: block;">
					<div style="width:290px;" class="qzlx_pictit">
						<p class="img">
							<a href="#">
								<img width="290" height="134" border="0" alt="" src="http://www.xinhuanet.com/titlepic/119970757_title0h.jpg">
							</a>
						</p>
						<p class="bg"></p>
						<p class="name">
							<a target="_blank" href="#">
								习近平:焦裕禄精神是永恒的
							</a>
						</p>
					</div>
				</div>
				<ul class="left_ul">
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
				</ul>
				<div class="h_title" style="float: none;">
					<span class="fl"><b class="c0486aa">体育&nbsp;</b></span><span class="fr">
						<a href="#">
							更多&gt;&gt;
						</a></span>
				</div>
				<div id="part_pd2_12" class="list_pic left_pic left_pic2">
					<ul>
						<li>
							<p class="img">
								<a href="#">
									<img width="139" height="95" data-original="http://www.xinhuanet.com/titlepic/1111697848_title0h.jpg" src="http://www.xinhuanet.com/titlepic/1111697848_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="bg"></p>
							<p class="name">
								<a href="#">
									赵本山哭求合作
								</a>
							</p>
						</li>
						<li>
							<p class="img">
								<a href="#">
									<img width="139" height="95" data-original="http://www.xinhuanet.com/titlepic/1111697846_title0h.jpg" src="http://www.xinhuanet.com/titlepic/1111697846_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="bg"></p>
							<p class="name">
								<a href="#">
									世界首位女中将图
								</a>
							</p>
						</li>
					</ul>
				</div>
				<ul class="left_ul">
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
				</ul>
				<div class="h_title" style="float: none;">
					<span class="fl"><b class="c0486aa">健康&nbsp;</b></span><span class="fr">
						<a href="#">
							更多&gt;&gt;
						</a></span>
				</div>
				<div id="part_pd2_12" class="list_pic left_pic left_pic2">
					<ul>
						<li>
							<p class="img">
								<a href="#">
									<img width="139" height="95" data-original="http://www.xinhuanet.com/titlepic/1111697848_title0h.jpg" src="http://www.xinhuanet.com/titlepic/1111697848_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="bg"></p>
							<p class="name">
								<a href="#">
									赵本山哭求合作
								</a>
							</p>
						</li>
						<li>
							<p class="img">
								<a href="#">
									<img width="139" height="95" data-original="http://www.xinhuanet.com/titlepic/1111697846_title0h.jpg" src="http://www.xinhuanet.com/titlepic/1111697846_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="bg"></p>
							<p class="name">
								<a href="#">
									世界首位女中将图
								</a>
							</p>
						</li>
					</ul>
				</div>
				<ul class="left_ul">
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
				</ul>
				<div class="h_title" style="float: none;">
					<span class="fl"><b class="c0486aa">时尚&nbsp;</b></span><span class="fr">
						<a href="#">
							更多&gt;&gt;
						</a></span>
				</div>
				<div id="part_pd2_12" class="list_pic left_pic left_pic2">
					<ul>
						<li>
							<p class="img">
								<a href="#">
									<img width="139" height="95" data-original="http://www.xinhuanet.com/titlepic/1111697848_title0h.jpg" src="http://www.xinhuanet.com/titlepic/1111697848_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="bg"></p>
							<p class="name">
								<a href="#">
									赵本山哭求合作
								</a>
							</p>
						</li>
						<li>
							<p class="img">
								<a href="#">
									<img width="139" height="95" data-original="http://www.xinhuanet.com/titlepic/1111697846_title0h.jpg" src="http://www.xinhuanet.com/titlepic/1111697846_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="bg"></p>
							<p class="name">
								<a href="#">
									世界首位女中将图
								</a>
							</p>
						</li>
					</ul>
				</div>
				<ul class="left_ul">
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
					<li>
						<a href="#">
							女大学生街头推销享受“打击” 称为了突破自己
						</a>
					</li>
				</ul>
				<div class="h_title" style="float: none;">
					<span class="fl"><b class="c0486aa">娱乐&nbsp;</b></span><span class="fr">
						<a href="#">
							更多&gt;&gt;
						</a></span>
				</div>
				<div class="list_pic fontblue2">
					<ul>
						<li>
							<p class="img">
								<a href="#">
									<img width="130" height="95"  src="http://www.xinhuanet.com/titlepic/1111705558_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="name">
								<a href="#">
									不败玉女周慧敏旧照曝光
								</a>
							</p>
						</li>
						<li>
							<p class="img">
								<a href="#">
									<img width="130" height="95"  src="http://www.xinhuanet.com/titlepic/1111705558_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="name">
								<a href="#">
									不败玉女周慧敏旧照曝光
								</a>
							</p>
						</li>
						<li><p class="img">
								<a href="#">
									<img width="130" height="95"  src="http://www.xinhuanet.com/titlepic/1111705558_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="name">
								<a href="#">
									不败玉女周慧敏旧照曝光
								</a>
							</p></li>
							<li><p class="img">
								<a href="#">
									<img width="130" height="95"  src="http://www.xinhuanet.com/titlepic/1111705558_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="name">
								<a href="#">
									不败玉女周慧敏旧照曝光
								</a>
							</p></li>
							<li><p class="img">
								<a href="#">
									<img width="130" height="95"  src="http://www.xinhuanet.com/titlepic/1111705558_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="name">
								<a href="#">
									不败玉女周慧敏旧照曝光
								</a>
							</p></li>
							<li><p class="img">
								<a href="#">
									<img width="130" height="95"  src="http://www.xinhuanet.com/titlepic/1111705558_title0h.jpg" class="lazyload" style="display: block;">
								</a>
							</p>
							<p class="name">
								<a href="#">
									不败玉女周慧敏旧照曝光
								</a>
							</p></li>
					</ul>
					<div class=""></div>
				</div>
			</div>
			<div class="box_con">
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">社会&nbsp;</b></span><span class="fr">
							<a href="#">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">博客&nbsp;</b></span><span class="fr">
							<a href="#">
								更多&gt;&gt;
							</a></span>
					</div>
					<ul>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
						<li>
							<a href="#">
								<font><b>[军事]</b>女大学生街头推销享受“打击” 称为了突破自己</font>
							</a>
						</li>
					</ul>
				</div>
				<div class="inlist_02" style="height: auto;">
					<img src="images/index/index_03.jpg" width="323"/>
				</div>
				<div class="inlist_02" style="height: auto;">
					<img src="images/index/index_05.gif" width="323"/>
				</div>

				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">财经&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">教育/科技&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">公益&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">论坛&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02" style="height: auto;">
					<img src="images/index/index_04.jpg" width="323"/>
				</div>
				<div class="inlist_02" style="height: auto;">
					<img src="images/index/index_06.gif" width="323"/>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">汽车&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">旅游&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">读书&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
				<div class="inlist_02">
					<div class="h_title">
						<span class="fl"><b class="c0486aa">家具&nbsp;</b></span><span class="fr">
							<a href="/news/jypx.html">
								更多&gt;&gt;
							</a></span>
					</div>
					<dl>
						<dt class="fl">
							<div>
								<a href="#">
									<img width="95" height="70" src="images/index/index_right2.jpg">
								</a>
							</div>
						</dt>
						<dd class="fr">
							<h4>
							<a href="#">
								女学霸从小独立 为视力残疾父亲带来光明
							</a></h4>
							<p class="c969696">
								周笛在家中做家务，她身后的墙上贴着她小学时候得的奖状…
								<a class="c2f5397" href="#">
									[详细]
								</a>
							</p>
						</dd>
					</dl>
					<ul>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>
						<li>
							<a href="#">
								女大学生街头推销享受“打击” 称为了突破自己
							</a>
						</li>

					</ul>
				</div>
			</div>

		</div>
	</body>
</html>
