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
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/trade/tradeIndex.css">
</head>
<body>
	<div class="container">
		<header>
			<div class="head-line">
				<a class="menu-gh"><img alt="" src="/img/menutab.png"></a>
				<h1
					onclick="location.href='/trade.go?u_id=${sessionScope.user.u_id }'">책방</h1>
				<div>
					<img alt="" src="/img/PageUpLog.png">
					<div class="login-profile">
						<img alt="" src="${sessionScope.user.u_profile }">
					</div>

					<!-- 					<table id="loginSuccessTable"> -->
					<!-- 							<tr> -->
					<!-- 							</tr> -->

					<!-- 						<tr> -->
					<%-- 							<td style="height: 20px;">${sessionScope.user.u_id }</td> --%>
					<!-- 						</tr> -->
					<!-- 						<tr> -->
					<%-- 							<td align="right" valign="top">(${sessionScope.user.u_name })</td> --%>
					<!-- 						</tr> -->
					<!-- 						<tr> -->
					<!-- 							<td colspan="2" align="center"> -->
					<!-- 								<button onclick="logout()">로그아웃</button> -->
					<!-- 							</td> -->
					<!-- 						<tr> -->
					<!-- 					</table> -->
				</div>
			</div>

			<!------- 사이드 메뉴창 JSP -------->
			<dialog id="menu-dialog"> <!-- <div class="menu-screen"></div> -->
			<form method="dialog">
				<div class="side-menu-gh">
					<div class="menu-head-gh">
						<button class="menu-title-gh" onclick="location.href='main'">
							<img src="/img/pageup_logo.png">
						</button>
						<button class="menu-close-gh">
							<img src="/img/x_icon.png">
						</button>
					</div>
					<div class="menu-list-box">
						<div class="menu-list-gh">
							<img src="/imgs/my_page_txt.png">
							<!-- 							onclick="location.href='user_main'"> -->
							<h4 onclick="location.href='usermain'">내 정보</h4>
							<h4 onclick="location.href='bookRecord.fin'">읽은 책</h4>
							<h4 onclick="location.href='bookRecord.ing'">읽고 있는 책</h4>
							<h4 onclick="location.href='bookRecord.wish'">읽고 싶은 책</h4>
						</div>

						<div class="menu-list-gh">
							<h2 onclick="location.href='community_main'">커뮤니티</h2>
							<h4
								onclick="location.href='go.my.post?cp_owner=${sessionScope.user.u_id }'">내가
								쓴 글</h4>
							<h4
								onclick="location.href='go.my.reply?cr_owner=${sessionScope.user.u_id }'">댓글
								단 글</h4>
						</div>

						<div class="menu-list-gh">
							<h2 onclick="location.href='trade.go'">
								책방<span>중고거래</span>
							</h2>
							<h4 onclick="location.href='trade.choose.go'">판매하기</h4>
							<h4 onclick="location.href='trade.sale.now	'">판매 내역</h4>
							<h4 onclick="location.href='trade.Msg.get.to'">쪽지함</h4>
						</div>
						<div class="menu-list-gh">

							<h4 onclick="location.href='logout.go'">로그아웃</h4>
						</div>
					</div>
				</div>
			</form>
			</dialog>
		</header>


		<main class="content-page">
			<jsp:include page="${contentPage }" />
		</main>


		<footer>
			<div class="foot-line">
				<a href="/trade.choose.go"> <img src="/img/Group7.png">
				</a> <a href="/trade.sale.now?u_id=${sessionScope.user.u_id}"> <img
					src="/img/Group6.png"></a> <a
					href="/trade.Msg.get.to?u_id=${sessionScope.user.u_id}"> <img
					src="/img/Group5.png"></a>
			</div>
		</footer>
	</div>


	<script>
		$(function() {
			let menu = document.querySelector('.menu-gh img');
			let dialog = document.querySelector('#menu-dialog');
			menu.addEventListener('click', function(event) {
				console.log(111);
				dialog.showModal();
			})
		});
	</script>

</body>
</html>