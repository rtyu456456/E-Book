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
				<img alt="" src="/img/menutab.png">
					<h1 onclick="location.href='/trade.go'">책방</h1>
				<div>
					<img alt="" src="/img/PageUpLog.png">
					<table id="loginSuccessTable">
						<tr>
							<td style="height: 20px;">${sessionScope.loginMember.u_id }</td>
						</tr>
						<tr>
							<td align="right" valign="top">(${sessionScope.loginMember.u_name })</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button onclick="logout()">로그아웃</button>
							</td>
						<tr>
					</table>
				</div>
			</div>



		</header>


		<main class="content-page">
			<jsp:include page="${contentPage }" />
		</main>


		<footer>
			<div class="foot-line">
				<a href="/trade.choose.go"> <img src="/img/Group7.png">
				</a> <a href="javascript:void(0);" onclick="goToSaleNow()"> <img
					src="/img/Group6.png">
				</a> <a href="javascript:void(0);" onclick="goToTradeMsg()"> <img
					src="/img/Group5.png">
				</a>
			</div>
		</footer>

		<script>
			function goToSaleNow() {
				var u_id = '<c:out value="${sessionScope.loginMember.u_id}" />';
				if (u_id) {
					window.location.href = '/trade.sale.now?u_id=' + u_id;
				} else {
					// 여기에 로그인이 필요한 경고 메시지나 다른 처리를 추가할 수 있습니다.
					alert('로그인이 필요합니다.');
				}
			}
			function goToTradeMsg() {
				var u_id = '<c:out value="${sessionScope.loginMember.u_id}" />';
				if (u_id) {
					window.location.href = '/trade.Msg.go'; // 로그인이 필요한 페이지로 이동
				} else {
					alert('로그인이 필요합니다.');
				}
			}
		</script>

	</div>
</body>
</html>