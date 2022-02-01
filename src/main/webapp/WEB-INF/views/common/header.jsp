<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
	$(document).ready(function(){
	 	if($('title').text().substring(0,2) === '모집'){
			$('ul').find('li').css({'fontWeight':'400'});
			$('ul').find('li').eq(0).css({
				'fontWeight':'700'
			})
		}else if($('title').text().substring(0,2) === '후기'){
			$('ul').find('li').css({'fontWeight':'400'});
			$('ul').find('li').eq(1).css({
				'fontWeight':'700'
			})
		}
	});
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 <a class="img_wrap" href="${contextPath}/post/list"><img src="${contextPath}/resources/image/logo.png"/></a>
<nav>
    <ul>
    	<!-- TODO:c:if로 할 수 있는 방법 찾아보기 -->
        <li><a href="${contextPath}/post/list" >모집게시판</a></li>
        <li><a href="${contextPath}/review/list">후기게시판</a></li>
    </ul>
</nav>
<div class="text_wrap">
    <p><span>동동국수</span> 님, 안녕하세요</p>
    <ul>
        <li><img src="${contextPath}/resources/image/outline_account_circle_black_24dp.png"/></li>
        <li><img src="${contextPath}/resources/image/outline_logout_black_24dp.png"/></li>
    </ul>
</div> 