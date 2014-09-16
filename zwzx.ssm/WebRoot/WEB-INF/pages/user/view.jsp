<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="content" content="text/html" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../css/staff-show.css"/>
</head>
<body>
<!--显示员工信息开始-->
<div class="content-right-show">
    <h3>查看</h3>
    <div class="content-right-showinfo">
        <p>基本信息</p>
        <ul>
            <li>
                <p><span>用户名：</span><span>${user.name}</span></p>
                <p><span>用户类型：</span><span><c:if test="${user.userType eq 1}">超级管理员</c:if><c:if test="${user.userType eq 2}">普通管理员</c:if></span></p>
                <p><span>创建时间：</span><span><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${user.createTime}"/></span></p>
                <p><span>更新时间：</span><span><fmt:formatDate type="both" dateStyle="medium"  timeStyle="medium" value="${user.updateTime}"/></span></p>
            </li>
           
        </ul>
        
        <div class="content-right-showinfo-sure">
            <button class="button1" onclick="history.back()">返回</button>
        </div>
    </div>
</div>
<!--显示员工信息完-->
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/cancel-sure.js"></script>
</body>
</html>