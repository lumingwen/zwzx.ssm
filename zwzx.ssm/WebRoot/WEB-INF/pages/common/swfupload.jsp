<%@page import="com.shili.lu.common.util.MD5"%>
<%@page import="java.util.UUID"%>
<%
					String swfuploadUser = UUID.randomUUID().toString();
					String swfuploadPass = MD5.getMD5String(swfuploadUser);
%>