<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<div class="pic_area">
         <p id="preview">
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
         </p>
     </div>
     <div class="text_area">
         <div class="person_area">
             <div>
             </div>
             <div>
                 <p class="uid">
                 	 ${post.nickname}
                 </p>
                 <p class="addr">${post.region2} ${post.region3}</p>
             </div>
         </div>
         <div>
             <p class="title">${post.title}</p>
         </div>
         <div>
             <p class="isTogether">
              	<c:if test="${post.isTogether == '1'}">
             		같이 먹어요
             	</c:if>
				<c:if test="${post.isTogether == '0'}">
					따로 먹어요
				</c:if> 
             </p>
         </div>
         <div class="gather_area">
             <p class="maxMember">모집인원 : ${post.chatNum} / ${post.maxMember }</p>
             <p class="deadline">모집시간 : <span>${post.deadline}</span></p>
         </div>
         <div class="fee">
             <span>요금을 확인해주세요</span>
             <c:if test="${post.isTogether == '1'}">
	             <div>
	                 <p class="grey left">${post.content} 금액</p>
	                 <p class="grey right"><fmt:formatNumber value="${post.price }" type="number"/>원</p>
	             </div>
	             <div>
	                 <p class="left">본인 몫(1/${post.maxMember}) ${post.content} 금액</p>
	                 <p class="right"><span class="myprice"></span>원</p>
	             </div>
             </c:if>
             <div>
                 <p class="grey left">배달이용료 금액</p>
                 <p class="grey right"><fmt:formatNumber value="${post.deliveryFee }" type="number"/>원</p>
             </div>
             <div>
                 <p class="left">본인 몫(1/${post.maxMember}) 배달이용료 금액</p>
                 <p class="right"><span class="mydeliveryFee"></span>원</p>
             </div>
             
         </div>
         <div class="total_price">
             <p class="left">총 금액</p>
             <p class="right"><span class="total"></span>원</p>
         </div>
         <div class="btn_area">
         	<a id="btn_join" href="#none">참여하기</a>
         <c:if test="${member.uid == post.uid && post.chatNum <= 1}">
         	<a id="btn_delete" onclick="deletePost('${contextPath}/post/removePost', ${param.postId})">삭제하기</a>
         	<a id="btn_modify" href="${contextPath}/post/viewPost1?postId=${param.postId}">수정하기</a>
         </c:if>
         	 
         </div>
     </div>
	    <script type="text/javascript">
	    
	    //포스트삭제 post형식으로 보내기 
	    //	(TODO : jqury형식이나 html에서 해결하는 방법 알아보기)
	    function deletePost(url, postId){
    		const oDate = new Date('${post.deadline}');
    		const today = new Date();
    		
   			/* 현재 시간 < 마감 시간 => 삭제 불가*/
   			if(oDate < today){
   				alert('마감된 게시글은 삭제할 수 없습니다.');
   				return false;
   			}
   			
	    	var cnfrm = confirm("정말 삭제하시겠습니까?");
	    	if(!cnfrm){
	    		return false;
	    	}
	    	
	    	var form = document.createElement("form");
	    	form.setAttribute("method", "post");
	    	form.setAttribute("action", url);
	    	var postIdInput = document.createElement("input");
	    	postIdInput.setAttribute("type","hidden");
	    	postIdInput.setAttribute("name","postId");
	    	postIdInput.setAttribute("value",postId);
	    	
	    	form.appendChild(postIdInput);
	    	document.body.appendChild(form);
	    	form.submit();
	    }
	    
	  	//천단위 콤마
	    function addComma(value){
	    	 return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    }
	    
        $(document).ready(function(){
        	
        	//음식값, 배달료, 총금액 계산하기
        	var maxMember = parseInt(${post.maxMember});
        	var price = parseInt(${post.price});
        	var deliveryFee = parseInt(${post.deliveryFee});
        	
        	var myprice = parseInt(price/maxMember);
        	var mydeliveryFee = parseInt(deliveryFee/maxMember);
        	
        	$('.myprice').text(addComma(myprice));
        	$('.mydeliveryFee').text(addComma(deliveryFee/maxMember));
        	
        	
        	$('.total').text(addComma(myprice + mydeliveryFee));
        	
        	//채팅
        	var websocket;
        	$('#btn_join').click(function(){
        		if(${post.chatNum} >= ${post.maxMember}){
        			alert('모집인원이 초과되었습니다.');
       				return false;
        		}
        		const oDate = new Date('${post.deadline}');
        		const today = new Date();
        		
       			/* 현재 시간 < 마감 시간 =>  채팅 참여 불가 */
       			if(oDate < today){
       				alert('마감된 게시글은 참여할 수 없습니다.');
       				return false;
       			}
        		
        		var xPos = (document.body.offsetWidth) - 430;
        		window.open("${contextPath}/chat/room?postId="+${post.postId}+"&uid="+'${post.uid}',"_blank","width=430,height=700, left=" + xPos +", top=10");
            });
        	
        	// 마감된 게시글 수정 불가
        	$('#btn_modify').on('click', function(){
        		var text = $(this).text().substring(0,2);
        		const oDate = new Date('${post.deadline}');
        		const today = new Date();
        		
       			/* 현재 시간 < 마감 시간 => 수정 불가 */
       			if(oDate < today){
       				alert('마감된 게시글은 수정할 수 없습니다.');
       				return false;
       			}
        	});
        	
            $(".text_area").find('.person_area').find('div').eq(0).css({
            	"backgroundImage":"url('${contextPath}/resources/image/baseline_person_black_24dp.png')"
            });
        });
        
        /* 모집시간 포맷 변경 */
    	const deadline = document.querySelector(".gather_area .deadline span");
    	let time2 = deadline.innerText.substr(5, 2);
    	let time3 = deadline.innerText.substr(8, 2);
    	let time4 = deadline.innerText.substr(11, 2);
    	let time5 = deadline.innerText.substr(14, 2);
    	deadline.innerText = time2 + "월 " + time3 + "일 " + time4 + ":" + time5;
    </script>