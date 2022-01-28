<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <section id="main"> -->
	<div class="container">

		<div class="contents">

			<div class="detail_wrap">
				<div class="nick_wrap">
					<span class="nickImg"></span>
					<span name="uid" class="nick"><c:out value="${rDetail.nickname}"/></span>
					<span name="" class="address"><c:out value="${rDetail.address}"/></span>

					<div class="btn_wrap">
						<div class="writerBtn_wrap">
							<span class="dropBtn"><i class="fas fa-ellipsis-h"></i></span>
							<div class="writerBtn" style="display: none;">
								<button class="reviseBtn">수정</button>
								<button class="deleteBtn">삭제</button>
							</div>
						</div>
						<button class="listBtn">목록</button>
					</div>
				</div>
				<div class="title" name="title"><c:out value="${rDetail.title}"/></div>
				<div class="content">
					<textarea name="content" readonly="readonly"><c:out value="${rDetail.content}" /></textarea>
				</div>
				<div class="count_wrap">
					<span name="" class="replyCount"><i></i>답변 23</span>
					<span name="viewCount" class="viewCount"><i></i>조회수 <c:out value="${rDetail.viewCount}"/></span>
				</div>
			</div>

			<div class="reply_wrap">
				<ul>
					<li>
						<div class="replyNick_wrap">
							<span class="nickImg"></span> <span class="nick">사리곰탕
								<div class="replyBtn_wrap">
									<span class="dropBtn"><i class="fas fa-ellipsis-h"></i></span>
									<div class="replyBtn" style="display: none;">
										<button class="replyReviseBtn">수정</button>
										<button class="replyDeleteBtn">삭제</button>
									</div>
								</div>
							</span> <span class="address">유성구 봉명동</span>
						</div>
						<div class="replyContent">사리곰탕이 더 맛있어요</div>
					</li>
				</ul>
				<div class="replyNone" style="display: none;">
					<i class="far fa-comment-dots fa-flip-horizontal"></i>
					<p>아직 댓글이 없어요.</p>
					<p>첫번째 댓글을 남겨주세요.</p>
				</div>
				<div class="replyInput_wrap">
					<input type="text" class="replyInput" placeholder="댓글을 입력해주세요.">
					<button class="replyInputBtn">등록</button>
				</div>
			</div>
			
			<form id="detailForm" method="get">
				<input type="hidden" id="reviewId" name="reviewId" value='<c:out value="${rDetail.reviewId}"/>'>
				<!-- 게시물 번호 -->
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
			</form>

		</div>

	</div>
<!-- </section> -->

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
	
	function adjustHeight() {
		var textEle = $('.content textarea');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight);
	};
	adjustHeight(); // 함수를 실행하면 자동으로 textarea의 높이 조절

	/* 게시물 수정 & 삭제 버튼 토글 */
	$(".btn_wrap .writerBtn_wrap .dropBtn").click(function () {
		$(".btn_wrap .writerBtn_wrap .writerBtn").toggle();
	});
	/* 댓글 수정 & 삭제 버튼 토글 */
	$(".replyBtn_wrap .dropBtn").click(function () {
		$(".replyBtn_wrap .replyBtn").toggle();
	});
</script>