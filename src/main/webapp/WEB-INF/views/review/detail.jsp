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
						<!-- 로그인한 회원과 게시물 작성자가 동일한 경우 표시 -->
<%-- 						<c:if test="${member.uid eq rDetail.uid}"> --%>
							<div class="writerBtn_wrap">
								<span class="dropBtn"><i class="fas fa-ellipsis-h"></i></span>
								<div class="writerBtn" style="display: none;">
										<button type="button" class="reviseBtn">수정</button>
										<button type="button" class="deleteBtn">삭제</button>
								</div>
							</div>
<%-- 						</c:if> --%>
						<button type="button" class="listBtn">목록</button>
					</div>
				</div>
				<div class="title" name="title"><c:out value="${rDetail.title}"/></div>
				<div class="content">
					<textarea name="content" readonly="readonly"><c:out value="${rDetail.content}" /></textarea>
				</div>
				<div class="count_wrap">
					<span name="" class="replyCount"><i></i>답변 <c:out value="${rDetail.replyCount}"/></span>
					<span name="viewCount" class="viewCount"><i></i>조회수 <c:out value="${rDetail.viewCount}"/></span>
				</div>
			</div>

			<div class="reply_wrap">
				<ul>
					<c:forEach items="${listReply}" var="listReply">
						<form class="reviseForm" method="post">
						<li class="replyInfo">
							<div class="replyNick_wrap">
								<span class="nickImg"></span>
								<span class="uid" style="display: none"><c:out value="${listReply.uid}"/></span>
								<span class="nick"><c:out value="${listReply.nickname}"/>
								<div class="replyBtn_wrap">
									<span class="dropBtn"><i class="fas fa-ellipsis-h"></i></span>
									<div class="replyBtn" style="display: none;">
										<button type="button" class="replyReviseBtn">수정</button>
										<button type="button" class="replyDeleteBtn">삭제</button>
									</div>
								</div>
								</span>
								<span class="address"><c:out value="${listReply.address}"/></span>
								<div class="replyReviseBtn_wrap" style="display:none">
									<button type="button" class="replyReviseCancle">취소</button>
									<button type="button" class="replyReviseWrite">완료</button>
								</div>
							</div>
							<div class="replyContent">
								<textarea id="replyContent" name="replyContent" readonly="readOnly" onkeyup="adjustTextarea();"><c:out value="${listReply.replyContent}"/></textarea>
							</div>
							<input type="hidden" id="replyId" name="replyId" value='<c:out value="${listReply.replyId}"/>' />
						</li>
						</form>
					</c:forEach>
				</ul>
				<div class="replyNone" style="display: none;">
					<i class="far fa-comment-dots fa-flip-horizontal"></i>
					<p>아직 댓글이 없어요.</p>
					<p>첫번째 댓글을 남겨주세요.</p>
				</div>
				
				<form id="replyForm" method="post">
					<div class="replyInput_wrap">
						<input type="text" name="replyContent" class="replyInput" placeholder="댓글을 입력해주세요.">
						
						<input type="hidden" name="uid" class="replyInputUid" value="${member.uid}" placeholder="작성자" readyonly>
						<button class="replyInputBtn">등록</button>
					</div>
					
					<input type="hidden" id="reviewId" name="reviewId" value='<c:out value="${rDetail.reviewId}"/>' />
				</form>
			</div>
			
			<form id="detailForm" method="get">
				<input type="hidden" id="reviewId" name="reviewId" value='<c:out value="${rDetail.reviewId}"/>'>
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
		
		/* 댓글이 없을 경우 */
		const isReplyInfo = document.querySelectorAll('.replyInfo');
		if (isReplyInfo.length <= 0) {
			document.querySelector(".replyNone").style.display = '';
		}
	});

	/* 버튼 이벤트 */
	let detailForm = $("#detailForm");
	let replyForm = $("#replyForm");

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
	
	////////////////////////////////////////////////////////////////////////////////////////
// 	const reviseForm = document.querySelectorAll("#reviseForm");
	
	/* 댓글 작성 버튼 */
	$(".replyInputBtn").on("click", function() {
		if(document.querySelector(".replyInput").value == ""){
			alert("댓글을 작성해주세요.");
			return false;
		}
		
		replyForm.attr("action", "/review/replyWrite.do");
// 		replyForm.attr("method", "post");
		replyForm.submit();
	});
	
	/* 댓글 삭제 버튼 */
// 	$(".replyDeleteBtn").on("click", function() {
// 		reviseForm.attr("action", "/review/replyDelete.do");
// 		reviseForm.submit();
// 	});
	
	/* 댓글 수정 완료 버튼 */
