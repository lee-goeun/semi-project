<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
            <input class="btn" type="submit" value="완료"/>
        </div>
        <div class="pic_area">
            <label class="fpicture" for="fpicture">사진</label>
            <input type="file" name="fpicture" id="fpicture"/>
            <p id="preview">

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
                
                <input type="radio" name="isTogether" id="true" value="true"/>
                <label for="true">같이 먹어요</label>
                <input type="radio" name="isTogether" id="false" value="false"/>
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
                <input type="time" name="deadline" id="deadline" placeholder="모집시간"/>
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
            document.ready(function(){
            	$("form").find(".pic_area").find('#preview').css({
                	"backgroundImage":"url('${contextPath}/resources/image/outline_photo_camera_black_24dp.png')"
                });
            });
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