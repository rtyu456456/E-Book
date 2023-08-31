<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="css/trade/tradeSearch.css">
</head>
<body>

	<div class="trade-search">
		<form action="trade.reg.search.name" method="get">
			<input type="text" name="b_title" placeholder="제목을 입력해 주세요">
			<button type="submit" class="search-btn">
				<img src="/img/Mask_group.png">
			</button>
		</form>
	</div>


	<div class="trade-all-list">
		<c:forEach var="b" items="${books }" varStatus="loop">
			<form class="trade-list-form">
				<div class="trade-list clickable-book" id="book-${loop.index}">
					<!-- 클릭 영역 -->
					<div class="book-img">
						<img alt="" src="${b.b_thumbnail }">
					</div>
					<div class="trade-book-info">
						<div class="book-title">${b.b_title }</div>
						<div class="authors">${b.b_authors }</div>
						<div class="publisher">${b.b_publisher }</div>
						<div class="price">
							<fmt:formatNumber value="${b.b_price }" pattern="#,###원" /> 
							
						</div>
					</div>
				</div>
			</form>
			<script>
            // 각 도서 정보의 클릭 영역을 선택하여 클릭 이벤트 처리
            const bookElement${loop.index} = document.getElementById("book-${loop.index}");
            bookElement${loop.index}.addEventListener("click", function() {
                redirectToTradeRegGo('${b.b_title}', '${b.b_authors}', '${b.b_publisher}', ${b.b_price}, '${b.b_thumbnail}'); // 페이지 이동 함수 호출
            });
        </script>
		</c:forEach>
	</div>
	<script>
    // 페이지 이동 함수
    function redirectToTradeRegGo(title, authors, publisher, price, thumbnail) {
        // 원하는 컨트롤러 경로로 페이지 이동
        window.location.href = "trade.reg.go?title=" + encodeURIComponent(title) +
                               "&authors=" + encodeURIComponent(authors) +
                               "&publisher=" + encodeURIComponent(publisher) +
                               "&price=" + price +
                               "&thumbnail=" + encodeURIComponent(thumbnail);
    }
</script>
</body>
</html>