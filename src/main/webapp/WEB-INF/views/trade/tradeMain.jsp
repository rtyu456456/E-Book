<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="css/trade/tradeMain.css">
</head>
<body>

	<div class="trade-search">
		<form action="trade.search.title" method="get">
			<input type="text" name="t_book_title" placeholder="제목을 입력해 주세요">
			<button type="submit" class="search-btn">
				<img src="/img/Mask_group.png">
			</button>
		</form>
	</div>


	<div class="trade-all-list">
		<c:forEach var="t" items="${trades }">
			<div class="trade-list"
				onclick="location.href='trade.detail.go?t_no=${t.t_no }'">
				<div class="book-img">
					<img alt="" src="uploadFolder/${t.t_thumbnail}">
				</div>
				<div class="trade-book-info">
					<div class="title">${t.t_title }</div>
					<div class="booktitle">${t.t_book_title }</div>
					<div class="authors">${t.t_authors }</div>
					<div class="publisher">${t.t_publisher }</div>
					<div class="price">
						<fmt:formatNumber value="${t.t_price }" pattern="#,###원" />
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script>
		if(${param.title == null}){
			localStorage.clear()
		}
	</script>
</body>
</html>