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
			<button class="menu-gh">
				<img src="/img/menuIcon.png">
			</button>
			<div class="title-gh">서평</div>
			<div class="account-gh">
				<div class="profile-img-gh">
					<img src="/img/daejeon_profile.png">
				</div>
				<div class="user-gh">
					<h5 class="name-gh">*대전공주</h5>
					<h6 class="grade-gh">등급: *실버 책벌레</h6>
					<button class="logout-gh">로그아웃</button>
				</div>
			</div>
		</div>

		<!------ 검색창 ------>
		<div class="review-contents-gh">
			<div class="search-gh">
				<select class="option-gh">
					<option>제목
					<option>저자
				</select>
				<div class="search-box-gh">
					<input class="input-gh" placeholder="책을 검색해보세요">
					<button class="search-btn-gh">
						<img src="/img/seachBtn.png">
					</button>
				</div>
				<form action="review.write">
					<button class="write-btn-gh">
						서평<br>쓰기
					</button>
				</form>
			</div>

			<!------ 베스트 서평 ------>
			<div class="best-gh">
				<div class="today-best-gh">
					<h4 class="best-title-gh">오늘의 베스트 서평</h4>
					<div class="best-box-gh">
						<a href="review.detail"><img class="small-book-gh" src="/img/book.png"></a>
						<div class="small-profile-gh">
							<img src="/img/daejeon_profile.png">
						</div>
						<h5 class="best-name-gh">*대전공주</h5>
						<h6 class="best-grade-gh">*실버 책벌레</h6>
						<h6 class="best-review-gh">참 좋은 책이에요</h6>
						<div class="recommend-gh">
							<img class="recommend-img-gh" src="/img/recommend_smile.png">
							<h6 class="recommend-count-gh">*1375</h6>
						</div>
					</div>
				</div>

				<div class="weekly-best-gh">
					<h4 class="best-title-gh">이번주 베스트 서평</h4>
					<div class="best-box-gh">
						<a href="review.detail"><img class="small-book-gh" src="/img/book.png"></a>
						<div class="small-profile-gh">
							<img src="/img/gimpo_profile.jpg">
						</div>
						<h5 class="best-name-gh">*김포공주</h5>
						<h6 class="best-grade-gh">*골드 책벌레</h6>
						<h6 class="best-review-gh">참 좋은 책이에요</h6>
						<div class="recommend-gh">
							<img class="recommend-img-gh" src="/img/recommend_smile.png">
							<h6 class="recommend-count-gh">*3035</h6>
						</div>
					</div>
				</div>

				<div class="monthly-best-gh">
					<h4 class="best-title-gh">이번달 베스트 서평</h4>
					<div class="best-box-gh">
					<a href="review.detail"><img class="small-book-gh" src="/img/book.png"></a>
						<div class="small-profile-gh">
							<img src="/img/chicken.png">
						</div>
						<h5 class="best-name-gh">*내꿈은돈많은백수</h5>
						<h6 class="best-grade-gh">*실버 책벌레</h6>
						<h6 class="best-review-gh">참 좋은 책이에요</h6>
						<div class="recommend-gh">
							<img class="recommend-img-gh" src="/img/recommend_smile.png">
							<h6 class="recommend-count-gh">*5640</h6>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>