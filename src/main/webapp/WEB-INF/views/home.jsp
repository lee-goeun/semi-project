
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="ko">
  <head>
       
    <meta charset="utf-8">
    <title>Script</title>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      $( document ).ready( function() {
        AOS.init();
      } );
      
  $(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});
  
  
  
 
  $( '.top_btn' ).click( function() {
	 
		$( 'html, body' ).animate( { scrollTop : 0 }, 10000 );
		 console.log("click")
		return false;
	} );  
  
   
    </script>
  </head>
  <body>
  
<div class="quickmenu">
<a><img class="bar" src="${contextPath}/resources/image/quickMenuBar.png"/></a>
<a  href="/member/info"><img class="bar" src="${contextPath}/resources/image/bar_2.png"/></a>
<a href="/member/customer" class="top_btn"><img class="bar" src="${contextPath}/resources/image/bar_3.png"/></a>
<a href="#" class="top_btn"><img class="bar" src="${contextPath}/resources/image/bar_4.png"/></a>
</div>
  
  
    <div class="div1">
    <div data-aos="fade-up" data-aos="fade-left" data-aos-duration="2000">
        <div>
            <img src="${contextPath}/resources/image/peopleIcon.png"/>
        </div>
        <div>
            <p class="img_area">
                <img src="${contextPath}/resources/image/deliveryIcon1.png"/>
                <img src="${contextPath}/resources/image/deliveryIcon2.png"/>
                <img src="${contextPath}/resources/image/deliveryIcon3.png"/>
                <img src="${contextPath}/resources/image/deliveryIcon4.png"/>
            </p>
            <p class="text_area">
                커피 한 잔 가격으로<br/> 식사도 해결하기
            </p>
            <span>
                매번 나가는 배달이용료가 부담스럽다면?
            </span>
           	<a href="<c:if test="${member.nickname eq null}">${contextPath}/main</c:if><c:if test="${member.nickname ne null}">${contextPath}/post/list</c:if>">
                서비스 시작하기
            </a>
        </div>
    </div>
</div>
<div class="div2">
    <div data-aos="fade-right" data-aos="fade-left"  data-aos-duration="2000">
        <p>
            칰칰폭폭에서는<br/>
            4000원 배달료가 4명이서 1000원씩!
        </p>
        <img src="${contextPath}/resources/image/lowerPrice.png"/>
    </div>
    
</div>
<div class="div3" data-aos="fade-left"  data-aos-duration="2000">
    <div >
        <p>
            같은 동네에 친구가<br/> 없어도 부담없이<br/>
            같이 먹을 사람 찾기
        </p>
        <span>
            원하는 인원만큼 원하는 음식으로<br/>
            모집할 수 있어요.
        </span>
    </div>
    <div data-aos="fade-right">
        <img src="${contextPath}/resources/image/capture2.png"/>
    </div>
</div>
<div class="div4">
    <div data-aos="fade-left">
        <img src="${contextPath}/resources/image/capture1.png"/>
    </div>
    <div data-aos="fade-right">
        <p>계산할 필요없이 매번<br/> 자동 분할 계산!</p>
        <span>
            매번 계산기 두드리며 1/n을 하는 번거로움,<br/>
            칰칰폭폭에서는 대신 해드립니다.
        </span>
    </div>
</div>
<div class="div5" data-aos="flip-left"  data-aos-duration="2000">
    <div>
        <p>어떻게 이용하나요?</p>
        <span>‘따로 먹어요’, ‘같이 먹어요’ 중에 골라요. <br/>
            따로 먹으면 배달이용료만 나눠 내고, 같이 먹으면 배달이용료와 <br/>
            함께 음식금액을 같이 나눠요. </span>
    </div>
</div>
<div class="div6" data-aos="zoom-in"  data-aos-duration="2000">
    <div>
        <div>
            <p>모집 만들기</p>
            <span></span>
        </div>
        <span>함께 하고 싶은 인원 수와 모집하고 <br/>
            싶은 시간을 정해주세요.</span>
    </div>
    <div>
        <span></span>
        <div class="img_area">
            <img src="${contextPath}/resources/image/process1.png"/>
            <img src="${contextPath}/resources/image/process2.png"/>
            <img src="${contextPath}/resources/image/process3.png"/>
        </div>
    </div>
</div>
<div class="div7">
    <p>
        <img src="${contextPath}/resources/image/sparkles.png"/>
        더 <span>간편하게</span>, 더 <span>저렴하게</span><br/>
        음식을 주문해보세요.
        <img src="${contextPath}/resources/image/sparkles.png"/>
    </p>
    <div>
        <img   src="${contextPath}/resources/image/food1.png"/>
        <img  src="${contextPath}/resources/image/food2.png"/>
        <img   src="${contextPath}/resources/image/food3.png"/>
        <img   src="${contextPath}/resources/image/food4.png"/>
        <img   src="${contextPath}/resources/image/food5.png"/>
    </div>
     <a href="<c:if test="${member.nickname eq null}">${contextPath}/main</c:if><c:if test="${member.nickname ne null}">${contextPath}/post/list</c:if>">
         서비스 시작하기
     </a>
</div>
  </body>
</html>