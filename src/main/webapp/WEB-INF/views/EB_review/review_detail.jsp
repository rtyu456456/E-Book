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
	<div class="detail-container-gh">
	<img class="book-gh" src="/img/book.png" style="width: 100px; heigt: 130px;">
	<button>
		<img class="heart-gh" src="/img/heart.png" style="width: 50px; height:50px;">
	</button>
	<h6 class="detail-title-gh">책 제목</h6>
	<h6 class="detail-author-gh">저자</h6>
	<h6 class="detail-company-gh">출판사</h6>
	<h6 class="detail-pagecount-gh">페이지 수</h6>
	<h6 class="detail-publishdate-gh">발행일</h6>
	<br>
	<hr>
	<br>
	<div>
		<h1>책 소개</h1>
		<div>
			<h6>책 소개 내용</h6>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div>
		<h1>서평</h1>
		<%-- <c:forEach var="reviews" items="${reviews}"> --%>
		<div class="small-profile-gh">
			<img src="/img/daejeon_profile.png">
		</div>
		<h6 class="detail-name-gh">*대전공주</h6>
		<h6 class="detail-grade-gh">*실버 책벌레</h6>
		<h6 class="detail-date-gh">2023.08.09</h6>
		<div>
			<button>좋아요     개수</button>
			<button>싫어요     개수</button>
		</div>
		<h6 class="detail-review-gh">참 좋은 책이에요</h6>
		<%-- </c:forEach> --%>
		<div></div>
	</div>
</div>
</body>
</html>