// 	$(".replyReviseWrite").on("click", function() {
// 		reviseForm.attr("action", "/review/replyRevise.do");
// 		reviseForm.submit();
// 	});
	
	/* 내용 textarea 높이 조정 */
	const contentTextarea = document.querySelector(".content textarea");
	contentTextarea.style.height = "auto";
	contentTextarea.style.height = (contentTextarea.scrollHeight) + 'px';

	/* 댓글 textarea 높이 조정 */
	const replyTextarea = document.querySelectorAll(".replyContent textarea");

	function adjustTextarea() {
		for (let i = 0; i < replyTextarea.length; i++) {
			replyTextarea[i].style.height = "auto";
			replyTextarea[i].style.height = (replyTextarea[i].scrollHeight) + 'px';

			if (replyTextarea[i].value.length <= 70 && replyTextarea[i].value.split('\n').length <= 1) {
				replyTextarea[i].style.height = 46 + "px";
			}
		}
	}
	adjustTextarea();

	// var tArea = $(".replyContent textarea")[0];
	// var tAreaLine = tArea.value.substr(0, tArea.selectionStart).split("\n").length;
	// alert(tAreaLine);

	/* 게시물 수정 & 삭제 버튼 토글 */
	const dropBtn = document.querySelector(".btn_wrap .writerBtn_wrap .dropBtn");
	const writerBtn = document.querySelector(".btn_wrap .writerBtn_wrap .writerBtn");

	function writerBtnShowFunc(e) {
		if (writerBtn.style.display == "none") {
			writerBtn.style.display = "";
		} else {
			writerBtn.style.display = "none";
		}
	}

	dropBtn.addEventListener("click", writerBtnShowFunc);

	/* 게시물 수정 & 삭제 버튼 토글 (jQuery) */
	// $(".btn_wrap .writerBtn_wrap .dropBtn").click(function () {
	// 	$(".btn_wrap .writerBtn_wrap .writerBtn").toggle();
	// });

	/* 댓글 수정 & 삭제 버튼 토글 */
	const replyDropBtn = document.querySelectorAll(".replyBtn_wrap .dropBtn");
	const replyBtn = document.querySelectorAll(".replyBtn_wrap .replyBtn");

	function replyBtnShowFunc(i) {
		if (replyBtn[i].style.display == "none") {
			replyBtn[i].style.display = "";
		} else {
			replyBtn[i].style.display = "none";
		}
		return false;
	}

	/* 댓글 수정 버튼 */
	const replyReviseBtn = document.querySelectorAll(".replyBtn_wrap .replyBtn .replyReviseBtn");
	const replyReviseInput = document.querySelectorAll(".replyContent textarea");
	const replyReviseBtnWrap = document.querySelectorAll(".replyReviseBtn_wrap");

	function replyReviseBtnFunc(i) {
		replyReviseInput[i].readOnly = false; // input readyOnly 해제
		replyReviseInput[i].classList.add("readonlyF"); // 스타일 클래스 추가
		replyReviseBtnWrap[i].style.display = "";	// 수정 취소, 완료 버튼 표시
	}
	
	function preventDefault(e) {
		  e.preventDefault();
	}

	/* 댓글 수정 취소 버튼 */ // (수정 완료 시에도 동일하게 적용)
	const replyReviseCancleBtn = document.querySelectorAll(".replyReviseCancle");
	const replyReviseWriteBtn = document.querySelectorAll(".replyReviseWrite");
	function replyReviseCancleFunc(i) {
		replyReviseInput[i].readOnly = "readOnly";	// inut readOnly 설정
		replyReviseInput[i].classList.remove("readonlyF");	// 스타일 클래스 제거
		replyReviseBtnWrap[i].style.display = "none";	// 수정 취소, 완료 버튼 제거
	}
	
	/* 함수 실행 */
	const replyCount = document.querySelectorAll(".reply_wrap ul li");
	for (let i = 0; i < replyCount.length; i++) {
		replyDropBtn[i].addEventListener("click", event => replyBtnShowFunc(i));	// 댓글 수정&삭제 버튼 토글
		replyReviseBtn[i].addEventListener("click", event => replyReviseBtnFunc(i));	// 댓글 수정 버튼
		replyReviseCancleBtn[i].addEventListener("click", event => replyReviseCancleFunc(i));	// 댓글 수정 취소 버튼
		replyReviseWriteBtn[i].addEventListener("click", event => replyReviseCancleFunc(i));	// 댓글 수정 완료 버튼
	}
	
	
	for (let i = 0; i < replyCount.length; i++) {
		/* 댓글 삭제*/
		$(".replyDeleteBtn").eq(i).on("click", function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				$(".reviseForm").eq(i).attr("action", "/review/replyDelete.do");
				$(".reviseForm").eq(i).submit();
			} else {
				return false;
			}
		});
	}
	
	for (let i = 0; i < replyCount.length; i++) {
		/* 댓글 수정 완료 */
		$(".replyReviseWrite").eq(i).on("click", function() {
			$(".reviseForm").eq(i).attr("action", "/review/replyRevise.do");
			$(".reviseForm").eq(i).submit();
		});
	}
	
	/* 게시물 버튼 표시 */
	if("${member.uid}" != "${rDetail.uid}") {
			$(".writerBtn_wrap").css("display", "none");
	}
	
	/* 댓글 버튼 표시 */
	for (let i = 0; i < replyCount.length; i++) {
		if("${member.uid}" != $("span.uid").eq(i).text()) {
			$(".replyBtn_wrap").eq(i).css("display", "none");
		}
	}

</script>