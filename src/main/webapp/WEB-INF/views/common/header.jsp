<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
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
		}else if($('title').text() === '회원관리'){
			$('ul').find('li').css({'fontWeight':'400'});
			$('ul').find('li').eq(2).css({
				'fontWeight':'700'
			})
		}
	 	
	 	$('.logout').on('click', function(){
			var logout = confirm('로그아웃하시겠습니까?');
			if(!logout){
				return false;
			}
			$(this).find('a').attr("href", "${contextPath}/member/logout");
		});
	 	
	 	
	});
/* 	
$(document).ready( function() {
		var offset = $('.head').offset();
		$(window).scroll(function(){
			if($(document).scrollTop()>offset.top ){
				console.log("if문 감지")
				 $('.head').addClass('Fixed');
		    }
		    else {
		    	console.log("else 문")
		      $('.head').removeClass('Fixed');
			}

		});
	
}); */

</script>
<div class="head">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div>&nbsp;</div>

 <a class="img_wrap" href="${contextPath}/member/home"><img src="${contextPath}/resources/image/logo.png"/></a>
<nav>
    <ul>
    	<!-- TODO:c:if로 할 수 있는 방법 찾아보기 -->
        <li><a href="${contextPath}/post/list">모집게시판</a></li>
        <li><a href="${contextPath}/review/list">후기게시판</a></li>
        <c:if test="${member.uid=='admin'}">
        	<li><a href="${contextPath}/member/memberview">회원관리</a></li>
        </c:if>
    </ul>
</nav>
<div class="text_wrap">
    <p><span>${member.nickname}</span> 님, 안녕하세요</p>
    <ul>
        <li class="mypage"><a href="${contextPath}/member/mypage"><img src="${contextPath}/resources/image/outline_account_circle_black_24dp.png"/></a></li>
        <li class="logout"><a><img src="${contextPath}/resources/image/outline_logout_black_24dp.png"/></a></li>
    </ul>
</div> 
</div>

<style>
/* .Fixed {
  position: fixed;
   width: 100%;
  
}
 */
.head{
background-color: white;
position: fixed;
z-index:1;
width:100%;
top:0px;
margin-top: 0px;
padding-top: 0px}



*{font-family: 'Noto Sans KR', sans-serif;
}
</style>