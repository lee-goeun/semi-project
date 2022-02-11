<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="contents">
		<h3 class="subTitle">후기 게시판 수정</h3>
		<div class="revise_wrap">
			<form id="reviseForm" method="post" action="/review/write.do">
				<input type="hidden" name="reviewId" id="reviewId" value="${rDetail.reviewId}">
				<div class="input_wrap">
					<input type="text" name="title" id="title" value='<c:out value="${rDetail.title}"/>' placeholder="제목을 입력해주세요" maxlength="30">
				</div>
				<div class="input_wrap">
					<textarea name="content" id="content" placeholder="후기를 자유롭게 작성해주세요."><c:out value="${rDetail.content}" /></textarea>
				</div>
				<div class="input_wrap" style="display:none">
					<input type="text" name="uid" readonly="readonly" value='<c:out value="${rDetail.uid}"/>' placeholder="작성자">
				</div>
				<div class="btn_wrap">
					<button type="button" class="cancleBtn">취소</button>
					<button type="submit" class="reviseBtn">완료</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- script  -->
<script>
	$(document).ready(function() {

		let reviseForm = $("#reviseForm");

		$(".cancleBtn").on("click", function() {
			window.history.back();
		});

		$(".reviseBtn").on("click", function() {
			reviseForm.attr("action", "/review/revise.do");
			reviseForm.attr("method", "post");
			reviseForm.submit();
		});

	});
</script>