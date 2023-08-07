<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/tradeBookDetail.css">

</head>

<body>

	<div class="detail-container">
		<div class="user-info3">
			<img alt="" src="">
			<div>유저이름&nbsp;</div>
			<div class="user-grade">등급</div>
		</div>

		<div class="trade-detail-main">
			<div class="trade-book">
				<img alt="" src="/img/bookimgsample.jpg">
				<!-- 책 이미지 -->
				<div class="trade-book-info">
					<div class="book-title">${trade.t_book_title }</div>
					<div class="authors">${trade.t_authors }</div>
					<div class="publisher">${trade.t_publisher }</div>
					<div class="price">${trade.t_price }원</div>
				</div>
			</div>
			<hr>
			<p>${trade.t_contents }</p>
			<div class="trade-map">
				<span>&nbsp;거래 희망 장소</span>
				<!-- 				<div class="map"></div> -->
			</div>

			<!-- 사려는 입장일 경우 쪽지 보내기 기능으로 -->

			<div class="trade-btn">
				<div class="complete">판매 완료하기</div>
				<div class="info-change">정보 수정</div>
			</div>
			<br>
			<div class="send-msg">판매자에게 쪽지 보내기</div>

		</div>
	</div>

</body>
</html>