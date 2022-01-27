<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/join.js"></script>
<link rel="stylesheet" href="/resources/css/join.css" />
</head>


<body>
<form id="join_form" method="post">
		<span>회원가입</span>
		
		<div class="nickname">닉네임</div>
		<div class="nick_box">
			<input class="nickname_input" name="nickname">
			<span class="nickname_check">닉네임을 입력해주세요</span>
		</div>

		
		<div class="id_name">아이디</div>
		<div class="id_input_box">
			<input class="id_input" name="uid">
			<span class="name_check">아이디를 입력해주세요</span>
		</div>



		<div class="pw_name">비밀번호</div>
		<div class="pw_input_box">
			<input class="pw_input" name="upass">
			<span class="pass_check">비밀번호를 입력해주세요</span>
		</div>

		<div class="id_name">성명</div>
		<div class="id_input_box">
			<input class="id_input" name="name">
			<span class="name_check">성명을 입력해주세요</span>
		</div>

		<div class="pw_name">이메일</div>
		<div class="pw_input_box">
			<input class="pw_input" name="email">
			<span class="email_check">이메일을 입력해주세요</span>
		</div>
	
<div class="form-group">                   
<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="postCode" id="addr1" type="text" readonly="readonly" >
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
</div>
<div class="form-group">
    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address" id="addr2" type="text" readonly="readonly" />
</div>
<div class="form-group">
    <input class="form-control" placeholder="상세주소" name="addressSpecific" id="addressSpecific" type="text"  />
<span class="address_check">주소를 입력해주세요</span>
</div>
		
	<tr class="mobileNo">
		<th><label for="phone">휴대폰 번호</label></th>
		<td>
			<p>
				<input id="phone" type="text" name="phone" title="전화번호 입력" required />
				<span id="phoneChk" class="doubleChk">인증번호 보내기</span><br/>
				<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
					 <span id="phoneChk2" class="doubleChk">본인인증</span>
					  <span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
					   <input type="hidden" id="phoneDoubleChk" />
			</p>
			<p class="tip">최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)</p>
		</td>
	</tr>
	
			<div class="join_button_wrap">
			<input type="button" class="join_button" value="가입하기">
		</div>

</form>


</body>
</html>