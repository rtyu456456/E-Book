<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/book_review.css">
<style>
  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap');
</style>
</head>
<body>
	<!-- 가데이터는 앞에 *(나중에 EL문 등으로 바꿔야 함) -->
	<div class="review-container-gh">
		<!------ 맨 위 ------>
		<div class="review-top-gh">
			<!-- 메뉴창 나오는 기능 해야함 -->
			<button class="menu-gh">
				<img src="/img/menuIcon.png">
			</button>
			<!---------------------->
			<div class="title-gh"><a href="review">서평</a></div>
			<div class="profile-img-gh">
				<!-- a 태그 달아서 마이페이지 가게 하기 -->
				<img src="/img/daejeon_profile.png">
			</div>
		</div>
		<div class="review-contents-gh">
			<jsp:include page="${contentPage }"></jsp:include>
		</div>
	</div>


</body>
</html>