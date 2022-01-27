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
                    17:20:30
                </div>
                <div class="search_area">
                    <fieldset>
                        <div>
                            <input type="text" placeholder="상품명을 입력하세요."/>
                        </div>
                        <div class="search_btn">
                            <input type="submit" value=""/>
                        </div>
                    </fieldset>
                </div>
                <div class="stt_area">
                    <input type="button" value="음성으로 말해요"/>
                </div>
            </div>
            <div class="tab">
                <ul>
                    <li class="selected"><a href="#none">전체보기</a></li>
                    <li><a href="#none">같이 먹어요</a></li>
                    <li><a href="#none">따로 먹어요</a></li>
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
                            <a href="${contextPath}/post/viewPost?postId=1234">등록된 상품이 없습니다.</a>
                        </li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="post" items="${postsList}" varStatus="postNum">
    							<a>
	                                <li>
	                                     <div class="item_img"><img src="${contextPath}/download.do?postId=${post.postId}&image=${post.image}"/></div> 
	                                    <%-- <div>
	                                         <p class="name">${post.title}</p>  
	                                         <p class="location"><span>오산동</span><span>5초</span>전</p>
	                                         <p class="price"><span>${post.price}</span>원</p> 
	                                    </div> --%>
	                                </li>
                                </a>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
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

            
            $(".search_area").find('.search_btn').find('input').css({
            	"backgroundImage":"url('${contextPath}/resources/image/outline_search_white_24dp.png')"
            });

        });
    </script>