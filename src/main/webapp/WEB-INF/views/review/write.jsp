<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <section id="main"> -->
	<div class="container">
		<div class="contents">
			<h3 class="subTitle">후기 게시판 글쓰기</h3>
			<div class="write_wrap">
				<form id="writeForm" method="post" action="/review/write.do">
					<div class="input_wrap">
						<input type="text" name="title" class="title" placeholder="제목을 입력해주세요." maxlength="30">
					</div>
					<div class="input_wrap">
						<textarea name="content" class="content" placeholder="후기를 자유롭게 작성해주세요."></textarea>
					</div>
					<div class="input_wrap">
						<input type="hidden" name="uid" value="${member.uid}" placeholder="작성자" readonly>
						<input type="hidden" name="region1" value="${member.region1}" placeholder="시도" readonly>
						<input type="hidden" name="region2" value="${member.region2}" placeholder="구" readonly>
						<input type="hidden" name="region3" value="${member.region3}" placeholder="동" readonly>
					</div>
					<div class="btn_wrap">
						<button type="button" class="cancleBtn" onclick="location.href='/review/list'">취소</button>
						<button type="submit" class="writeBtn">완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<!-- </section> -->

<script>
	$(document).ready(function() {

		$(".writeBtn").on("click", function() {
			if ($(".title").val() == "") {
				alert("제목을 입력해주세요.");
				$(".title").focus();
				return false;
			}
			if ($(".content").val() == "") {
				alert("내용을 입력해주세요.");
				$(".content").focus();
				return false;
			}
		});

	});
	
</script>