<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 <a class="img_wrap" href="${contextPath}/post/list"><img src="${contextPath}/resources/image/logo.png"/></a>
<nav>
    <ul>
        <li><a href="${contextPath}/post/list" <c:if test=""></c:if>>모집게시판</a></li>
        <li><a href="${contextPath}/review/list" <c:if test=""></c:if>>후기게시판</a></li>
    </ul>
</nav>
<div class="text_wrap">
    <p><span>동동국수</span> 님, 안녕하세요</p>
    <ul>
        <li><img src="${contextPath}/resources/image/outline_account_circle_black_24dp.png"/></li>
        <li><img src="${contextPath}/resources/image/outline_logout_black_24dp.png"/></li>
    </ul>
</div> 