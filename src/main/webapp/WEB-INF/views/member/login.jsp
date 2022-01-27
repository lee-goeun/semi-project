<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/login.css" />
</head>
<body>
<div class="container">

    <div id="loginHead">
    	<div id="logo">
      	 	 <img src="/resources/image/logo.png" class="logo" />
        </div>
        
        <div id="logocon">
        
       		 <span id="loginTitle"><br>칰칰폭폭</span>
        </div>
    </div>

    <form id ="login_form" action="" method="post">    
        <div class="input_row" id="id_line">
            <span class="icon_cell" id="id_cell"></span>
            <input type="text" id="id" name="uid" class="textbox"  placeholder="아이디">
        </div>

        <div class="input_row" id="pw_line">
            <span class="icon_cell" id="pw_cell"></span>
            <input type="password" id="pw" name="upass" class="textbox"  placeholder="비밀번호">
        </div>
        
        
        <c:if test = "${result==0}">
        <div class="logchk">사용자 ID또는 비밀번호를 잘못 입력하셨습니다.</div>
        </c:if>
        

        <div class="login_wrap">
            <button type="submit" class="login_button" id="login_button">
                <span>로그인</span>
            </button>
        </div>
   
    </form>
    </div>
    <script>
        // JS로 login_button 이벤트 정의
        

        // JS로 id_line 값 기재시 clear버튼 활성화

        // JS로 pw_line 값 기재시 clear버튼 활성화
    </script>


<script>
$(document).ready(function(){
	//로그인 버튼
	$(".login_button").click(function(){
		$("#login_form").attr("action", "/member/loginchk");
		$("#login_form").submit();
		console.log("check")
	});
});

</script>
</body>
</html>