
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서평</title>
<link rel="stylesheet" href="css/book_review.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&family=Felipa&family=Orbit&display=swap')
	;
</style>
</head>
<body>
	<!-- 가데이터는 앞에 *(나중에 EL문 등으로 바꿔야 함) -->
		<!------ 베스트 서평 ------>
		<div class="best-gh">
			<div class="today-best-gh">
				<h4 class="best-title-gh">오늘의 베스트 서평</h4>
				<div class="best-box-gh">
					<form action="review.detail">
						<button class="small-book-gh">
							<img src="/img/book.png">
						</button>
					</form>
					<div class="small-profile-gh">
						<img src="/img/daejeon_profile.png">
					</div>
					<h5 class="best-name-gh">*대전공주</h5>
					<h6 class="best-grade-gh">*실버 책벌레</h6>
					<div class="reputation-gh">
						<img class="reputation-img-gh" src="/img/review_like.png">
						<h6 class="reputation-count-gh">*1375</h6>
						<img class="reputation-img-gh" src="/img/review_dislike.png">
						<h6 class="reputation-count-gh">*1375</h6>
					</div>
					<h6 class="best-review-gh">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h6>
				</div>
			</div>

			<div class="weekly-best-gh">
				<h4 class="best-title-gh">이번주 베스트 서평</h4>
				<div class="best-box-gh">
					<form action="review.detail">
						<button class="small-book-gh">
							<img src="/img/book.png">
						</button>
					</form>
					<div class="small-profile-gh">
						<img src="/img/gimpo_profile.jpg">
					</div>
					<h5 class="best-name-gh">*김포공주</h5>
					<h6 class="best-grade-gh">*골드 책벌레</h6>
					<h6 class="best-review-gh">참 좋은 책이에요</h6>
					<div class="reputation-gh">
						<img class="reputation-img-gh" src="/img/review_like.png">
						<h6 class="reputation-count-gh">*1375</h6>
						<img class="reputation-img-gh" src="/img/review_dislike.png">
						<h6 class="reputation-count-gh">*1375</h6>
					</div>
				</div>
			</div>

			<div class="monthly-best-gh">
				<h4 class="best-title-gh">이번달 베스트 서평</h4>
				<div class="best-box-gh">
					<form action="review.detail">
						<button class="small-book-gh">
							<img src="/img/book.png">
						</button>
					</form>
					<div class="small-profile-gh">
						<img src="/img/chicken.png">
					</div>
					<h5 class="best-name-gh">*내꿈은돈많은백수</h5>
					<h6 class="best-grade-gh">*실버 책벌레</h6>
					<h6 class="best-review-gh">참 좋은 책이에요</h6>
					<div class="reputation-gh">
						<img class="reputation-img-gh" src="/img/review_like.png">
						<h6 class="reputation-count-gh">*1375</h6>
						<img class="reputation-img-gh" src="/img/review_dislike.png">
						<h6 class="reputation-count-gh">*1375</h6>
					</div>
				</div>
			</div>
		</div>
</body>
</html>