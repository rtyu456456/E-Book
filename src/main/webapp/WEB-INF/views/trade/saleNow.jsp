<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/saleNow.css">
</head>
<body>

	<div class="trade-all-list">
		<c:forEach var="t" items="${trades }">
			<div class="trade-list"
				onclick="location.href='trade.detail.go?t_no=${t.t_no }'">
				<div class="book-img">
					<img src="${upload.path}/${t.t_thumbnail}"> 
				</div>
				<div class="trade-book-info">
					<div class="title">${t.t_title }</div>
					<div class="booktitle">${t.t_book_title }</div>
					<div class="authors">${t.t_authors }</div>
					<div class="publisher">${t.t_publisher }</div>
					<div class="price">
						<fmt:formatNumber value="${t.t_price }" pattern="#,###" />
						원
					</div>
				</div>
				<div class="trade-soldout">
					<c:choose>
						<c:when test="${t.t_soldout == 0 }">
							<div class="sale">
								<span> 판매 중 </span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="soldout">
								판매 완료 
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>