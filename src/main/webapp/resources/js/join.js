function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	                
	                
	                $("[name=postCode]").val(data.zonecode);
	                $("[name=address]").val(fullRoadAddr); 
	            }
	         }).open();
	     }
	     
	     
	     
	     
	     
$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)

			$(".join_button").click(function() {
				
				if (name == "") {
					$('.nickname_check').css('display', 'block');
					nameCheck = false;
				} else {
					$('.nickname_check').css('display', 'none');
					nameCheck = true;
				}
				
				
				
				
				
				
				if(nameCheck){
				$("#join_form").attr("action", "/member/join");
				$("#join_form").submit();
				}
				return false;
			});
		});
		
		var code2 = ""; $("#phoneChk").click(function(){ 
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); 
			var phone = $("#phone").val(); 
			$.ajax({ type:"GET", url:"phoneCheck?phone=" + phone,
					cache : false
					, success:function(data){
						if(data == "error"){
							alert("휴대폰 번호가 올바르지 않습니다.") 
							$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
							$(".successPhoneChk").css("color","red"); 
							$("#phone").attr("autofocus",true); }else{ 
								$("#phone2").attr("disabled",false); 
								$("#phoneChk2").css("display","inline-block"); 
								$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
								$(".successPhoneChk").css("color","green"); 
								$("#phone").attr("readonly",true); 
								code2 = data; 
								} 
						} 
			}); 
});
		//휴대폰 인증번호 대조 
		$("#phoneChk2").click(function(){
			if($("#phone2").val() == code2){
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color","green");
				$("#phoneDoubleChk").val("true"); $("#phone2").attr("disabled",true);
				}else{
					$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
					$(".successPhoneChk").css("color","red"); 
					$("#phoneDoubleChk").val("false"); 
					$(this).attr("autofocus",true); 
					} 
			});
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
