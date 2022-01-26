<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 <a class="img_wrap" href="${contextPath}/home"><img src="${contextPath}/resources/image/logo.png"/></a>
<nav>
    <ul>
        <li><a href="#none">모집게시판</a></li>
        <li><a href="#none">후기게시판</a></li>
    </ul>
</nav>
<div class="text_wrap">
    <p><span>동동국수</span> 님, 안녕하세요</p>
    <ul>
        <li><img src="${contextPath}/resources/image/outline_question_answer_black_24dp.png"/></li>
        <li><img src="${contextPath}/resources/image/baseline_notifications_none_black_24dp.png"/></li>
    </ul>
</div> 