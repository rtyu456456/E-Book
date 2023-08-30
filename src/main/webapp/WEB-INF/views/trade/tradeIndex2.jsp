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
					<a> <img src="/img/backspace.png" ></a> <h1>판매 내역</h1>
				<div>
					<table id="loginSuccessTable">
					</table>
				</div>
			</div>



		</header>


		<main class="content-page">
			<jsp:include page="${contentPage }" />
		</main>


		<footer>
			<div class="foot-line">
				<a href="/trade.choose.go"> <img src="/img/Group7.png"></a>
				<a href="/trade.sale.now?u_id=${sessionScope.loginMember.u_id}"> <img src="/img/Group6.png"></a>
				<a href="/trade.Msg.get.to?u_id=${sessionScope.loginMember.u_id}"> <img src="/img/Group5.png"></a>
				
				
			</div>
		</footer>
	</div>
</body>
</html>