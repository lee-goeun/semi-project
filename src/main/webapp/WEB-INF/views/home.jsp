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
<a href="/member/guide" class="top_btn"><img class="bar" src="${contextPath}/resources/image/bar_9.png"/></a>
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
                ?????? ??? ??? ????????????<br/> ????????? ????????????
            </p>
            <span>
                ?????? ????????? ?????????????????? ???????????????????
            </span>
           	<a href="<c:if test="${member.nickname eq null}">${contextPath}/main</c:if><c:if test="${member.nickname ne null}">${contextPath}/post/list</c:if>">
                ????????? ????????????
            </a>
        </div>
    </div>
</div>
<div class="div2">
    <div data-aos="fade-right" data-aos="fade-left"  data-aos-duration="2000">
        <p>
            ?????????????????????<br/>
            4000??? ???????????? 4????????? 1000??????!
        </p>
        <img src="${contextPath}/resources/image/lowerPrice.png"/>
    </div>
    
</div>
<div class="div3" data-aos="fade-left"  data-aos-duration="2000">
    <div >
        <p>
            ?????? ????????? ?????????<br/> ????????? ????????????<br/>
            ?????? ?????? ?????? ??????
        </p>
        <span>
            ????????? ???????????? ????????? ????????????<br/>
            ????????? ??? ?????????.
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
        <p>????????? ???????????? ??????<br/> ?????? ?????? ??????!</p>
        <span>
            ?????? ????????? ???????????? 1/n??? ?????? ????????????,<br/>
            ????????????????????? ?????? ???????????????.
        </span>
    </div>
</div>
<div class="div5" data-aos="flip-left"  data-aos-duration="2000">
    <div>
        <p>????????? ????????????????</p>
        <span>????????? ????????????, ????????? ???????????? ?????? ?????????. <br/>
            ?????? ????????? ?????????????????? ?????? ??????, ?????? ????????? ?????????????????? <br/>
            ?????? ??????????????? ?????? ?????????. </span>
    </div>
</div>
<div class="div6" data-aos="zoom-in"  data-aos-duration="2000">
    <div>
        <div>
            <p>?????? ?????????</p>
            <span></span>
        </div>
        <span>?????? ?????? ?????? ?????? ?????? ???????????? <br/>
            ?????? ????????? ???????????????.</span>
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
        ??? <span>????????????</span>, ??? <span>????????????</span><br/>
        ????????? ??????????????????.
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
         ????????? ????????????
     </a>
</div>
  </body>
</html>