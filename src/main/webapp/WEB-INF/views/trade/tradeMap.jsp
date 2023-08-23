<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2ec9e96982d203168b7d94dde7b62fe"></script>
<link rel="stylesheet" href="css/trade/tradeMap.css">
</head>

<body>
	<div class="container-map" style="width: 100vw; height: 100vh;">
		<div id="map" style="width: 100%; height: 90%;"></div>
		<div>
			<input type="text"
				style="width: 300px; height: 50px; font-size: 20px;"
				id="inputContent" placeholder="장소에 대한 상세 설명">
			<button onclick="updateInfoWindowContent()"
				style="width: 100px; height: 50px;">업데이트</button>
			<button onclick="regTradeLocation()"
				style="width: 100px; height: 50px;">등록하기</button>
			<button onclick="goBack()" style="width: 100px; height: 50px;">취소하기</button>
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

		var iwContent = '', iwPosition = new kakao.maps.LatLng(33.450701,
				126.570667);

		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 인포윈도우 표시
		infowindow.open(map, marker);

		kakao.maps.event.addListener(marker, 'click', function() {
		});

		kakao.maps.event.addListener(map, 'drag', function() {
			marker.setPosition(map.getCenter());
			infowindow.setPosition(marker.getPosition());
		});

		// 입력 폼의 값을 가져와 인포윈도우 내용을 업데이트하는 함수
		function updateInfoWindowContent() {
			var inputContent = document.getElementById('inputContent').value;
			iwContent = '<div style="padding:5px;">' + inputContent + '</div>';
			infowindow.setContent(iwContent);
		}

		function regTradeLocation() {
			var markerPosition = marker.getPosition();
			var latitude = markerPosition.getLat();
			var longitude = markerPosition.getLng();
			var inputContent = document.getElementById('inputContent').value;

			// URL 생성 및 쿼리 파라미터 추가
			var nextPageUrl = '/trade.reg.go' 
			+ '?maplatitude=' + latitude
			+ '&maplongitude=' + longitude 
			+ '&markerlatitude=' + latitude 
			+ '&markerlongitude=' + longitude;

			// 다음 페이지로 이동
			window.location.href = nextPageUrl;
		}
		//취소 버튼
		function goBack() {
			window.history.back();
		}
	</script>
</body>

<script type="text/javascript" src="js/map.jsp"></script>
</html>