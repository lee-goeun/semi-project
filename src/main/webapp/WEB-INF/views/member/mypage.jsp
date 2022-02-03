<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/mypage.css" />
</head>


<body>
<form id="mypage_form" method="post">

		<div id="loginHead">
			<div id="logo">
				<img src="/resources/image/logo.png" class="logo" />
			</div>

			<div id="logocon">

				<span id="loginTitle"><br></span>
			</div>
		</div>


		<div>
			<label for="uid">아이디</label>
			<div>
				<input type="text" id="uid" name="uid" value="${member.uid}" readonly="readonly" />
			</div>
		</div>

		<div class="nickname" id="head_text">새 닉네임</div>
		<div class="nick_box">
			<input class="re_nickname_input" id="textbox" name="nickname">
			<span class="nickname_msg1">필수 정보입니다</span>
			<span class="nickname_msg2">사용 가능한 닉네임입니다.</span>
			<span class="nickname_msg3">닉네임이 이미 존재합니다.</span>
		</div>

		<div class="pw_pass" id="head_text">현재 비밀번호</div>
		<div class="pw_input_box">
			<input type="password" class="now_pass_input" id="textbox">
			<span class="now_pass_msg1">필수 정보입니다</span>
			<span class="now_pass_msg2">현재 비밀번호가 올바르지 않습니다.</span>

		</div>

 		<div class="pw_name" id="head_text">새 비밀번호</div>
		<div class="pw_input_box">
			<input type="password" class="re_pw_input" id="textbox">
			<span class="re_pass_msg1">필수 정보입니다.</span>
			<span class="re_pass_msg2">비밀번호 안전도:매우낮음</span>
			<span class="re_pass_msg3">비밀번호 안전도:높음</span>
			<span class="re_pass_msg4">현재 비밀번호와 일치합니다.</span>

		</div> 


		<div class="pw_name" id="head_text">새 비밀번호 확인</div>
		<div class="re_pw_input_box">
			<input type="password" class="re_pw_input_check" id="textbox" name="upass">
			<span class="re_pass_check_msg1">필수 정보입니다.</span>
			<span class="re_pass_check_msg2">비밀번호가 일치하지 않습니다.</span>
			<span class="re_pass_check_msg3">비밀번호가 일치합니다.</span>
		</div>
		<div>
		<button type="button" class="change_button">회원정보수정</button>
		<button type="button" class="delete_button">취소</button>
		</div>

	</form>

<script>

var re_passwd = false;
var now_pass_input = false;
var re_pw_input_check = false;
	
	
//닉네임 중복 check
$('.re_nickname_input').on("propertychange change keyup paste input", function(){
	var nickname = $('.re_nickname_input').val();
	var data = {nickname : nickname}
	$.ajax({
		type: "post",
		url:"/member/memberNickChk",
		data : data,
		success : function(result){
			if(result == 'success'){
				id_info_check=true;
				nickname_check = true;
				$('.nickname_msg1').css('display', 'none');
				$('.nickname_msg2').css("display","inline-block");
				$('.nickname_msg3').css("display", "none");	
							
			}
			if(nickname.length==0){
				$('.nickname_msg1').css('display', 'inline-block');
				$('.nickname_msg2').css("display","none");
				$('.nickname_msg3').css("display", "none");	
			nickname_check = false;
		}
				
			if(result =='fail' ){
				$('.nickname_msg1').css('display', 'none');
				$('.nickname_msg2').css("display","none");
				$('.nickname_msg3').css("display", "inline-block");	
					
			}
	
			
			}//success;
		}); // ajax;
	
	});// function 종료
	


//현재 비밀번호 check
$('.now_pass_input').on("propertychange change keyup paste input", function(){
    var upass = '${member.upass}';
	var now_pass = $('.now_pass_input').val();
	console.log(upass);

	if(now_pass!=upass){
	
		$('.now_pass_msg1').css('display', 'none');
		$('.now_pass_msg2').css("display","inline-block");
		
		now_pass_input = false;
	}
	if(now_pass.length==0){
	
		$('.now_pass_msg2').css('display', 'none');
		$('.now_pass_msg1').css("display","inline-block");
		now_pass_input = false;
		
	}if(now_pass==upass){
		
		$('.now_pass_msg2').css('display', 'none');
		$('.now_pass_msg1').css("display","none");
		now_pass_input = true;
	
	}
	
	
});


//새 비밀번호 check
$('.re_pw_input').on("propertychange change keyup paste input", function(){
	var repass = $('.re_pw_input').val();
	var upass = '${member.upass}';
	console.log(repass.length)
	
	
	
	if(repass.length==0){
		$('.re_pass_msg1').css("display","inline-block");
		$('.re_pass_msg2').css("display","none");
		$('.re_pass_msg3').css("display","none");
		$('.re_pass_msg4').css("display","none");
		re_passwd = false;
		
	}; 
	
	if(0<repass.length<4){
		$('.re_pass_msg1').css("display","none");
		$('.re_pass_msg2').css("display","inline-block");
		$('.re_pass_msg3').css("display","none");
		$('.re_pass_msg4').css("display","none");
		re_passwd = false;
		
	};
	
	if(4<=repass.length){
		$('.re_pass_msg1').css("display","none");
		$('.re_pass_msg2').css("display","none");
		$('.re_pass_msg3').css("display","inline-block");
		$('.re_pass_msg4').css("display","none");
		re_passwd = true;
		
	};
	
	if(upass==repass){
		$('.re_pass_msg1').css("display","none");
		$('.re_pass_msg2').css("display","none");
		$('.re_pass_msg3').css("display","none");
		$('.re_pass_msg4').css("display","inline-block");
		
	};
	
});


 
//새 비밀번호 확인 check
$('.re_pw_input_check').on("propertychange change keyup paste input", function(){
	var repass_check = $('.re_pw_input_check').val();
	var repass = $('.re_pw_input').val();
	
	if(repass_check !=repass){
		$('.re_pass_check_msg1').css("display","none");
		$('.re_pass_check_msg2').css("display","inline-block");
		$('.re_pass_check_msg3').css("display","none");
		re_pw_input_check = false;
		
	}
	if(repass_check==repass){
		$('.re_pass_check_msg1').css("display","none");
		$('.re_pass_check_msg2').css("display","none");
		$('.re_pass_check_msg3').css("display","inline-block");
		re_pw_input_check = true;
	}
	if(repass_check.length==0){
		$('.re_pass_check_msg1').css("display","inline-block");
		$('.re_pass_check_msg2').css("display","none");
		$('.re_pass_check_msg3').css("display","none");
		re_pw_input_check = false;
	}
		 
	});

$(document).ready(function(){
		//회원정보 수정 버튼
		$(".change_button").click(function(){
			
			if(re_passwd&&now_pass_input&&re_pw_input_check){
			$("#mypage_form").attr("action", "/member/memberUpdate");
			$("#mypage_form").submit();
			}
			
		});
	});
	
/* $(document).ready(function(){
		//회원정보 수정 버튼
		$(".delete_button").click(function(){

		});
	}); */



</script>
</body>
</html>