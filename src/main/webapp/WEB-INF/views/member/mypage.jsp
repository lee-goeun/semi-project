<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <link rel="stylesheet" href="/resources/css/mypage.css" /> -->

<form id="mypage_form" method="post">

	<div class="all">
		<div>
			<div class="fir_msg">마이 페이지</div>
			<button type="button" class="change_button" id="btn">수정하기</button>
	
		</div>
	
	<div class="middle_type">
		<img src="/resources/image/mypage.png" class="logo" />
	
		<input type="text" id="textbox" class="rightbtn" name="nickname" value="${member.nickname}" readonly="readonly" />
		<input type="text" id="textbox" class="rightbtn" name="address" value="${member.address}" readonly="readonly" />
		<input type="hidden" name=uid value="${member.uid}"/>
		
	</div>
	<input type="text"  class="bottom_text" name="name" placeholder="이름" value="${member.name}">
	<input type="text"  class="bottom_text" name="email" value="${member.email}"  placeholder="이메일">
	</div>


</form>

<script>

var uid = $('.bottom_text').val();

$(document).ready(function(){
		//회원정보 수정 버튼
		$(".change_button").click(function(){
			if(uid==""){
				alert("이름과 이메일을 모두 입력해주세요")
				return false;
			}
			
			alert("수정완료")
			alert("다시 로그인 해주세요.")
			$("#mypage_form").attr("action", "/member/memberUpdate");
			$("#mypage_form").submit();
			
			
		});
	});
</script>
