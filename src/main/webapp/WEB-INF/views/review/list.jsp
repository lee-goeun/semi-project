<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <section id="main"> -->
	<div class="container">

		<div class="contents">

			<!-- 검색 -->
			<div class="search_wrap">
				<select name="type" class="searchSelect">
					<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
					<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
					<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
					<%-- 			<option value="A" <c:out value="${pageMaker.cri.type eq 'A'?'selected':'' }"/>>지역</option> --%>
				</select>
				<input type="text" name="keyword" class="searchInput" value="${pageMaker.cri.keyword }" onKeyPress="if (event.keyCode==13){searchFunc();}">
				<button class="searchBtn">
					<i class="fas fa-search"></i>
				</button>
				<a href="/review/list" class="searchReset" style="display:none">취소</a>
			</div>

			<!-- 게시물 목록 -->
			<div class="list_wrap">
				<table>
					<tbody>
						<c:forEach items="${rList}" var="rList">
<%-- 							<c:if test="${rList.isDeleted == 0}"> --%> <!-- mapper에 적용했음 -->
								<tr class="reviewInfo">
									<td class="reviewId"><c:out value="${rList.reviewId}" /></td>
									<td class="title_wrap">
<%-- 										<a href='/review/detail?reviewId=<c:out value="${rList.reviewId}"/>'> --%>
										<a href='<c:out value="${rList.reviewId}"/>'>
											<div class="title">
												<c:out value="${rList.title}" />
											</div>
											<div class="count_wrap">
												<span class="replyCount"><i></i>답변 (답변수)</span>
												<span class="viewCount"><i></i>조회수 <c:out value="${rList.viewCount}" /></span>
											</div>
										</a>
									</td>
									<td class="nickname"><c:out value="${rList.nickname}" /></td>
									<td class="address"><c:out value="${rList.address}" /></td>
									<td class="reviewedDate"><c:out value="${rList.reviewedDate}" /></td>
								</tr>
<%-- 							</c:if> --%>
						</c:forEach>
						<tr class="reviewSearchNone" style="display: none">
							<td>검색 결과가 없어요.</td>
						</tr>
						<tr class="reviewNone" style="display: none">
								<td>아직 게시물이 없어요.</td>
						</tr>
					</tbody>
				</table>
				
				<!-- 페이징 -->
				<div class="paging_wrap">
					<ul class="pageInfo">
						<c:if test="${pageMaker.prev}">
							<li class="prevBtn"><a href="${pageMaker.startPage-1}"><i class="fas fa-angle-left"></i></a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class=" ${pageMaker.cri.pageNum == num ? "active":"" }">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="nextBtn"><a href="${pageMaker.endPage + 1 }"><i class="fas fa-angle-right"></i></a></li>
						</c:if>
					</ul>
				</div>
				
				<!-- 버튼 -->
				<div class="btn_wrap">
					<a href="/review/write" class="writeBtn">글쓰기</a>
				</div>
			</div>
			
			<!-- 상세 페이지 & 페이징 처리 폼 -->
			<form id="listForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
			</form>
			
		</div>
		
	</div>
<!-- </section> -->

<!-- script  -->
<script>
	$(document).ready(function() {
		let result = '<c:out value="${result}"/>';

		if (result === "write success") {
			alert("작성이 완료되었습니다.");
		} else if (result === "delete success") {
			alert("삭제가 완료되었습니다.");
		}
		
		/* 게시물이 없을 경우 */
		const isReviewInfo = document.querySelectorAll('.reviewInfo');
		let keyword = $(".search_wrap input[name='keyword']").val();
		
		if (isReviewInfo.length <= 0) {
			if (keyword) { // 검색 결과가 없을 경우
				document.querySelector(".reviewSearchNone").style.display = '';
			} else {
				document.querySelector(".reviewNone").style.display = '';
			}
		}
		
		/* 검색하면 취소 버튼 표시 */
		if (keyword) {
				document.querySelector(".searchReset").style.display = '';
		} else {
				document.querySelector(".searchReset").style.display = 'none';
		}
		
	});

	const listForm = $("#listForm");
	
	/* 상세페이지 */
	$(".title_wrap a").on("click", function(e){
        e.preventDefault();
        listForm.find("input[name='reviewId']").remove();
        listForm.append("<input type='hidden' name='reviewId' value='"+ $(this).attr("href")+ "'>");
        listForm.attr("action", "/review/detail");
        listForm.submit();
    });

	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();
		listForm.find("input[name='pageNum']").val($(this).attr("href"));
		listForm.attr("action", "/review/list");
		listForm.submit();
	});

	/* 검색 기능 */
	$(".search_wrap .searchBtn").on("click", function(e) {
		e.preventDefault();
		searchFunc();
	});
	
	function searchFunc() {
		let type = $(".search_wrap select").val();
		let keyword = $(".search_wrap input[name='keyword']").val();

		if (!keyword) {
			location.href = "/review/list";
// 			alert("키워드를 입력하세요.");
// 			return false;
		}

		listForm.find("input[name='type']").val(type);
		listForm.find("input[name='keyword']").val(keyword);
		listForm.find("input[name='pageNum']").val(1);
		listForm.attr("action", "/review/list");
		listForm.submit();
	}
	
	/* 뒤로가기 이벤트 발생시 */
// 	window.onpageshow = function(event){
// 		if(event.persisted){
// 			listForm.find("input[name='reviewId']").remove();
// 			listForm.attr("action", "/review/list");
// 			listForm.submit();
// 		}
// 	}
</script>