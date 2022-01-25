<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<script type="text/javascript">

$(document).ready(function(){
	// 취소
	$(".cencle").on("click", function(){
		
		location.href = "/";
				    
	})

 


</script>

<body>
	
	<form action="/member/memberUpdate" method="post">
	<div>
		<span>mypage</span>
		
		</div>
		<div>
			<label for="uid">아이디</label> <input type="text" id="uid" name="uid"
				value="${member.uid}" readonly="readonly" />
		</div>
		
		<div>
		<label for="upass">비밀번호</label> 
		<input type ="text" id="upass" name="upass" />
		
		</div>
		<div>
		<label for="name">성명</label> 
		<input type ="text" id="name" name="name" />
		
		</div>
		<div>
		<label for="email">이메일</label> 
		<input type ="text" id="email" name="email" />
		
		</div>
		
		<div>
		<label for="address">거주지</label> 
		<input type ="text" id="address" name="address" />
		
		</div>
		
		<div>
		<button type="submit" id="submit">회원정보수정</button>
		<button type="button">취소</button>
		</div>
		
		
	</form>