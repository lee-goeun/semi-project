<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<style>
.active {
	color: red;
	font-weight: bold;
}
</style>

<!-- script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<h1>후기게시판 목록 페이지</h1>

	<div class="list_wrap">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>지역</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>답변수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${rList}" var="rList">
					<c:if test="${rList.isDeleted == 0}">
						<tr>
							<td><c:out value="${rList.reviewId}" /></td>
							<td>
<%-- 								<a href='/review/detail?reviewId=<c:out value="${rList.reviewId}"/>'> --%>
								<a href='<c:out value="${rList.reviewId}"/>' class="title">
									<c:out value="${rList.title}" />
								</a>
							</td>
							<td><c:out value="${rList.uid}" /></td>
							<td>지역</td>
							<td><c:out value="${rList.reviewedDate}" /></td>
							<td><c:out value="${rList.viewCount}" /></td>
							<td>답변수</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="btn_wrap">
		<a href="/review/write">글쓰기</a>
	</div>
	
	<!-- 페이징 -->
	<div class="paging_wrap">
		<ul class="pageInfo">
			<c:if test="${pageMaker.prev}">
				<li class="prevBtn"><a href="${pageMaker.startPage-1}">이전</a></li>
			</c:if>
	
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
				<li class=" ${pageMaker.cri.pageNum == num ? "active":"" }">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
	
			<c:if test="${pageMaker.next}">
				<li class="nextBtn"><a href="${pageMaker.endPage + 1 }">다음</a></li>
			</c:if>
		</ul>
	</div>
	
	<!-- 검색 -->
	<div class="search_wrap">
	        <select name="type">
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
	<%-- 			<option value="A" <c:out value="${pageMaker.cri.type eq 'A'?'selected':'' }"/>>지역</option> --%>
			</select> 
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button>Search</button>
    </div> 
	
	<!-- 상세 페이지 & 페이징 처리 폼 -->
	<form id="listForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>

	<!-- script  -->
	<script>
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			if (result === "write success") {
				alert("작성이 완료되었습니다.");
			} else if (result === "delete success"){
				alert("삭제가 완료되었습니다.");
			}

		});
		
		const listForm = $("#listForm");
		
	    $(".title").on("click", function(e){
	        e.preventDefault();
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
		
		/* 검색 버튼 */
		$(".search_wrap button").on("click", function(e){
			e.preventDefault();
			
			let type = $(".search_wrap select").val();
	        let keyword = $(".search_wrap input[name='keyword']").val();
	        
// 	        if(!type){
// 	            alert("검색 종류를 선택하세요.");
// 	            return false;
// 	        }
	        
	        if(!keyword){
	            alert("키워드를 입력하세요.");
	            return false;
	        }        
	        
	        listForm.find("input[name='type']").val(type);
	        listForm.find("input[name='keyword']").val(keyword);
	        listForm.find("input[name='pageNum']").val(1);
	        listForm.submit();
	    });
	</script>
</body>

</html>