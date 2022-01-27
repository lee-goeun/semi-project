<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<div class="pic_area">
         <p id="preview">
             <img src="${contextPath}/download.do?postId=${post.postId}&image=${post.image}"/>
         </p>
     </div>
     <div class="text_area">
         <div class="person_area">
             <div>
             </div>
             <div>
                 <p class="uid"></p>
                 <p class="addr">유성구 봉명동</p>
             </div>
         </div>
         <div>
             <p class="title">${post.title}</p>
         </div>
         <div>
         	
             <p class="isTogether">같이 먹어요</p>
         </div>
         <div class="gather_area">
             <p class="maxMember">모집인원 : 1 / ${post.maxMember }</p>
             <p class="deadline">모집시간 : ${post.deadline }</p>
         </div>
         <div>
             <span>요금을 확인해주세요</span>
             <div>
                 <p class="grey left">포테킹 후라이드 금액</p>
                 <p class="grey right">${post.price}원</p>
             </div>
             <div>
                 <p class="left">본인 몫(1/4)포테킹 후라이드 금액</p>
                 <p class="right">4,500원</p>
             </div>
             <div>
                 <p class="grey left">배달이용료 금액</p>
                 <p class="grey right">${post.deliveryFee}원</p>
             </div>
             <div>
                 <p class="left">본인 몫(1/4)배달이용료 금액</p>
                 <p class="right">1,000원</p>
             </div>
             
         </div>
         <div class="total_price">
             <p class="left">총 금액</p>
             <p class="right">5,500원</p>
         </div>
         <div class="btn_area">
             <input class="btn" type="submit" value="수정하기"/>
             <input class="btn" type="submit" value="삭제하기"/>
             <input class="btn" type="submit" value="참여하기"/>
         </div>
     </div>
	    <script type="text/javascript">
        $(document).ready(function(){
            $(".text_area").find('.person_area').find('div').eq(0).css({
            	"backgroundImage":"url('${contextPath}/resources/image/baseline_person_black_24dp.png')"
            });
        });
    </script>