<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/community/communityMainPage.js"></script>
<link rel="stylesheet" href="css/community/community_main_page.css">
<link rel="stylesheet" href="css/community/community_board_page.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&family=Felipa&family=Orbit&display=swap')
	;
</style>

<!--타이틀 한국어글꼴 	font-family: 'Diphylleia', serif;  -->
<!--타이틀 영어글꼴 		font-family: 'Felipa', cursive; -->
<!--그외 한글 글꼴		font-family: 'Orbit', sans-serif; -->

</head>
<body>
	<div class="commu_container">
		<div class="commu_header">
			<button class="menu_btn">
				<img src="/img/menu_icon.png">
			</button>
			<span id="community_txt">커뮤니티</span>
			<div class="login_box">
				<div class="padding">
					<img class="login_img" alt="" src="/img/user_img.jpg">
				</div>
				<div class="padding">
					<div class="login_name">유저닉네임</div>
					<div class="login_grade">유저등급</div>
					<div class="login_btn">
						<button class="alam_btn">
							<img alt="" src="/img/alarm.png">
						</button>
						<button class="logout_btn">로그아웃</button>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="${community_page }"></jsp:include>
	</div>
</body>
</html>