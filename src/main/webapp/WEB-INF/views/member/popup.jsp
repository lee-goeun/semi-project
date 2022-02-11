<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/popup.css" />
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


</head>
<body>
	<form id="pass_up_form" method="post">
		<div class="div1">비밀번호 변경</div>
		<hr>
		<div>현재 비밀번호</div>
		<input type="password" class="pre_pass" id="pass_box" />
		<div class="check">현재 비밀번호 올바르지 않습니다.</div>
		<div class="check_1">&nbsp;</div>
		<div>새 비밀번호 입력</div>
		<input type="password" class="new_pass_box" />
		<div>&nbsp;</div>
		<div>새 비밀번호 확인</div>
		<input type="password" name="son_upass" id="son_upass"  class="son_upass"/>
		<div>&nbsp;</div>
		<div>
		<button type="button"  class="btn" id="close_btn">취소</button>
			<button type="button"  class="btn" id="com_btn">수정완료</button>
			<div>수정하기 버튼을 눌러야 </div>
			
		
		</div>
	</form>
</body>

<script>


$('.pre_pass').on("propertychange change keyup paste input", function(){
	var pre_pass_input = $('.pre_pass').val();
	var upass = '${member.upass}';
	if(pre_pass_input==upass){
		$('.check_1').css("display", "block");
		$('.check').css("display", "none");
		
	}else{
		$('.check_1').css("display", "none");
		$('.check').css("display", "inline-block");
		}	
});

		
		$(document).ready(function() {
			$("#com_btn").click(function() {
				var pass_1 = $('.pre_pass').val();
				var pass_2 = $('.new_pass_box').val();
				var pass_3 = $('.son_upass').val();
				var pre_pass_input = $('.pre_pass').val();
				var upass = '${member.upass}';
				
				if(pass_1==""||pass_2==""||pass_3==""){
					alert("빈칸이 있습니다.")
					return false;
				}
				if(pass_2!=pass_3){
					alert("비밀번호가 일치하지 않습니다.")
					return false;
				}
				if(pre_pass_input!=upass){alert("현재 비밀번호가 올바르지 않습니다.")
					return false;}
				else{
		
				
				var parent = window.opener;
				
				var answer = document.getElementById("son_upass").value;
			
				
				parent.document.getElementById('upass').value = answer;
				
				
				alert("비밀번호 변경완료")
				
				self.close();
				}
			

			
			});
			$("#close_btn").click(function() {
				
				self.close();
	
			});
			
			
		});
</script>

</html>

