<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("UTF-8");
%>
	<div class="top">
      <div class="time_area">
      		<span>00</span> : <span>00</span> : <span>00</span>
      </div>
      <div class="search_area">
     	<form action="${contextPath}/post/list" method="get">
     		<fieldset>
             <div>
                 <input name="title" id="title" type="text" placeholder="상품명을 입력하세요."/>
                 <input type="hidden" name="category" id="category"/>
             </div>
             <div class="search_btn">
                 <button id="search_btn"></button>
             </div>
         </fieldset>
     	</form>
      </div>
      <div class="stt_area">	
      		<button id="record"></button>
      		<button id="stop"></button>
      </div>
  </div>
  <div class="tab">
      <ul>
          <li <c:if test="${param.isTogether == null}">class="selected"</c:if>><a href="${contextPath}/post/list">전체보기</a></li>
          <li <c:if test="${param.isTogether == 1}">class="selected"</c:if>><a href="${contextPath}/post/list?isTogether=1">같이 먹어요</a></li>
          <li <c:if test="${param.isTogether == 0}">class="selected"</c:if>><a href="${contextPath}/post/list?isTogether=0">따로 먹어요</a></li>
      </ul>
  </div>
  <div class="content">
      <div class="btn_area">
          <a class="goToWrite" href="${contextPath}/post/form">글쓰기</a>
      </div>
      <ul class="item_list">
          <c:choose>
              <c:when test="${postsList == null }">
              <li>
                  <a href=>등록된 상품이 없습니다.</a>
              </li>
              </c:when>
              <c:otherwise>
                  <c:forEach var="post" items="${postsList}" varStatus="postNum">
                   <li>
               		<a href="${contextPath}/post/viewPost?postId=${post.postId}">
               			<div class="item_img"><img src="${contextPath}/download.do?postId=${post.postId}&image=${post.image}"/></div> 
              				<div>
                				<p class="name">${post.title}</p>
                  				<p class="location"><span>유성구 봉명동</span></p>
                 				<p class="maxMember"><span>1/${post.maxMember }</span></p>
                  				<p class="deadline">마감시간 : <span><fmt:formatDate value="${post.deadline}" pattern="hh:mm"/></span></p>
                			</div>
               		</a>
               	</li>
                  </c:forEach>
              </c:otherwise>
          </c:choose>
      </ul>
  </div>
<script type="text/javascript">
	//마이크
	const record = document.getElementById("record");
	const stop = document.getElementById("stop");
	const title = document.getElementById("title");
	const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
	const analyser = audioCtx.createAnalyser();
	
	if(navigator.mediaDevices){
		console.log("getUseMedia supported");
		
		const constraints = {
			audio:true
		}
		let chunks = [];
		
		navigator.mediaDevices.getUserMedia(constraints) //promise
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
					record.style.backgroundColor = "#E1E1E1";
				}
				
				mediaRecorder.onstop = e => {
					const blob = new Blob(chunks, {
						'type' : 'audio/ogg codecs=opus'
					});
					
					//file upload
					let formdata = new FormData();
					formdata.append("fname", "audio.webm");
					formdata.append("data", blob);
					
					let xhr = new XMLHttpRequest();
					xhr.onload = () => {
						if(xhr.status === 200){
							console.log("response : " + xhr.response);
							title.value = xhr.response;
						}
					}
					console.log('upload');
					xhr.open("POST", "mic", true);
					xhr.send(formdata);
				}
				
				mediaRecorder.ondataavailable = e => {
					chunks.push(e.data)
				}
			})
			.catch(err => {
				console.log("The following error occurred: " + err)
			})
	}
	
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
	   
	   //전송
	   $('form').submit(function(){
		   var title = $('#title').val();
		   $('#category').val(title);
	   });
	   
       //css
       $(".search_area").find('.search_btn').find('button').css({
       	"backgroundImage":"url('${contextPath}/resources/image/outline_search_white_24dp.png')"
       });
       
       $("#record").css({
       	"backgroundImage":"url('${contextPath}/resources/image/outline_mic_white_24dp.png')"
       });
       
       $("#stop").css({
       	"backgroundImage":"url('${contextPath}/resources/image/outline_stop_white_24dp.png')"
       });

   });
</script>