<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

<div id="btn_out">
    <input type="button" id="btn_exit" value="채팅 나가기"/>
    <input type="hidden" id="myId" value="${uid}"/>
</div>
<div id="chat_area">
    <%-- <div class="other_user">
        <div><img src="../img/baseline_person_black_24dp.png"/></div>
        <div>
            <p class="user_id">엽떡조아</p>
            <p class="text">안녕하세요.</p>
        </div>
    </div>
    <div class="me">
    	<input class="myId" type="hidden" value="${uid}"/>
        <p class="text">안녕하세요</p>
    </div> --%>
</div>
<div id="msg_area">
    <input id="msg" type="text" placeholder="메세지를 입력하세요" value=""/>
</div>
<script type="text/javascript">
	var websocket;
	
	$(document).ready(function(){
		//웹 소켓 연결
		websocket = new WebSocket("ws://localhost:8090/post/chatws");

		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
		
		
		$('#msg').on('keyup', function(e){
			if(e.keyCode == 13){
				const nick = $('#myId').val();
				const msg = $('#msg').val();
				
				//메세지 전송
				websocket.send(nick+":"+msg);
				
				$('#msg').val("");
			}
		});
		
		//웹 소켓 연결 해제
		$('#btn_exit').on('click', function(){
			websocket.close();
		});
		
		
	});// end ready();
	
	///////////////////////////////////////////////////
	//websocket 연결이 되는 경우
	function onOpen(){
	}
	
	//websocket에 메세지가 왔을 때
	function onMessage(e){
		var data = e.data;
		var dataArr = data.split(":");
		console.log("dataArr" , dataArr);
		if(dataArr[0] == '${uid}'){
			$('#chat_area').append(
				'<div class="me">'+
			       ' <p class="text">' + dataArr[1] + '</p>'+
			    '</div>'
			);
		}else{
			$('#chat_area').append(
					'<div class="other_user">' + 
			        '<div><img src="${contextPath}/resources/image/baseline_person_black_24dp.png"/></div>' + 
			        '<div>' + 
			            '<p class="user_id">' + dataArr[0] + '</p>' + 
			            '<p class="text">' + dataArr[1] + '</p>' + 
			        '</div>'+
			    '</div>'
			 );
		}
	}
	
	//webSocket이 연결이 해제되는 경우
	function onClose(e){
		console.log("웹 소켓 종료");
		$('#chat_area').remove();
	}
	
	//브라우저 창 종료
	$(window).on('close', function(){
		websocket.close();
	});
</script>