<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
    <div id="loginHead">
        <!-- <img src="이미지 경로" alt="칰칰폭폭 로고"> -->
        <span id="loginTitle">칰칰폭폭</span>
    </div>

    <form id ="login_form" action="" method="post">    
        <div class="input_row" id="id_line">
            <span class="icon_cell" id="id_cell"></span>
            <input type="text" id="id" name="uid" placeholder="아이디">
        </div>

        <div class="input_row" id="pw_line">
            <span class="icon_cell" id="pw_cell"></span>
            <input type="password" id="pw" name="upass" placeholder="비밀번호">
        </div>

        <div class="login_wrap">
            <button type="submit" class="login_button" id="login_button">
                <span>로그인</span>
            </button>
        </div>
    </form>

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