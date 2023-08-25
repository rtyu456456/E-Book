<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/infoReg.css">
<script type="text/javascript" >
	//페이지 로드 시에 Local Storage에서 입력 값을 읽어와서 적용하는 함수
	function loadInputsFromLocalStorage() {
		const t_title = localStorage.getItem('t_title');
		const t_book_title = localStorage.getItem('t_book_title');
		const t_authors = localStorage.getItem('t_authors');
		const t_publisher = localStorage.getItem('t_publisher');
		const t_price = localStorage.getItem('t_price');

		document.getElementsByName('t_title')[0].value = t_title;
		document.getElementsByName('t_book_title')[0].value = t_book_title;
		document.getElementsByName('t_authors')[0].value = t_authors;
		document.getElementsByName('t_publisher')[0].value = t_publisher;
		document.getElementsByName('t_price')[0].value = t_price;
	}

	// 페이지 로드 시에 Local Storage에서 값 불러오기
	window.onload = function() {
		loadInputsFromLocalStorage();
	}
</script>


</head>
<body>
	<div class="container-reg">
		<div class="reginfo">
			<br>
			<form action="reg.trade.book" method="post"
				enctype="multipart/form-data" id="regForm">
				<br>
				<div class="book-info-reg">책 정보를 입력해 주세요</div>
				<br> <input type="hidden"
					value="${sessionScope.loginMember.u_id }" name="t_owner">
				<div class="input-group">
					<input value="${trade.t_title }" name="t_title">
				</div>

				<div class="input-group">
				<input value="${trade.t_book_title }" name="t_book_title" >
				</div>
				<div class="input-group">
					<input value="${trade.t_authors }" name="t_authors">
				</div>
				<div class="input-group">
					<input value="${trade.t_publisher }" name="t_publisher">
				</div>
				<div class="input-group">
					<input value="${trade.t_price }" name="t_price">
				</div>

				<div class="input-group">
					<input type="file" value="${param.trade.t_thumbnail }" name="t_file">
				</div>
				<div class="input-group">
					<textarea rows="8" cols="2" value="${trade.t_contents }" name="t_contents"></textarea>
				</div>
				<div class="input-group">
					<a href="trade.map.go">희망 장소 선택하기</a> <span>${trade.t_marker_name }</span>
					<input type="hidden" value="${trade.t_map_lat }" name="t_map_lat">
					<input type="hidden" value="${trade.t_map_lng }" name="t_map_lng">
					<input type="hidden" value="${trade.t_marker_name }" name="t_marker_name">
				</div>
				<div class="reg-btn">
					<button>등록하기</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		var container = document.getElementById('map');
		var divElement = document.querySelector('.input-group');
		var latitude = divElement.getAttribute('data-latitude');
		var longitude = divElement.getAttribute('data-longitude');
		var options = {
			center : new kakao.maps.LatLng(latitude, longitude),
			level : 1
		};
	</script>


</body>
</html>