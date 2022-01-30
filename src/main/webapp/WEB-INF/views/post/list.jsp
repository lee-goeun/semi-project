<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="today" value="<%=new java.util.Date()%>" />

<%
	request.setCharacterEncoding("UTF-8");
%>
	<div class="top">
      <div class="time_area">
           <fmt:formatDate value="${today}" pattern="HH:mm:ss"/>
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
          <input type="button" value="음성으로 말해요"/>
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
   $(document).ready(function(){
	//   $('.tab').find('ul').find('li').eq(0).addClass('selected');
	   $('form').submit(function(){
		   var title = $('#title').val();
		   $('#category').val(title);
	   });
	  	
	   $('.tab').find('ul').find('li').on('click', function(){
		   $.ajax({
			   
		   })
	   });
	   
       
       $(".search_area").find('.search_btn').find('button').css({
       	"backgroundImage":"url('${contextPath}/resources/image/outline_search_white_24dp.png')"
       });

   });
</script>