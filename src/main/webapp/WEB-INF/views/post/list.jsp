<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<div class="container">

	<div class="contents">

		<!-- 지역 선택 -->
		<div id="addr_area">
			<input name="address" value="${member.region1} ${member.region2}" id="post_addr" type="text" readonly="readonly" />
		</div>

		<div class="top">
			<!-- 타이머 영역 -->
			<div class="time_area">
				<span>00</span> : <span>00</span> : <span>00</span>
			</div>
			<!-- 검색 영역 -->
			<div class="search_area">
				<input type="text" name="keyword" id="title" class="searchInput" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요." onKeyPress="if (event.keyCode==13){searchFunc();}">
				<button class="searchBtn">
					<img src="${contextPath}/resources/image/outline_search_white_24dp.png">
				</button>
				<div class="stt_area">
					<button id="record" class="recordBtn">
						<img src="${contextPath}/resources/image/outline_mic_white_24dp.png" />
					</button>
					<button id="stop" class="stopBtn">
						<img src="${contextPath}/resources/image/outline_stop_white_24dp.png" />
					</button>
				</div>
				<a href="/post/list" class="searchReset" style="display: none">취소</a>
			</div>
		</div>

		<!-- 탭 영역 -->
		<div class="tab">
			<ul>
				<li value="0"><a href="#">전체보기</a></li>
				<li value="1"><a href="#">같이 먹어요</a></li>
				<li value="2"><a href="#">따로 먹어요</a></li>
			</ul>
		</div>

		<!-- 글쓰기 버튼 -->
		<c:if test="${ member != null}">
			<div class="btn_area">
				<a class="goToWrite" href="${contextPath}/post/form">글쓰기</a>
			</div>
		</c:if>

		<!-- 게시물 -->
		<div class="post">
			<!-- 게시물 리스트 -->
			<ul class="item_list slider">
				<c:choose>
					<c:when test="${postsList == null }">
						<li><a href=>등록된 상품이 없습니다.</a></li>
					</c:when>
					<c:otherwise>
						<c:forEach var="post" items="${postsList}" varStatus="postNum">
							<c:if test="${member.region1 == post.region1 and member.region2 == post.region2}">
								<li class="item">
									<a href="${contextPath}/post/viewPost?postId=${post.postId}">
										<c:choose>
											<c:when test="${post.image != ''}">
												<img src="${contextPath}/download.do?postId=${post.postId}&image=${post.image}" />
											</c:when>
											<c:otherwise>
												<c:if test="${post.category == 'pizza'}"><img src="${contextPath}/resources/image/pizza.jpg" /></c:if>
												<c:if test="${post.category == 'chicken'}"><img src="${contextPath}/resources/image/chicken.jpg" /></c:if>
												<c:if test="${post.category == 'hamburger'}"><img src="${contextPath}/resources/image/hamburger.jpg" /></c:if>
											</c:otherwise>
										</c:choose> 
										
										<div class="list_info">
											<p class="title">${post.title}</p>
											<p class="tag_wrap">
												<span class="isTogether">
													<c:if test="${post.isTogether == 0}">#따로</c:if>
													<c:if test="${post.isTogether == 1}">#같이</c:if>
												</span>
												<span class="category">
													<c:if test="${post.category == 'pizza'}">#피자</c:if>
													<c:if test="${post.category == 'chicken'}">#치킨</c:if>
													<c:if test="${post.category == 'hamburger'}">#햄버거</c:if>
												</span>
												<span class="location">#${post.region3}</span>
											</p>
											<p class="recruit_wrap">
												<span class="_deadline" style="display: none">${post.deadline}</span>
												<span class="deadline">
													<i></i><span></span>
												</span>
												<span class="headcount"><i></i>${post.chatNum} / ${post.maxMember}</span>
											</p>
										</div>
										<div class="closed" style="display: none;">
											<p>
												<c:if test="${post.category == 'pizza'}">피자</c:if><c:if test="${post.category == 'chicken'}">치킨</c:if><c:if test="${post.category == 'hamburger'}">햄버거</c:if>행 열차 마감
											</p>
										</div>
									</a>
									<div class="leave_soon" style="display: none;">
										출발<br />임박
									</div>
								</li>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
			<div class="postSearchNone" style="display: none">
				<td>검색 결과가 없어요.</td>
			</div>
			<div class="postNone" style="display: none">
				<td>아직 게시물이 없어요.</td>
			</div>
		</div>
		
		<div class="down">
			<i class="fas fa-angle-double-down"></i>
		</div>

		<form id="listForm" method="get">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			<input type="hidden" name="tab" value="${pageMaker.cri.tab}">
		</form>
	</div>
</div>

