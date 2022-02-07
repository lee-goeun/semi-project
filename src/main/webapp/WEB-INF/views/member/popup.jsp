<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


</head>
<body>
<form id="pass_up_form" method="post">
<div>현재 비밀번호<input type="text" class="pre_pass"/></div>
<div>새 비밀번호<input type="text"/></div>
<div>새 비밀번호 확인<input type="text" name="son_upass" id="son_upass" class="new_pass_input"/></div>
<div><button type="button" onclick="send()">수정완료</button></div>
</form>
</body>

<script>
$('.pre_pass').on("propertychange change keyup paste input", function(){
	var pre_pass_input = $('.pre_pass').val();
	var upass = '${member.upass}';
	if(pre_pass_input==upass){
	console.log("확인")
	}else{console.log("이상감지")
		}	
});


		function send(){
			var parent = window.opener;
			
			var answer = document.getElementById("son_upass").value;
		
			
			parent.document.getElementById('upass').value = answer;
			
			
			console.log("cc")
			
			self.close();
			
			
			
		}

	




</script>

</html>

