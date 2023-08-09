<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="review-contents-gh">
		<!------ 검색창 ------>
		<div class="search-gh">
		<!-- select option 값 받아서 검색어랑 보내기 -->
			<select class="option-gh">
				<option>제목
				<option>저자
			</select>
			<div class="search-box-gh">
				<input class="input-gh" placeholder="책을 검색해보세요">
				<form action="review.search">
					<button class="search-btn-gh">
						<img src="/img/seachBtn.png">
					</button>
				</form>
		<!------------------------------------->
			</div>
			<form action="review.write">
				<button class="write-btn-gh">
					서평<br>쓰기
				</button>
			</form>
		</div>


		<!------ 검색 결과(페이징 필요?)------>
		<%-- <c:forEach var="result" items="${result }"> --%>
				<div class="result-box-gh">
					<a href="review.detail"><img class="small-book-gh"
						src="/img/book.png"></a>
					<div class="result-info-gh">
						<h5 class="result-title-gh">책 이름</h5>
						<h5 class="result-author-gh">작가</h5>
						<h5 class="result-company-gh">출판사</h5>
					</div>
					<div class="result-reputation-gh">
					<!-- 전체 독자(서평 남긴 사람?)와 좋아요 독자 비율 계산 후 반영 -->
						<h5>전체 독자의</h5>
						<h5 class="result-percent-gh">100%</h5>
						<h6>가 좋아합니다</h6>
					</div>
				</div>
		<%-- </c:forEach> --%>
	</div>
</body>
</html>