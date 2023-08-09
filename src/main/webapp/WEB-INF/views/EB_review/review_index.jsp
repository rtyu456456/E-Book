<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/book_review.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&family=Felipa&family=Orbit&display=swap')
	;
</style>
</head>
<body>
	<!-- 가데이터는 앞에 *(나중에 EL문 등으로 바꿔야 함) -->
	<div class="review-container-gh">
		<!------ 맨 위 ------>
		<div class="top-gh">
			<!-- 메뉴창 나오는 기능 해야함 -->
			<button class="menu-gh">
				<img src="/img/menuIcon.png">
			</button>
			<!---------------------->
			<div class="title-gh">서평</div>
			<div class="account-gh">
				<div class="profile-img-gh">
					<!-- a 태그 달아서 마이페이지 가게 하기 -->
					<img src="/img/daejeon_profile.png">
				</div>
				<div class="user-gh">
					<!-- a 태그 달아서 마이페이지 가게 하기 -->
					<h5 class="name-gh">*대전공주</h5>
					<h6 class="grade-gh">등급: *실버 책벌레</h6>
					<!-- 로그아웃 되게 하기 -->
					<button class="logout-gh">로그아웃</button>
				</div>
			</div>
		</div>
		<div class="review-contents-gh">
			<jsp:include page="${contentPage }"></jsp:include>
		</div>
	</div>


</body>
</html>