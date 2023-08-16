<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/tradeBookDetail.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2ec9e96982d203168b7d94dde7b62fe"></script>

</head>

<body>

	<div class="detail-container">

		<div class="book-info">
			<div class="book-img">
				<img alt="" src="/img/bookimgsample.jpg">
			</div>
			<div class="book-basic">
				<div class="book-title">${trade.t_book_title }</div>
				<div class="book-authors">${trade.t_authors }</div>
				<div class="book-publisher">${trade.t_publisher }</div>
				<div class="book-price">
					<fmt:formatNumber value="${trade.t_price }" pattern="#,###원" />
				</div>
				<br>
				<div class="trade-title">${trade.t_title }</div>

			</div>
		</div>
		<hr>
		<div class="book-contents">
			<p>${trade.t_contents }</p>
		</div>
		<div class="trade-map">
			<div id="map"></div>
		</div>
		
		<div class="trade-btn">
				<button></button>
				<button></button>
				<button></button>
		</div>
		
	</div>


	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.452613, 126.570888),
			level : 1
		};

		var map = new kakao.maps.Map(container, options);
		var marker = new kakao.maps.Marker({
			position : map.getCenter(),
			map : map
		});
	</script>

</body>
</html>