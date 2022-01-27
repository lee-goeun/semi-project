<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="today" value="<%=new java.util.Date()%>" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<div class="page_name">
    모집게시판 글쓰기
</div>
<form action="${contextPath}/post/addPost" method="post" enctype="multipart/form-data">
    <fieldset>
        <legend>상품등록</legend>
        <div class="submit_btn">
        	<button id="btn">완료</button> 
        </div>
        <div class="pic_area">
            <label class="image" for="image">사진</label>
            <input type="file" name="image" id="image" onchange="readURL(this);"/>
            <p>
				<img id="preview" src="#"/>
            </p>
        </div>
        <div class="text_area">
            <div>
                <label class="category" for="category">카테고리</label>
                <select name="category">
                    <option value="all" selected="selected">카테고리</option>
                    <option value="pizza">피자</option>
                    <option value="chicken">치킨</option>
                    <option value="hamburger">햄버거</option>
                </select>
            </div>
            <div>
                
                <input type="radio" name="isTogether" id="true" value="1"/>
                <label for="true">같이 먹어요</label>
                <input type="radio" name="isTogether" id="false" value="0"/>
                <label class="" for="false">따로 먹어요</label>
            </div>
            <div>
                <label class="title" for="title">제목</label>
                <input type="text" name="title" id="title" placeholder="제목"/>
            </div>
            <div>
                <label class="maxMember" for="maxMember">모집인원</label>
                <input type="number" name="maxMember" id="maxMember" placeholder="모집인원"/>
            </div>
            
            <div>
                <label class="deadline" for="deadline">모집시간</label>
                <input type="time" id="time" placeholder="모집시간"/>
                <input type="hidden" name="deadline" value="" id="deadline"/>
                <script type="text/javascript">
                	 
                </script>
            </div>
            <div>
                <label class="price" for="price">음식금액</label>
                <input type="number" name="price" id="price" placeholder="음식금액"/>
            </div>
            <div>
                <label class="deliveryFee" for="deliveryFee">배달료</label>
                <input type="number" name="deliveryFee" id="deliveryFee" placeholder="배달료"/>
            </div>
        </div>
    </fieldset>
</form>
<script type="text/javascript">
    $(document).ready(function(){
    	$('form').submit(function(){
    		//deadline 날짜 + 시간 형식으로 보내기 
    		var curDate = new Date();
    		var nowDate = curDate.getFullYear() + "-" + curDate.getMonth()+1 + "-" + curDate.getDate();
    		
      		var time = $('#time').val();
      		var test = nowDate + " " + time;
      		alert(typeof test);
      		alert(typeof $('#deliveryFee').val());
      		console.log("newDAte", typeof test);
          	$('#deadline').val(test);
    	});
    	
    	 $('#btn').click(function(){
    		 
    	//	$('form').submit();
    	}); 
    	 
     	$("form").find(".pic_area").find("#preview").css({
         	"backgroundImage":"url('${contextPath}/resources/image/outline_photo_camera_black_24dp.png')"
         });
     });
     
    //이미지 보여주기
    function readURL(input){
    	if(input.files && input.files[0]){
    		var reader = new FileReader();
    		reader.onload = function(e){
    			$('#preview').attr('src', e.target.result);
    		}
    		reader.readAsDataURL(input.files[0]);
    	}
    }
    </script>