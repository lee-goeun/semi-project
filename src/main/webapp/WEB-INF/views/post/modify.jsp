<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<div class="page_name">모집게시판 수정하기</div>
<form action="${contextPath}/post/modify" method="post" enctype="multipart/form-data">
	<fieldset>
		<legend>상품수정</legend>
		<div class="submit_btn">
			<button id="btn">완료</button>
		</div>
		<div class="pic_area">
			<label class="image" for="image">사진</label>
			<input type="file" name="image" id="image" onchange="readURL(this);" value="${post.image}" />
			<input type="hidden" />
			<input type="hidden" name="postId" value="${param.postId }" />
			<p>
				<c:choose>
					<c:when test="${post.image != ''}">
						<img id="preview" src="${contextPath}/download.do?postId=${post.postId}&image=${post.image}" />
					</c:when>
					<c:otherwise>
						<c:if test="${post.category == 'pizza'}"><img id="preview" src="${contextPath}/resources/image/pizza.jpg" /></c:if>
						<c:if test="${post.category == 'chicken'}"><img id="preview" src="${contextPath}/resources/image/chicken.jpg" /></c:if>
						<c:if test="${post.category == 'hamburger'}"><img id="preview" src="${contextPath}/resources/image/hamburger.jpg" /></c:if>
					</c:otherwise>
				</c:choose> 
			</p>
		</div>
		<div class="text_area">
			<div>
				<label class="category" for="category">카테고리</label> <select name="category" id="category">
					<option value="all">카테고리</option>
					<option value="pizza" <c:if test="${post.category eq 'pizza'}">selected="selected"</c:if>>피자</option>
					<option value="chicken" <c:if test="${post.category eq 'chicken'}">selected="selected"</c:if>>치킨</option>
					<option value="hamburger"
						<c:if test="${post.category eq 'hamburger'}">selected="selected"</c:if>>햄버거</option>
				</select>
			</div>
			<div>
				<input type="radio" name="isTogether" value="1" <c:if test="${post.isTogether == '1' }">checked</c:if> />
				<label>같이 먹어요</label>
				<input type="radio" name="isTogether" value="0" <c:if test="${post.isTogether == '0' }">checked</c:if> />
				<label>따로 먹어요</label>
			</div>
			<div>
				<label class="title" for="title">제목</label>
				<input type="text" name="title" id="title" placeholder="제목" value="${post.title}" />
			</div>
			<div>
				<label class="maxMember" for="maxMember">모집인원</label>
				<input type="number" name="maxMember" id="maxMember" placeholder="모집인원"
					value="${post.maxMember}"  min="0"/>
			</div>
			<div>
				<label for="deadline">모집시간</label>
				<input type="hidden" name="deadline" id="deadlineF" value="${post.deadline}" readonly>
				<input type="text" id="deadline" class="deadline" value="${post.deadline}" placeholder="마감시간" readonly>
			</div>
				<div class="isChecked">
					<label class="content" for="content">음식명</label>
					<input type="text" name="content" id="content" placeholder="음식명" value="${post.content }" />
				</div>
				<div class="isChecked">
					<label class="price" for="price">음식금액</label>
					<input type="number" name="price" id="price" placeholder="음식금액" value="${post.price }"  min="0"/>
				</div>
			<div>
				<label class="deliveryFee" for="deliveryFee">배달료</label>
				<input type="number" name="deliveryFee" id="deliveryFee" placeholder="배달료"
					value="${post.deliveryFee }" min="0" />
			</div>
<%-- 			<input type="hidden" name="uid" value="${member.uid}" placeholder="작성자" readonly> --%>
		</div>
	</fieldset>
</form>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${contextPath}/resources/js/post/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	//var timeSet = ${post.deadline};
	//alert(timeSet);
	$('form').submit(function() {
		//유효성 체크
		if ($('#category').val() == 'all') {
			alert('카테고리 선택은 필수입니다.');
			return false;
		}
		if ($('#title').val() == '') {
			alert('제목 입력은 필수입니다.');
			return false;
		}
		if ($('#maxMember').val() == '') {
			alert('모집인원 입력은 필수입니다.');
			return false;
		}
		if ($('#deadline').val() == '') {
			alert('모집시간 입력은 필수입니다.');
			return false;
		}
		if ($("input[type='radio']").val() == '0') {
			if ($('#content').val() == '') {
				alert('음식명 입력은 필수입니다.');
				return false;
			}
			if ($('#price').val() == '') {
				alert('음식금액 입력은 필수입니다.');
				return false;
			}
		}
		if ($('#deliveryFee').val() == '') {
			alert('배달료 입력은 필수입니다.');
			return false;
		}
		
		// 마감시간 - 현재 이후로 선택
		var now = new Date();
		var dDate = new Date($('#deadlineF').val());
		if(dDate.getTime() < now.getTime()) {
			alert("마감시간을 다시 선택하세요.");
			$('#deadlineF').val('');
			$('#deadline').val('');
			return false;
		}

		//deadline 날짜 + 시간 형식으로 보내기 
		var curDate = new Date();
		var nowDate = curDate.getFullYear() + "-"
				+ curDate.getMonth() + 1 + "-"
				+ curDate.getDate();

		var time = $('#time').val();
		var fullDate = nowDate + " " + time;
		$('#deadline').val(fullDate);
	});

		$("form").find(".pic_area").find("#preview").css({
			"backgroundImage" : "url('${contextPath}/resources/image/outline_photo_camera_black_24dp.png')"
		});
		
		
		if($("input[type='radio']:checked").val() == '0'){
			$('.isChecked').css({
				"display" : "none"
			});
		}else{
			$('.isChecked').css({
				"display" : "block"
			});
		}
		
		//같이먹어요, 따로 먹어요 체인지
		$("input[type='radio']").on('change', function() {
			if ($(this).val() == '0') {
				$('.isChecked').css({
					"display" : "none"
				});
			} else {
				$('.isChecked').css({
					"display" : "block"
				});
			}
		});
	});

	//이미지 보여주기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	/* 날짜 선택 */
	$("#deadline").datetimepicker(
			{
				dateFormat : 'yy년 mm월 dd일',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년',
				minDate : "0D",
				maxDate : "+2D",

				// timeFormat: 'HH:mm:ss',
				timeFormat : 'HH시 mm분',
				stepMinute: 5,
				showSecond : false,
				controlType : 'select',
				oneLine : true,
			});
	
	/* 모집시간 포맷 변경 */
	const deadline = document.getElementById("deadline");
	const deadlineFormat = document.getElementById("deadlineF");
	
	let time1 = deadline.value.substr(0, 4);
	let time2 = deadline.value.substr(5, 2);
	let time3 = deadline.value.substr(8, 2);
	let time4 = deadline.value.substr(11, 2);
	let time5 = deadline.value.substr(14, 2);
	
	deadline.value = time1 + "년 " + time2 + "월 " + time3 + "일 " + time4 + "시 " + time5 + "분";
	
	$(function() {
		$(deadline).change(
				function() {
					time1 = deadline.value.substr(0, 4);
					time2 = deadline.value.substr(6, 2);
					time3 = deadline.value.substr(10, 2);
					time4 = deadline.value.substr(14, 2);
					time5 = deadline.value.substr(18, 2);
					
					deadlineFormat.value = time1 + "-" + time2 + "-" + time3 + " " + time4 + ":" + time5 + ":00";
				})
	});
	
</script>