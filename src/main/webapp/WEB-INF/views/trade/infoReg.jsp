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
			<form action="" method="post" enctype="multipart-form/data">
				<br>
				<div class="book-info-reg">책 정보를 입력해 주세요</div>
				<br>
				<div class="input-group">
					<input placeholder="책 이름">
				</div>
				<div class="input-group">
					<input placeholder="저자">
				</div>
				<div class="input-group">
					<input placeholder="출판사">
				</div>
				<div class="input-group">
					<input placeholder="정가">
				</div>
				<div class="input-group">
					<input placeholder="판매가">
				</div>
				<div class="input-group">
					<input type="file">
				</div>
				<div class="input-group">
					<textarea rows="8" cols="2" placeholder="도서 상태 정보"></textarea>
				</div>

				<div class="input-group">
					<a href="trade.map.go">희망 장소 선택하기</a> <span>${param.inputContent }
					</span>
				</div>
				<div class="reg-btn">
					<button>등록하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>