<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<h1>후기게시판 상세 페이지</h1>

	<div class="detail_wrap">
		<div class="input_wrap">
			<label>작성자</label>
			<input type="text" name="uid" readonly="readonly" value='<c:out value="${rDetail.uid}"/>'>
		</div>
		<div class="input_wrap">
			<label>지역</label>
			<input type="text" name="" readonly="readonly" value="지역">
		</div>
		<div class="input_wrap">
			<label>제목</label>
			<input type="text" name="title" readonly="readonly" value='<c:out value="${rDetail.title}"/>'>
		</div>
		<div class="input_wrap">
			<label>내용</label>
			<textarea name="content" readonly="readonly"><c:out value="${rDetail.content}" /></textarea>
		</div>
		<div class="input_wrap">
			<label>댓글수</label>
			<input type="text" name="" readonly="readonly" value="댓글수"></input>
		</div>
		<div class="input_wrap">
			<label>조회수</label>
			<input type="text" name="viewCount" readonly="readonly" value='<c:out value="${rDetail.viewCount}"/>'></input>
		</div>
	</div>

	<div class="btn_wrap">
		<button class="listBtn">목록</button>
		<button class="reviseBtn">수정</button>
		<button class="deleteBtn">삭제</button>
	</div>
	
	<form id="detailForm" method="get">
		<input type="hidden" id="reviewId" name="reviewId" value='<c:out value="${rDetail.reviewId}"/>'> <!-- 게시물 번호 -->
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
		<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
	</form>

	<!-- script  -->
	<script>
		$(document).ready(function() {
			/* 수정 완료 ALERT */
			if ('<c:out value="${result}"/>' === "revise success") {
				alert("수정이 완료되었습니다.");
			}

		});
		
		/* 버튼 이벤트 */
		let detailForm = $("#detailForm");

		$(".listBtn").on("click", function() {
			detailForm.find("#reviewId").remove();
			detailForm.attr("action", "/review/list");
			detailForm.submit();
		});

		$(".reviseBtn").on("click", function() {
			detailForm.attr("action", "/review/revise");
			detailForm.submit();
		});

		$(".deleteBtn").on("click", function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				detailForm.attr("action", "/review/delete.do");
				detailForm.attr("method", "post");
				detailForm.submit();
			} else {
				return false;
			}
		});
	</script>
</body>
</html>