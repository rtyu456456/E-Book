<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/infoReg.css">
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
					<input placeholder="글 제목" name="t_title">
				</div>

				<c:choose>
					<c:when test="${param.title == null}">
						<div class="input-group">
							<input placeholder="책 이름" name="t_book_title">
						</div>
						<div class="input-group">
							<input placeholder="저자" name="t_authors">
						</div>
						<div class="input-group">
							<input placeholder="출판사" name="t_publisher">
						</div>
						<div class="input-group">
							<input placeholder="판매가" name="t_price">
						</div>
					</c:when>
					<c:otherwise>
						<div class="input-group2">
							<input value="${param.title }" name="t_book_title" readonly>
						</div>
						<div class="input-group2">
							<input value="${param.authors }" name="t_authors" readonly>
						</div>
						<div class="input-group2">
							<input value="${param.publisher }" name="t_publisher" readonly>
						</div>
						<div class="input-group2">
							<input value="${param.price }" name="price" readonly>
						</div>
						<div class="input-group">
							<input placeholder="판매가" name="t_price">
						</div>
					</c:otherwise>

				</c:choose>

				<div class="input-group">
					<input type="file" name="t_file">
				</div>
				<div class="input-group">
					<textarea rows="8" cols="2" placeholder="도서 상태 정보" name="t_content"></textarea>
				</div>
				<div class="input-group">
					<a href="trade.map.go">희망 장소 선택하기</a> <span>${param.inputContent }</span>
					<input type="hidden" value="${param.latitude }" name="t_map_lat">
					<input type="hidden" value="${param.longitude }" name="t_map_lng">
					<input type="hidden" value="${param.inputContent }" name="t_marker_name">
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