<!-- script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//시계
		var timer = setInterval(function(){
		var now = new Date(); 
				  
		var hr = now.getHours();
		var min = now.getMinutes();
		var sec = now.getSeconds();
			  
		  $('.time_area').find('span').eq(0).text(hr);
		  $('.time_area').find('span').eq(1).text(min);
		  $('.time_area').find('span').eq(2).text(sec);
		  
		  if(hr<10){
			  $('.time_area').find('span').eq(0).text("0"+hr);
		  }
		  if(min<10){
			  $('.time_area').find('span').eq(1).text("0"+min);
		  }
		  if(sec<10){
			  $('.time_area').find('span').eq(2).text("0"+sec);
		  }
	   },1000);
	});
	
	//주소검색
	function execPostCode() {
		new daum.Postcode({
			oncomplete: function(data) {
			$("#post_addr").val(data.roadAddress);
			}
		}).open();
	}
	
	//마이크
	const record = document.getElementById("record");
	const stop = document.getElementById("stop");
	const title = document.getElementById("title");
	const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
	const analyser = audioCtx.createAnalyser();
	
	if (navigator.mediaDevices) {
		console.log('getUserMedia supported.')
	
		const constraints = {
			//오디오를 요청한다.
			audio: true
		}
		let chunks = [];
	
		//비동기 처리
	    navigator.mediaDevices.getUserMedia(constraints)
		.then(stream => {
			//스트림 사용
			const mediaRecorder = new MediaRecorder(stream);             
			record.onclick = () => {
				mediaRecorder.start();
				console.log(mediaRecorder.state);
				console.log("recorder started");
				record.style.backgroundColor = "#FF5555";
			}
	
			stop.onclick = () => {
				mediaRecorder.stop();
				console.log(mediaRecorder.state);
				console.log("recorder stopped");
				record.style.backgroundColor = "#e1e1e1";
				title.focus();
			}
	
			mediaRecorder.onstop = e => {
				const blob = new Blob(chunks, {
				'type': 'audio/ogg codecs=opus'
				});
	          		let file = new File([blob], "c:/study/audio.webm");
				console.log(file.name);
	
				//file upload
				let formdata = new FormData();
				formdata.append("fname", "audio.webm");
				formdata.append("data", blob);
				console.log("blob",blob);
					                
	
				let xhr = new XMLHttpRequest();
				xhr.onload = () => {
					if (xhr.status === 200) {// HTTP가 잘 동작되었다는 뜻.
						console.log("response:"+xhr.response);
						title.value=xhr.response;       
					}                 
	             		 }
				console.log('upload');
				xhr.open("POST", "mic", true);
					                
				xhr.send(formdata);
			}
	
			mediaRecorder.ondataavailable = e => {
				chunks.push(e.data)
				console.log(e.data);
			}
		})
	       .catch(err => {
			// 오류 처리
			console.log('The following error occurred: ' + err)
		})
	}
		
	   
	const listForm = $("#listForm");
	 
	/* 검색 기능 */
	$(".search_area .searchBtn").on("click", function(e) {
		e.preventDefault();
		searchFunc();
	});
	  
	function searchFunc() {
		let keyword = $(".search_area input[name='keyword']").val();
		let tab = ${pageMaker.cri.tab };
	
		if (!keyword) {
			location.href = "/post/list";
		}
	
		listForm.find("input[name='keyword']").val(keyword);
		listForm.find("input[name='tab']").val(tab);
		listForm.attr("action", "/post/list");
		listForm.submit();
	}
	 	
	/* 탭 메뉴 */
	$(".tab ul li").click(function (e) {
		e.preventDefault();
	
		let idx = $(this).index();
	      
		listForm.find("input[name='tab']").val(idx);
		listForm.attr("action", "/post/list");
		listForm.submit();
	});
	  
	$(".tab ul li").removeClass("selected");
	$(".tab ul li").eq(${pageMaker.cri.tab }).addClass("selected");
	  
	/* 게시물이 없을 경우 */
	const isPostInfo = document.querySelectorAll('.item');
	let keyword = $(".search_area input[name='keyword']").val();
		
	if (isPostInfo.length <= 0) {
		if (keyword) { // 검색 결과가 없을 경우
			document.querySelector(".postSearchNone").style.display = '';
		} else {
			document.querySelector(".postNone").style.display = '';
		}
	}
	  
	/* 검색하면 취소 버튼 표시 */
	if (keyword) {
		document.querySelector(".searchReset").style.display = '';
	} else {
		document.querySelector(".searchReset").style.display = 'none';
	}
	  
	/* 열차 마감 */
	const orderDate = document.querySelectorAll("._deadline");
	const closed = document.querySelectorAll(".closed");
	const leave_soon = document.querySelectorAll(".leave_soon");
	const today = new Date();
		
	for(let i=0; i<orderDate.length; i++){
		let oDate = new Date(orderDate[i].textContent);
		let dateDiff = oDate.getTime()-today.getTime();
		let diffDay= Math.floor((dateDiff / (1000 * 60 * 60 * 24)));
		let diffHour = Math.floor((dateDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	// 	let diffMin = Math.floor((dateDiff % (1000 * 60 * 60)) / (1000 * 60));
	// 	let diffSec = Math.floor((dateDiff % (1000 * 60)) / 1000);
			
		/* 현재 시간 - 마감 시간 < 1시간 => 마감 임박 */
		if(diffDay == 0 && diffHour == 0) {
			leave_soon[i].style.display= "block";
		}
		/* 현재 시간 < 마감 시간 => 열차 마감 */
		if(oDate < today){
			closed[i].style.display= "block";
		}
	}
	  
	/* 모집시간 포맷 변경 */
	const deadline = document.querySelectorAll("._deadline");
	const deadlineFormat = document.querySelectorAll(".recruit_wrap span.deadline span");
			
	for(let i = 0; i < deadline.length; i++){
		$(function() {
			var time1 = deadline[i].innerText.substr(5, 2);
			var time2 = deadline[i].innerText.substr(8, 2);
			var time3 = deadline[i].innerText.substr(11, 2);
			var time4 = deadline[i].innerText.substr(14, 2);
			$(deadlineFormat).eq(i).text(time1 + "월" + time2 + "일 " + time3 + ":" + time4 + "");
		});
	}
	
</script>