<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<!-- 가데이터는 앞에 *(나중에 EL문 등으로 바꿔야 함) -->
	<div class="main-container-gh">
		<!------ 맨 위 ------>
		<div class="main-top-gh">
			<!-- 메뉴창 나오는 기능 해야함 -->
			<button class="menu-gh">
				<img src="/img/menuIcon.png">
			</button>
			<!---------------------->
			<form action="main">
				<button class="title-gh">
					<img src="/img/pageup_logo.png">
				</button>
			</form>
			<div class="profile-img-gh">
				<!-- a 태그 달아서 마이페이지 가게 하기 -->
				<img src="/img/daejeon_profile.png">
			</div>
		</div>
		<!------ 검색창 ------>
		<div class="main-contents-gh">
			<div class="search-gh">
				<div class="search-box-gh">
					<input class="input-gh" placeholder="책 또는 작가명을 검색해보세요">
					<form action="review.search">
						<button class="search-btn-gh">
							<img src="/img/seachBtn.png">
						</button>
					</form>
				</div>
				<div class="main-contents-gh">
					<jsp:include page="${contentPage }"></jsp:include>
				</div>
			</div>
		</div>
</body>
</html>