<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7524b1e3ab93a0a3e7653e480563c4ce&libraries=services"></script>
	<!-- <script src="/resources/js/join.js"></script> -->
	<link rel="stylesheet" href="/resources/css/join.css" />

	<!-- favicon -->
	<link rel="shortcut icon" href="${contextPath}/resources/image/favicon.ico">
</head>


<body>
	<form id="join_form" method="post">

		<div id="loginHead">
			<div id="logo">
				<img src="/resources/image/logo.png" class="logo" />
			</div>

			<div id="logocon">
				<span id="loginTitle"><br>칰칰폭폭</span>
			</div>
		</div>

		<div class="nickname" id="head_text">닉네임</div>
		<div class="nick_box">
			<!-- <input class="nickname_input" id="textbox" name="nickname" maxlength="10"><button type="button">지우기</button> -->
			<input class="nickname_input" id="textbox" name="nickname" maxlength="10">
			<a class="delete"><button type="button" class="delete_btn"><img src="/resources/image/delete_logo.png" class="delete_logo" /></button></a>
			
			<span class="nickname_check">필수 정보입니다.</span>
			<span class="nick_input_re_1">사용 가능한 닉네임입니다.</span>
			<span class="nick_input_re_2">닉네임이 이미 존재합니다.</span>
			<div>&nbsp;</div>
		</div>

		<div class="id_name" id="head_text">아이디</div>
		<div class="id_input_box">
			<input class="id_input" id="textbox" maxlength="10" name="uid">
			<span class="id_check">필수 정보입니다.</span> <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			<div>&nbsp;</div>
		</div>

		<div class="pw_pass" id="head_text">비밀번호</div>
		<div class="pw_input_box">
			<input type="password" class="pw_fir_input" id="textbox" maxlength="30" name="upass_fir">
			<a class="eye_all"><button type="button" class="eye_btn"><img src="/resources/image/eye.png" class="eye_logo" /></button></a>
			<a class="close_eye_all"><button type="button" class="close_eye_btn"><img src="/resources/image/close_eye.png" class="close_eye_logo" /></button></a>
			<span class="pass_fir_check">필수 정보입니다.</span>
			<span class="fir_pass_check_1">비밀번호 안전도:매우낮음</span>
			<span class="fir_pass_check_2">비밀번호 안전도:높음</span>
			<div>&nbsp;</div>
		</div>

		<div class="pw_name" id="head_text">비밀번호 확인</div>
		<div class="pw_input_box">
			<input type="password" class="pw_input" id="textbox"  maxlength="30"name="upass">
						<a class="re_eye_all"><button type="button" class="re_eye_btn"><img src="/resources/image/eye.png" class="re_eye_logo" /></button></a>
			<a class="re_close_eye_all"><button type="button" class="re_close_eye_btn"><img src="/resources/image/close_eye.png" class="re_close_eye_logo" /></button></a>
			<span class="pass_check">필수 정보입니다.</span>
			<div class="typecheck0">&nbsp;</div>
			<span class="typecheck1">비밀번호가 일치합니다.</span>
			<span class="typecheck2">비밀번호가 일치하지 않습니다.</span>
		</div>

		<div class="id_name" id="head_text">성명</div>
		<div class="id_input_box">
			<input class="name_input" id="textbox" maxlength="5" name="name">
			<span class="name_check">필수 정보입니다.</span>
			<div>&nbsp;</div>
		</div>

		<div class="pw_name" id="head_text">이메일</div>
		<div class="pw_input_box">
			<input class="email_input" id="textbox" name="email" maxlength="30" >
			<span class="email_check">필수 정보입니다.</span>
			<span class="email_type_check">이메일 형식이 올바르지 않습니다.</span>
			<div class="type_check_as">&nbsp;</div>
			<div>&nbsp;</div>
		</div>
		
		<div class="jj"></div>
		<div class="form-group">
			<input class="form-control" placeholder="우편번호" name="postCode" id="addr1" type="text" readonly="readonly">
			<button type="button" class="btn btn-default" onclick="execPostCode();" id="post">
				<i class="fa fa-search"></i> 우편번호 찾기
			</button>
		</div>
		<div class="form-group">
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address" id="addr2"	type="text" readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" placeholder="상세주소" name="addressSpecific" id="addressSpecific" type="text" maxlength="30" />
			<span class="address_check">필수 정보입니다.</span>
			<div>&nbsp;</div>
		</div>

