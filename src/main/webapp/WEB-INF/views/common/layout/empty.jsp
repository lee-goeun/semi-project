<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title" /></title>
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}<tiles:getAsString name = "css"  ignore="true"/>" />
	
	<!-- favicon -->
	<link rel="shortcut icon" href="${contextPath}/resources/image/favicon.ico">
	
	<!-- script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<tiles:insertAttribute name="script" ignore="true" />
</head>

<body>
	<tiles:insertAttribute name="body" ignore="true" />
</body>

</html>
