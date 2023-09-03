<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/review/reviewQuery.js"></script>


<link rel="stylesheet" href="css/main/main_index.css">
<link rel="stylesheet" href="css/main/main_main.css">
<link rel="stylesheet" href="css/main/main_search.css">
<link rel="stylesheet" href="css/main/main_detail.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap')
	;
</style>
</head>
<body>
	<!-- 가데이터는 앞에 *(나중에 EL문 등으로 바꿔야 함) -->
	<div class="main-container-gh">
		<!------ 맨 위 ------>
		<div class="main-top-gh">
			<button class="menu-gh">
				<img src="/img/menuIcon.png">
			</button>
			<form action="main">
				<button class="title-gh">
					<img src="/img/pageup_logo.png">
				</button>
			</form>
			<img class="logo-gh" id="logoGH" src="/img/logo_icon.png">
			<div class="profile-img-gh">
				<!-- a 태그 달아서 마이페이지 가게 하기 -->
				<img src="${sessionScope.user.u_profile }">
			</div>
		</div>
		<input hidden value="${sessionScope.user.u_profile }">
		<!------ 검색창 ------>
		<form class="main-search-gh" action="main.search">
			<select class="main-select" name="searchOption">
				<option value="b_title">제목</option>
				<option value="b_authors">작가</option>
			</select>
			<div class="search-box-gh">
				<input class="input-gh" name="searchText" placeholder="검색어를 입력하세요">
				<button class="search-btn-gh">
					<img src="/img/seachBtn.png">
				</button>
			</div>
		</form>
		<div class="main-contents-gh">
			<jsp:include page="${contentPage }"></jsp:include>
		</div>
	</div>
	<!------- 메뉴 -------->
	<dialog id="menu-dialog">
	<div class="side-menu-gh">
		<button class="menu-title-gh" onclick="location.href='main'">
			<img src="/img/pageup_logo.png">
		</button>
		<button class="menu-close-gh">
			<img src="/img/x_icon.png">
		</button>
		<div class="menu-list-box">
			<div class="menu-list-gh">
				<img src="/imgs/my_page_txt.png">
				<!-- onclick="location.href='user_main'" -->
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
	</dialog>


</body>
</html>