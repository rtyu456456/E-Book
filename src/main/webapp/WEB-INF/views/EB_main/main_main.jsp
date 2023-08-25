<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

	<!------ 화제의 도서 ------>
	<div class="issue-book">
		<div class="issue-book-box">
			<h4 class="issue-title-gh">✧  서평을 부르는 화제의 도서  ✧</h4>
			<div>
				<form action="book.detail">
					<input hidden="hidden" name="b_no" value="${hotBooks.b_no }">
					<button class="small-book-gh">
						<img src="${hotBooks.b_thumbnail }">
					</button>
				</form>
				<form action="book.detail?b_no=${hotBooks.b_no }">
					<button class="small-book-gh">
						<img src="/img/book.png">
					</button>
				</form>
				<form action="book.detail?b_no=${hotBooks.b_no }">
					<button class="small-book-gh">
						<img src="/img/book.png">
					</button>
				</form>
			</div>
		</div>
	</div>

	<!------ 추천 도서 ------->
	<div class="popular-book">
		<div class="popular-box">
			<h4 class="popular-title-gh">✧  많은 사람들이 좋아한 인기 도서  ✧</h4>
			<div>
				<!-- <form action="book.detail"> -->
				<button class="small-book-gh">
					<img src="/img/book.png">
				</button>
				<!-- </form> -->
				<!-- <form action="book.detail"> -->
				<button class="small-book-gh">
					<img src="/img/book.png">
				</button>
				<!-- </form> -->
				<!-- <form action="book.detail"> -->
				<button class="small-book-gh">
					<img src="/img/book.png">
				</button>
				<!-- </form> -->
			</div>
		</div>
	</div>


	<!------ 베스트 서평 ------>
	<div class="best-gh">
		<div class="today-best-gh">
			<h4 class="best-title-gh">오늘의 베스트 서평  🖉</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<!-- <form action="book.detail"> -->
					<button class="small-book-gh">
						<img src="${dailyBook.b_thumbnail }">
					</button>
					<!-- </form> -->
					<div class="best-review-info2">
						<div class="best-review-profile">
							<div class="small-profile-gh">
								<img src="/img/${dailyUser.u_profile }">
							</div>
							<div class="best-review-user">
								<h5>
									${dailyBest.r_owner }<span>${dailyUser.u_achievement }</span>
								</h5>
							</div>
						</div>
						<h5 class="best-book-title">${dailyBook.b_title}</h5>
						<h6 class="best-book-author">${dailyBook.b_authors}</h6>
						<div class="recommend-radio-gh">
							추천<input type="radio" name="bestRadio" value="recommend">
							비추천<input type="radio" name="bestRadio" value="notRecommend">
						</div>
					</div>
				</div>
				<h6 class="best-date-gh">
					<fmt:formatDate value="${dailyBest.r_date }"
						pattern="yyyy-MM-dd / HH:mm" />
				</h6>
				<div class="reputation-gh">
					<input class="like-no" hidden value="${r.r_no }"> <input
						hidden class="like-type" value="REVIEW">
					<button class="reviewLikeBtn like-dislike" value="1">
						<img class="reviewLikeImg like-dislike-img"
							src="/img/review_like.png"> <span class="reviewLikeCnt"><fmt:formatNumber
								value="${dailyBest.r_like }" pattern="#,###" /> </span>
					</button>
					<button class="reviewDislikeBtn like-dislike" value="2">
						<img class="reviewDislikeImg like-dislike-img"
							src="/img/review_dislike.png"> <span
							class="reviewDislikeCnt"> <fmt:formatNumber
								value="${dailyBest.r_dislike }" pattern="#,###" />
						</span>
					</button>
				</div>

				<h6 class="best-review-gh">${dailyBest.r_contents }</h6>
			</div>
		</div>
		<div class="weekly-best-gh">
			<h4 class="best-title-gh">이번주 베스트 서평  🖉</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<!-- <form action="book.detail"> -->
					<button class="small-book-gh">
						<img src="${weeklyBook.b_thumbnail }">
					</button>
					<!-- </form> -->
					<div class="best-review-info2">
						<div class="best-review-profile">
							<div class="small-profile-gh">
								<img src="/img/${weeklyUser.u_profile }">
							</div>
							<div class="best-review-user">
								<h5>
									${weeklyBest.r_owner }<span>${weeklyUser.u_achievement }</span>
								</h5>
							</div>
						</div>
						<h5 class="best-book-title">${weeklyBook.b_title}</h5>
						<h6 class="best-book-author">${weeklyBook.b_authors}</h6>
						<div class="recommend-radio-gh">
							추천<input type="radio" name="bestRadio" value="recommend">
							비추천<input type="radio" name="bestRadio" value="notRecommend">
						</div>
					</div>
				</div>
				<h6 class="best-date-gh">
					<fmt:formatDate value="${weeklyBest.r_date }"
						pattern="yyyy-MM-dd / HH:mm" />
				</h6>
				<div class="reputation-gh">
					<input class="like-no" hidden value="${r.r_no }"> <input
						hidden class="like-type" value="REVIEW">
					<button class="reviewLikeBtn like-dislike" value="1">
						<img class="reviewLikeImg like-dislike-img"
							src="/img/review_like.png"> <span class="reviewLikeCnt">
							<fmt:formatNumber value="${weeklyBest.r_like }" pattern="#,###" />
						</span>
					</button>
					<button class="reviewDislikeBtn like-dislike" value="2">
						<img class="reviewDislikeImg like-dislike-img"
							src="/img/review_dislike.png"> <span
							class="reviewDislikeCnt"> <fmt:formatNumber
								value="${weeklyBest.r_dislike }" pattern="#,###" />
						</span>
					</button>
				</div>

				<h6 class="best-review-gh">${weeklyBest.r_contents }</h6>
			</div>
		</div>

		<div class="monthly-best-gh">
			<h4 class="best-title-gh">이번달 베스트 서평  🖉</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<%-- <form action="book.detail?b_no=${montlyBook.b_no }"> --%>
					<button class="small-book-gh">
						<img src="${monthlyBook.b_thumbnail }">
					</button>
					</form>
					<div class="best-review-info2">
						<div class="best-review-profile">
							<div class="small-profile-gh">
								<img src="/img/${monthlyUser.u_profile }">
							</div>
							<div class="best-review-user">
								<h5>
									${monthlyBest.r_owner }<span>${monthlyUser.u_achievement }</span>
								</h5>
							</div>
						</div>
						<h5 class="best-book-title">${monthlyBook.b_title}</h5>
						<h6 class="best-book-author">${monthlyBook.b_authors}</h6>
						<div class="recommend-radio-gh">
							추천 <input type="radio" name="bestRadio" value="recommend">
							<label for="recommend"></label> 비추천 <input type="radio"
								name="bestRadio" value="notRecommend"> <label
								for="notRecommend"></label>
						</div>
					</div>
				</div>
				<h6 class="best-date-gh">
					<fmt:formatDate value="${monthlyBest.r_date }"
						pattern="yyyy-MM-dd / HH:mm" />
				</h6>
				<div class="reputation-gh">
					<input class="like-no" hidden value="${r.r_no }"> <input
						hidden class="like-type" value="REVIEW">
					<button class="reviewLikeBtn like-dislike" value="1">
						<img class="reviewLikeImg like-dislike-img"
							src="/img/review_like.png"> <span class="reviewLikeCnt">
							<fmt:formatNumber value="${monthlyBest.r_like }" pattern="#,###" />
						</span>
					</button>
					<button class="reviewDislikeBtn like-dislike" value="2">
						<img class="reviewDislikeImg like-dislike-img"
							src="/img/review_dislike.png"> <span
							class="reviewDislikeCnt"><fmt:formatNumber
								value="${monthlyBest.r_dislike }" pattern="#,###" /> </span>
					</button>
				</div>

				<h6 class="best-review-gh">${monthlyBest.r_contents }</h6>
			</div>
		</div>
	</div>
</body>
</html>