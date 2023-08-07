<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale =1.0, user-scalable = no , target-densitydpi=device-dpi">
<meta name="format-detection" content="telephone=no">

<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/tradeIndex.css">

</head>
<body>

<div class="container">
	<header>
		<div class="head-line">
			<h1>책방</h1>
			<div class="user-info">
				<img src="">
				<div class="user-info2">
					<div class="user-info-nickname">닉네임</div>
					<div class="user-info-grade">등급 :</div>
					<div class="logout-btn">로그아웃</div>
				</div>
			</div>
		</div>
	</header>


	<main class="content-page">
			<jsp:include page="${contentPage }"></jsp:include>
	</main>


	<footer>
		<div class="foot-line">
			<a href="/trade.choose.go"> <img alt="" src="/img/Rectangle_107.png"> <span> 판매하기 </span></a> 
			<a href=""> <img alt="" src="/img/Rectangle_108.png">  <span> 판매 내역 </span></a> 
			<a href=""> <img alt="" src="/img/Rectangle_109.png">  <span> 쪽지함 </span></a>
		</div>
	</footer>
</div>	
</body>
</html>