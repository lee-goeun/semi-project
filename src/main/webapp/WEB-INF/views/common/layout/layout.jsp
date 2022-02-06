<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title" /></title>
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}<tiles:getAsString name = "css"  ignore="true"/>" />
	
	<!-- favicon -->
	<link rel="shortcut icon" href="${contextPath}/resources/image/favicon.ico">
	
	<!-- font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
		rel="stylesheet">
	
	<!-- script -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<tiles:insertAttribute name="script" ignore="true" />
</head>
	
<body>
	<div class="wrap">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<section>
			<tiles:insertAttribute name="body" />
		</section>
	</div>
</body>
</html>
