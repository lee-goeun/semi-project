<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

<div id="btn_out">
    <input type="button" id="btn_exit" value="채팅 나가기"/>
    <input type="hidden" id="myNick" value="${nickname}"/>
    <input type="hidden" id="myId" value="${uid}"/>
</div>
<div id="chat_area">
</div>
<div id="msg_area">
    <input id="msg" type="text" placeholder="메세지를 입력하세요" value=""/>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script type="text/javascript">
	var websocket;
	$(document).ready(function(){
		//웹 소켓 연결
		var url = "ws://118.67.143.112:8080/chatws";
		//var WebSocketServer = require("ws").Server;
	    /* express = require("express"),
	    http = require("http"),
	    app = express(),
	    server = http.createServer(app); */

		/* app.post("/login", login);
		app.get("/...", callSomething); */

		//server.listen(8090);


	 	//websocket = new WebSocketServer({port: 8090}, path: "/chatws");
		websocket = new WebSocketServer("ws://localhost:8090/chatws");
		

		websocket.onopen = onOpen;
		//websocket.onclose = onClose;
		websocket.onmessage = onMessage;
		
		var postId = ${param.postId};
		
		$('#msg').on('keyup', function(e){
			const nick = $('#myNick').val();
			const msg = $('#msg').val();
			
			console.log(nick);
			console.log(msg);
			
			if(e.keyCode == 13){
				//메세지 전송
				websocket.send(JSON.stringify({postId : postId,type:'CHAT', nickname:nick, msg : msg}));
				$('#msg').val("");
			}
		});
		
		//웹 소켓 연결 해제
		$('#btn_exit').on('click', function(){
			if(${member.uid == param.uid}){
				alert('게시글 작성자는 채팅을 나갈 수 없습니다.');
				return false;
			}
			var cnfrm = confirm("채팅을 나가시겠습니까?");
			if(!cnfrm){
				return false;
			}
			
			const nick = $('#myNick').val();
			const uid =$('#myId').val();
			websocket.send(JSON.stringify({postId : postId, type:'LEAVE', nickname:nick}));
			websocket.close();
			
			//form 생성해서 서버 전송
			var form = document.createElement('form');
			form.setAttribute("method", "post");
			form.setAttribute("action", "${contextPath}/chat/exit");
			
			  //postId
			var input1 = document.createElement('input');
			input1.setAttribute("type","hidden");
			input1.setAttribute("name","postId");
			input1.setAttribute("value", postId);
			form.appendChild(input1);
			
			  //uid
			var input2 = document.createElement('input');
			input2.setAttribute("type","hidden");
			input2.setAttribute("name","uid");
			input2.setAttribute("value", uid);
			form.appendChild(input2);
			
			document.body.appendChild(form);
			form.submit();
		});
		
		
	});// end ready();
	
	///////////////////////////////////////////////////
	var nick = document.getElementById('myNick').value;
	var postId = ${param.postId};
	
	//websocket 연결이 되는 경우
	function onOpen(){
		console.log('연결됨');
		websocket.send(JSON.stringify({postId : postId, type:'ENTER', nickname:nick}));
	}
	
	//websocket에 메세지가 왔을 때
	function onMessage(e){
		var data = e.data.substring(1, e.data.length-1);
		console.log(data);
		var dataArr = data.split(":");
		console.log("dataArr" , dataArr);
		if(dataArr[0] == '${nickname}'){
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
		//websocket.send(JSON.stringify({postId : postId,type:'LEAVE',uid:nick}));
		$('#chat_area').remove();
	}
	
	//브라우저 창 종료
	/* $(window).on('close', function(){
		websocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
		websocket.close();
	}); */
</script>