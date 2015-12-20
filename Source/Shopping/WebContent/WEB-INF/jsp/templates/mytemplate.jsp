<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${title }</title>
</head>
<body>
<tiles:insertAttribute name="head" ignore="true"></tiles:insertAttribute>

	<a href="${pageContext.request.contextPath}/mytemplate.html">Home</a> | 
	<a href="${pageContext.request.contextPath}/mytemplate/aboutus.html">About us</a> |
	<a href="${pageContext.request.contextPath}/mytemplate/news.html"> News</a>
	<br/>
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	<br/>
	Copyright HL
</body>
</html>