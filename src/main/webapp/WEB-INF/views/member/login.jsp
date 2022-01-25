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
<form id ="login_form" method="post">
	<span>칙칙폭폭</span>

	<div class="id_input_box">
		<input class="id_input" name="uid">
	</div>

	<div class="pw_input_box">
		<input class="pw_iput" name="upass">
	</div>


	<input type="button" class="login_button" value="로그인">
</form>


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