<!-- 		<tr class="mobileNo">
			<th><label for="phone">휴대폰 번호</label></th>
			<td>
				<p>
					<input id="phone" type="text" name="phone" title="전화번호 입력" required />
					<span  id="phoneChk" class="doubleChk">인증번호 보내기</span><br/>
					<input type="button" id="phoneChk" class="doubleChk" value="인증번호 보내기" />
					<br />
					<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required />
					<span id="phoneChk2" class="doubleChk">본인인증</span>
					<input type="button" id="phoneChk2" class="doubleChk" value="본인인증" />
					<br />
					<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주세요</span>
					<input type="hidden" id="phoneDoubleChk" />
				<p>
			</td>
		</tr> -->

		<div class="join_button_wrap">
			<input type="button" class="join_button" value="가입하기">
		</div>
		
		<input name="region1" type="hidden" placeholder="시도"/>
		<input name="region2" type="hidden" placeholder="구"/>
		<input name="region3" type="hidden" placeholder="동"/>
	</form>

	<script>
		var nickname_check = false; //닉네임 
		var id_check = false; // 아이디 

		var pass_check = false; //비번
		var pass_info_check = false //비번확인
		var name_check = false; //이름 확인
		var email_check = false;
		var addressSpecific_check = false; //상세주소  
		var perfect_pass = false; // 비밀번호 일치 확인
		var phone_check = false;

		//id 중복확인 
		$('.id_input').on(
				"propertychange change keyup paste input",
				function() {
					var uid = $('.id_input').val();
					var data = {
						uid : uid
					}
					$.ajax({
						type : "post",
						url : "/member/memberIdChk",
						data : data,
						success : function(result) {
							if (result == 'success') {
							
								id_check = true;
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								$('.id_check').css('display', 'none');

							}
							if (result == 'fail') {
								id_check = false;
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								$('.id_check').css('display', 'none');
							}
							if (uid.length == 0) {
								id_check = false;
								$('.id_input_re_1').css("display", "none");
								$('.id_input_re_2').css("display", "none");
								$('.id_check').css('display', 'inline-block');
							}

						},//success;
						error :function(){
							alert("에러발생")
						}
					}); // ajax;

				});// function 종료

		//닉네임 중복 확인
		$('.nickname_input').on(
				"propertychange change keyup paste input",
				function() {
					var nickname = $('.nickname_input').val();
					var data = {
						nickname : nickname
					}
					$.ajax({
						type : "post",
						url : "/member/memberNickChk",
						data : data,
						success : function(result) {
							if (result == 'success') {
							
								nickname_check = true;
								$('.nickname_check').css('display', 'none');
								$('.nick_input_re_2').css("display", "none");
								$('.nick_input_re_1').css("display",
										"inline-block");

							}
							if (nickname.length == 0) {
								$('.nick_input_re_1').css("display", "none");
								$('.nick_input_re_2').css("display", "none");
								$('.nickname_check').css('display',
										'inline-block');
								nickname_check = false;
							}

							if (result == 'fail') {
								$('.nick_input_re_1').css("display", "none");
								$('.nickname_check').css('display', 'none');
								$('.nick_input_re_2').css("display",
										"inline-block");

							}
							if(nickname!=""){
								$('.delete').css("display", "inline-block");
								
							}
							if(nickname==""){
								$('.delete').css("display", "none");
							}

						}//success;
					}); // ajax;

				});// function 종료

		//비밀번호 길이 확인
		$('.pw_fir_input').on("propertychange change keyup paste input",
				function() {
					var pw_fir_input = $('.pw_fir_input').val();
					console.log(pw_fir_input.length)

					if (pw_fir_input.length == 0) {
						$('.fir_pass_check_1').css("display", "none");
						$('.fir_pass_check_2').css("display", "none");

					}
					;

					if (0 < pw_fir_input.length < 4) {
						$('.fir_pass_check_2').css("display", "none");
						$('.fir_pass_check_1').css("display", "inline-block");

					}
					;

					if (4 <= pw_fir_input.length) {

						$('.fir_pass_check_1').css("display", "none");
						$('.fir_pass_check_2').css("display", "inline-block")
					}
					;
/* 					if(pw_fir_input==""){
						$('.close_eye_all').css("display", "inline-block");
					
					}
					if(pw_fir_input!=""){
						$('.close_eye_all').css("display", "none");
						
					} */

				});

		// 비밀번호 일치 확인
		$('.pw_input').on("propertychange change keyup paste input",
				function() {

					var temp = $('.pw_fir_input').val();

					var use = $('.pw_input').val();

					if (temp != use) {
						console.log("비밀번호가 불일치")
						$('.typecheck0').css("display", "none");
						$('.typecheck1').css("display", "none"); // 일치 none
						$('.typecheck2').css("display", "block"); // 불일치 보여줌
						perfect_pass = false;

					} else {
						console.log("비밀번호 일치")
						$('.typecheck0').css("display", "none");
						$('.typecheck2').css("display", "none"); // 불일치 none
						$('.typecheck1').css("display", "block"); // 일치 보여줌
						perfect_pass = true;

					}

				});

		//이메일 형식 확인
		$('.email_input')
				.on(
						"propertychange change keyup paste input",
						function() {
							var email_input = $('.email_input').val();
							var email_type = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

							if (email_type.test(email_input) == false) {
								$('.id_check').css('display', 'none');
								$('.type_check_as').css('display', 'none');
								$('.email_type_check').css('display', 'block');
								email_check = false;

							}
							if (email_type.test(email_input) == true) {
								$('.email_type_check').css('display', 'none');
								$('.id_check').css('display', 'none');
								$('.type_check_as').css('display', 'block');
								email_check = true;

							}

						});

		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$(".join_button").click(function() {

				var nickname = $('.nickname_input').val();
				var uid = $('.id_input').val();
				var upass = $('.pw_input').val();
				var upass_fir = $('.pw_fir_input').val();
				var name = $('.name_input').val();
				var email = $('.email_input').val();
				var addressSpecific = $('.form-control').val();
				var phone_cheked = $('#phone2').val();

				if (nickname == "") {
					$('.nickname_check').css('display', 'inline-block');
					$('.nick_input_re_2').css("display", "none");
					$('.nick_input_re_1').css("display", "none");

					nickname_check = false;
				}

				if (uid == "") {
					$('.id_check').css('display', 'inline-block');
					$('.id_input_re_1').css("display", "none");
					$('.id_input_re_2').css("display", "none");
					id_check = false;
				}

				if (upass_fir == "") {
					$('.pass_fir_check').css('display', 'inline-block');
					pass_check = false;
				} else {

					$('.pass_fir_check').css('display', 'none');
					pass_check = true;
				}

				if (upass == "") {
					$('.pass_check').css('display', 'inline-block');
					pass_info_check = false;
				} else {

					$('.pass_check').css('display', 'none');
					pass_info_check = true;
				}

				if (name == "") {
					$('.name_check').css('display', 'inline-block');
					name_check = false;
				} else {

					$('.name_check').css('display', 'none');
					name_check = true;
				}

				/* 				if (email =="") {
							$('.email_check').css('display', 'inline-block');
							email_check = false;
						} else {
					
							$('.email_check').css('display', 'none');
							email_check = true;
						} */

				if (addressSpecific == "") {
					$('.address_check').css('display', 'inline-block');
					addressSpecific_check = false;
				} else {

					$('.address_check').css('display', 'none');
					addressSpecific_check = true;
				}

				if (phone_cheked == "") {
					$(".successPhoneChk").css('color', 'red');
					$(".successPhoneChk").text("필수 정보입니다.");

				}

	/* 			if(nickname_check&&id_check&&pass_check&&pass_info_check&&name_check&&email_check&&addressSpecific_check&&perfect_pass&&phone_check&&phone_check){ */
					if(nickname_check&&id_check&&pass_check&&pass_info_check&&name_check&&email_check&&addressSpecific_check&&perfect_pass){
					$("#join_form").attr("action", "/member/join");
					$("#join_form").submit();
				}
				console.log("perfect_pass :" + perfect_pass)
				console.log("nickname_check :" + nickname_check)
				console.log("id_check:" + id_check)
				console.log("pass_check:" + pass_check)
				console.log("pass_info_check:" + pass_info_check)
				console.log("name_check:" + name_check)
				console.log("email_check:" + email_check)
				console.log("addressSpecific_check:" + addressSpecific_check)
				

				return false;
			});
		});

		var code2 = "";
		$("#phoneChk").click(
				function() {
					alert("[칰칰폭폭]\n인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
					var phone = $("#phone").val();
					$.ajax({
						type : "GET",
						url : "phoneCheck?phone=" + phone,
						cache : false,
						success : function(data) {
							if (data == "error") {
								alert("휴대폰 번호가 올바르지 않습니다.")
								$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
								$(".successPhoneChk").css("color", "red");
								$("#phone").attr("autofocus", true);
							} else {
								$("#phone2").attr("disabled", false);
								$("#phoneChk2").css("display", "inline-block");
								$(".successPhoneChk").text(
										"인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
								$(".successPhoneChk").css("color", "red");
								$("#phone").attr("readonly", true);
								code2 = data;
							}
						}
					});
				});
		//휴대폰 인증번호 대조 
		$("#phoneChk2").click(function() {
			if ($("#phone2").val() == code2) {
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color", "green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled", true);
				phone_check = true;
			} else {
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
				$(".successPhoneChk").css("color", "red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus", true);
				phone_check = false;
			}
		});

		/* 도로명 주소 찾기 */
		
		// 주소-좌표 변환 객체 생성
		var geocoder = new daum.maps.services.Geocoder();
		
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);

					$("[name=postCode]").val(data.zonecode);
					$("[name=address]").val(fullRoadAddr);
					
					/* 도로명 주소 => 행정 주소 변환 */
	                var addr = data.address; // 최종 주소 변수
	                geocoder.addressSearch(data.address, function (results, status) {
						// 정상적으로 검색이 완료되면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; // 첫번째 결과의 값을 활용

							var coords = new daum.maps.LatLng(result.y, result.x); // 해당 주소에 대한 좌표

							let lat = result.y;
							let lng = result.x;
							getAddr(lat, lng);
							function getAddr(lat, lng) {
								let geocoder = new kakao.maps.services.Geocoder();

								let coord = new kakao.maps.LatLng(lat, lng);
								let callback = function (result, status) {
									if (status === kakao.maps.services.Status.OK) {
// 										console.log(result[0].address.address_name);
// 										console.log(result[0].address.region_1depth_name);
// 										console.log(result[0].address.region_2depth_name);
// 										console.log(result[0].address.region_3depth_name);
// 										console.log(result[0].address.region_3depth_h_name);
										
										$("[name=region1]").val(result[0].address.region_1depth_name);
										$("[name=region2]").val(result[0].address.region_2depth_name);
										$("[name=region3]").val(result[0].address.region_3depth_name);
									}
								}
								geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
							}
						}
					});
				}
			}).open();
		window.close();}
		
		
		$(document).ready(function() {
		
		
			//닉네임 clear 버튼 
			$(".delete_btn").click(function() {
				$('.nickname_input').val('')
			
			
				});
			});
		// 비밀번호 버튼타입 바꾸는 버튼
		$(document).ready(function() {
			var eye_check = true; //눈감은 상태 type = password 
			
			// 비밀번호 버튼타입 바꾸는 버튼
			$(".close_eye_btn").click(function() {
				if(eye_check==true){
					$('.pw_fir_input').prop("type","text");
					$('.close_eye_all').css("display", "none");
					$('.eye_all').css("display", "inline-block");
					console.log("true 출력")
					return eye_check= false;
					
				}
			});
				
				
			$(".eye_btn").click(function() {
				if(eye_check==false){
					$('.pw_fir_input').prop("type","password");
					$('.eye_all').css("display", "none");
					$('.close_eye_all').css("display", "inline-block");
					console.log("false 출력")
					return eye_check=true;
					
				}
			});
				
			});
		
		// re 비밀번호 버튼타입 바꾸는 버튼
		$(document).ready(function() {
			var re_eye_check = true; //눈감은 상태 type = password 
			
			// 비밀번호 버튼타입 바꾸는 버튼
			$(".re_close_eye_btn").click(function() {
				if(re_eye_check==true){
					$('.pw_input').prop("type","text");
					$('.re_close_eye_all').css("display", "none");
					$('.re_eye_all').css("display", "inline-block");
					console.log("re true 출력")
					return re_eye_check= false;
					
				}
			});
				
				
			$(".re_eye_btn").click(function() {
				if(re_eye_check==false){
					$('.pw_input').prop("type","password");
					$('.re_eye_all').css("display", "none");
					$('.re_close_eye_all').css("display", "inline-block");
					console.log("re false 출력")
					return re_eye_check=true;
					
				}
			});
				
			});
		
		
		

	</script>
</body>
</html>