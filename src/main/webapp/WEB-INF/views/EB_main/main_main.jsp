
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
				<div class="best-review-info">
					<form action="book.detail">
						<button class="small-book-gh">
							<img src="/img/book.png">
						</button>
					</form>
					<div class="best-review-info2">
						<div class="best-review-profile">
							<div class="small-profile-gh">
								<img src="/img/daejeon_profile.png">
							</div>
							<div class="best-review-user">
								<h5>
									*대전공주<span>*실버 책벌레</span>
								</h5>
							</div>
						</div>
						<h5 class="best-book-title">*미움받을 용기</h5>
						<h6 class="best-book-author">*작가명</h6>
						<div class="recommend-radio-gh">
							추천<input type="radio" name="bestRadio" value="recommend">
							비추천<input type="radio" name="bestRadio" value="notRecommend">
						</div>
					</div>
				</div>
				<div class="reputation-gh">
					<input class="like-no" hidden value="${r.r_no }"> <input
						hidden class="like-type" value="REVIEW">
					<button class="reviewLikeBtn like-dislike" value="1">
						<img class="reviewLikeImg like-dislike-img"
							src="/img/review_like.png"> <span class="reviewLikeCnt">
							<%-- <fmt:formatNumber
										value="${r.r_like }" pattern="#,###" /> --%>1,234
						</span>
					</button>
					<button class="reviewDislikeBtn like-dislike" value="2">
						<img class="reviewDislikeImg like-dislike-img"
							src="/img/review_dislike.png"> <span
							class="reviewDislikeCnt"> <%-- <fmt:formatNumber
										value="${r.r_dislike }" pattern="#,###" /> --%>1,234
						</span>
					</button>
				</div>

				<h6 class="best-review-gh">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h6>
			</div>
		</div>
		<div class="weekly-best-gh">
			<h4 class="best-title-gh">이번주 베스트 서평</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<form action="book.detail">
						<button class="small-book-gh">
							<img src="/img/book.png">
						</button>
					</form>
					<div class="best-review-info2">
						<div class="best-review-profile">
							<div class="small-profile-gh">
								<img src="/img/daejeon_profile.png">
							</div>
							<div class="best-review-user">
								<h5>
									*대전공주<span>*실버 책벌레</span>
								</h5>
							</div>
						</div>
						<h5 class="best-book-title">*미움받을 용기</h5>
						<h6 class="best-book-author">*작가명</h6>
						<div class="recommend-radio-gh">
							추천<input type="radio" name="bestRadio" value="recommend">
							비추천<input type="radio" name="bestRadio" value="notRecommend">
						</div>
					</div>
				</div>
				<div class="reputation-gh">
					<input class="like-no" hidden value="${r.r_no }"> <input
						hidden class="like-type" value="REVIEW">
					<button class="reviewLikeBtn like-dislike" value="1">
						<img class="reviewLikeImg like-dislike-img"
							src="/img/review_like.png"> <span class="reviewLikeCnt">
							<%-- <fmt:formatNumber
										value="${r.r_like }" pattern="#,###" /> --%>1,234
						</span>
					</button>
					<button class="reviewDislikeBtn like-dislike" value="2">
						<img class="reviewDislikeImg like-dislike-img"
							src="/img/review_dislike.png"> <span
							class="reviewDislikeCnt"> <%-- <fmt:formatNumber
										value="${r.r_dislike }" pattern="#,###" /> --%>1,234
						</span>
					</button>
				</div>

				<h6 class="best-review-gh">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h6>
			</div>
		</div>

		<div class="monthly-best-gh">
			<h4 class="best-title-gh">이번달 베스트 서평</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<form action="book.detail">
						<button class="small-book-gh">
							<img src="/img/book.png">
						</button>
					</form>
					<div class="best-review-info2">
						<div class="best-review-profile">
							<div class="small-profile-gh">
								<img src="/img/daejeon_profile.png">
							</div>
							<div class="best-review-user">
								<h5>
									*대전공주<span>*실버 책벌레</span>
								</h5>
							</div>
						</div>
						<h5 class="best-book-title">*미움받을 용기</h5>
						<h6 class="best-book-author">*작가명</h6>
						<div class="recommend-radio-gh">
							추천<input type="radio" name="bestRadio" value="recommend">
							비추천<input type="radio" name="bestRadio" value="notRecommend">
						</div>
					</div>
				</div>
				<div class="reputation-gh">
					<input class="like-no" hidden value="${r.r_no }"> <input
						hidden class="like-type" value="REVIEW">
					<button class="reviewLikeBtn like-dislike" value="1">
						<img class="reviewLikeImg like-dislike-img"
							src="/img/review_like.png"> <span class="reviewLikeCnt">
							<%-- <fmt:formatNumber
										value="${r.r_like }" pattern="#,###" /> --%>1,234
						</span>
					</button>
					<button class="reviewDislikeBtn like-dislike" value="2">
						<img class="reviewDislikeImg like-dislike-img"
							src="/img/review_dislike.png"> <span
							class="reviewDislikeCnt"> <%-- <fmt:formatNumber
										value="${r.r_dislike }" pattern="#,###" /> --%>1,234
						</span>
					</button>
				</div>

				<h6 class="best-review-gh">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h6>
			</div>
		</div>
	</div>
</body>
</html>