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
             <img src="../img/chicken.png"/>
         </p>
     </div>
     <div class="text_area">
         <div class="person_area">
             <div>
             </div>
             <div>
                 <p class="uid">동동국수</p>
                 <p class="addr">유성구 봉명동</p>
             </div>
         </div>
         <div>
             <p class="title">포테킹 후라이드 같이 드실분~~</p>
         </div>
         <div>
             <p class="isTogether">같이 먹어요</p>
         </div>
         <div class="gather_area">
             <p class="maxMember">모집인원 : 1 / 4</p>
             <p class="deadline">모집시간 : 17:00</p>
         </div>
         <div>
             <span>요금을 확인해주세요</span>
             <div>
                 <p class="grey left">포테킹 후라이드 금액</p>
                 <p class="grey right">10,000원</p>
             </div>
             <div>
                 <p class="left">본인 몫(1/4)포테킹 후라이드 금액</p>
                 <p class="right">4,500원</p>
             </div>
             <div>
                 <p class="grey left">배달이용료 금액</p>
                 <p class="grey right">4,000원</p>
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
           /*  for(var i=0; i<7; i++){
                $('.item_list').append(' <li> '+
                       ' <div class="item_img"><img src="img/buy_item.jpg"/></div>'+
                       '<div>'+
                        ' <p class="name">에어데이즈 KF94 C타입 대형 35장</p>'+
                        '   <p class="location"><span>오산동</span><span>5초</span>전</p>'+
                        '   <p class="price"><span>15,000</span>원</p>'+
                        ' </div>'+
                        '</li>');
            } */

            $('.person_list').mouseover(function(){
               $(this).find('ul').css({'display':'block'}); 
            }).mouseout(function(){
                $(this).find('ul').css({'display':'none'});
            });

            $('nav li').click(function(){
                alert('준비중인 서비스입니다.');
            });
			
            $(".search").find('td').find('input').css({
            	"backgroundImage":"url('${contextPath}/resources/image/outline_search_white_24dp.png')"
            });

        });
    </script>