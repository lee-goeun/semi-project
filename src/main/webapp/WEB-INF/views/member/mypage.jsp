<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7524b1e3ab93a0a3e7653e480563c4ce&libraries=services"></script>

<!-- <link rel="stylesheet" href="/resources/css/mypage.css" /> -->

<form id="mypage_form" method="post">

	<div class="all">
		<div>
			<div class="fir_msg">마이 페이지</div>
			</div>
			<div class="div_1">
		
			<button type="button" class="pass_btn"  onclick="popup()">비밀번호 변경</button>
			<button type="button" class="change_button" id="btn">수정하기</button>
		
			
			</div>
					

	<div class="middle_type">
		<img src="/resources/image/mypage.png" class="logo" />
		
	<input type="text" id="textbox"   class="rightbtn" name="nickname" value="${member.nickname}" disabled />
	<input type="text" id="textbox" class="rightbtn" name="name" value="${member.name}" disabled />
				
	</div>
	<input type="text"  class="bottom_text" name="email" value="${member.email}"  placeholder="이메일">
	
	
	<div class="form-group">
			<input class="form-control_1" placeholder="${member.postCode}" name="postCode" id="addr1" type="text" readonly="readonly"
			value="${member.postCode}">
			<button type="button" class="btn btn-default" onclick="execPostCode();" id="post">
				<i class="fa fa-search"></i> 우편번호 찾기</button>
		</div>
		<div class="form-group">
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address" id="addr2"	type="text" readonly="readonly" value="${member.address}"/>
		</div>
		<div class="form-group">
			<input class="form-control" placeholder="상세주소" name="addressSpecific" id="addressSpecific" type="text" maxlength="30" value="${member.addressSpecific}"/>
		</div>
	</div>

	<div>
	<input type="hidden" name="upass" id="upass"  value="${member.upass}"/>
	<input type="hidden"  name="uid" value="${member.uid}" />
	<input type="hidden" name="region1"  value="${member.region1}" placeholder="시도"/>
		<input type="hidden" name="region2" value="${member.region2}" placeholder="구"/>
		<input type="hidden" name="region3" value="${member.region3}" placeholder="동"/>
	</div>


</form>

<script>

var name_email = $('.bottom_text').val();
var temp = $("#upass").val();


$(document).ready(function(){
		//회원정보 수정 버튼
		$(".change_button").click(function(){
		
			
	if(name_email==""){
				console.log(name_email)
				alert("이름과 이메일을 모두 입력해주세요")
				return false;
			}
			
			alert("수정완료")
			alert("다시 로그인 해주세요.")
			$("#mypage_form").attr("action", "/member/memberUpdate");
			$("#mypage_form").submit();
			
			
		});
});
		
	function popup(){
		var url ="popup";
		window.open(url,"","width=400,height=400");
	}
	
	
	
	
	
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
//										console.log(result[0].address.address_name);
//										console.log(result[0].address.region_1depth_name);
//										console.log(result[0].address.region_2depth_name);
//										console.log(result[0].address.region_3depth_name);
//										console.log(result[0].address.region_3depth_h_name);
									
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
	}
	
	
	
	
	
	
</script>
