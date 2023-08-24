<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서평-검색</title>
</head>
<body>
	<!------ 검색 결과(페이징 필요?)------>
	<c:forEach var="bs" items="${bookSearch }">
		<div class="result-box-gh">
			<a href="book.detail?b_no=${bs.b_no }"><img class="small-book-gh"
				src=${bs.b_thumbnail }></a>
			<div class="result-info-gh">
				<h5 class="result-title-gh">${bs.b_title }</h5>
				<h5 class="result-author-gh">${bs.b_authors.replace("!", ", ") }</h5>
				<h5 class="result-company-gh">${bs.b_publisher }</h5>
			</div>
			<div class="result-reputation-gh">
				<h6 class="text-gh">전체 독자의</h6>
				<h6>
					<span class="percent-gh">${bs.positive_percentage }%</span> <span class="text-gh"
						style="line-height: -0.5rem;">가 좋아합니다</span>
				</h6>
			</div>
		</div>
	</c:forEach>
</body>
</html>