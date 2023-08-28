<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서평</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&family=Felipa&family=Orbit&display=swap')
	;
</style>
</head>
<body>
	<!-- 가데이터는 앞에 *(나중에 EL문 등으로 바꿔야 함) -->
	<div class="card-content">
		<img
			src="https://images.unsplash.com/photo-1647773319917-f9a98647f6b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
			alt="바다 사진" class="card-content-img" />
		<h1 class="card-header">제목1</h1>
		<p class="card-description">Lorem ipsum dolor sit amet consectetur
			adipisicing elit. Reiciendis esse fugit nihil earum aut nobis,
			praesentium illum expedita quia, mollitia possimus sed, numquam et
			velit aspernatur tenetur vero doloremque ipsum! Lorem ipsum dolor sit
			amet consectetur adipisicing elit. Libero corporis sunt suscipit
			beatae rerum exercitationem aliquam architecto? Aspernatur ex in cum
			suscipit iusto repudiandae dolores hic, rerum, quae voluptatem
			quidem.</p>
		<!-- 추가 되는 부분 -->
		<input type="checkbox" class="card-content__more-btn">
	</div>





	<!------ 나이대별 추천도서 ------>
	<div class="age-book">
		<div class="age-book-box">
			<h4 class="age-title-gh">✧ ~대 ~이 좋아한 도서 ✧</h4>
			<div>
				<%-- <c:forEach var="" items=""> --%>
				<button class="small-book-gh"
					onclick="location.href='book.detail?b_no='">
					<img src="/img/book.png">
				</button>
				<%-- </c:forEach> --%>
				<button class="small-book-gh"
					onclick="location.href='book.detail?b_no='">
					<img src="/img/book.png">
				</button>
				<button class="small-book-gh"
					onclick="location.href='book.detail?b_no='">
					<img src="/img/book.png">
				</button>
			</div>
		</div>
	</div>

	<!------ 최근 인기 도서 ------->
	<div class="popular-book">
		<div class="popular-box">
			<h4 class="popular-title-gh">✧ 최근 인기 도서 ✧</h4>
			<div>
				<c:forEach var="hb" items="${hotBooks}">
					<button class="small-book-gh"
						onclick="location.href='book.detail?b_no=${hb.b_no }'">
						<img src="${hb.b_thumbnail }">
					</button>
				</c:forEach>
			</div>
		</div>
	</div>

	<!------ 베스트 서평 ------>
	<div class="best-gh">
		<div class="today-best-gh">
			<h4 class="best-title-gh">오늘의 베스트 서평 🖉</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<button class="small-book-gh"
						onclick="location.href='book.detail?b_no=${dailyBook.b_no }'">
						<img src="${dailyBook.b_thumbnail }">
					</button>
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
						<h5 class="best-book-title"
							onclick="location.href='book.detail?b_no=${dailyBook.b_no }'">${dailyBook.b_title}</h5>
						<h6 class="best-book-author"
							onclick="location.href='book.detail?b_no=${dailyBook.b_no }'">${dailyBook.b_authors}</h6>
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
				<div class="best-review-gh">
					<h6>${dailyBest.r_contents }</h6>
					<button class="moreReviewBtn">더보기</button>
				</div>
			</div>
		</div>

		<!------ 이번주 ------>
		<div class="weekly-best-gh">
			<h4 class="best-title-gh">이번주 베스트 서평 🖉</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<button class="small-book-gh"
						onclick="location.href='book.detail?b_no=${weeklyBook.b_no }'">
						<img src="${weeklyBook.b_thumbnail }">
					</button>
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
				<div class="best-review-gh">
					<h6>${weeklyBest.r_contents }</h6>
				</div>
			</div>
		</div>
		<!------ 이번달 ------>
		<div class="monthly-best-gh">
			<h4 class="best-title-gh">이번달 베스트 서평 🖉</h4>
			<div class="best-box-gh">
				<div class="best-review-info">
					<button class="small-book-gh"
						onclick="location.href='book.detail?b_no=${monthlyBook.b_no }'">
						<img src="${monthlyBook.b_thumbnail }">
					</button>
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
				<div class="best-review-gh">
					<h6>${monthlyBest.r_contents }</h6>
				</div>
			</div>
		</div>
	</div>
</body>
</html>