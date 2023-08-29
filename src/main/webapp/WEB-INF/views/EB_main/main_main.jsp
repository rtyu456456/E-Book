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
								<h5>${dailyBest.r_owner }</h5>
							</div>
						</div>
						<h5 class="best-book-title"
							onclick="location.href='book.detail?b_no=${dailyBook.b_no }'">${dailyBook.b_title}</h5>
						<h6 class="best-book-author"
							onclick="location.href='book.detail?b_no=${dailyBook.b_no }'">${dailyBook.b_authors}</h6>
						<div class="recommend-radio-gh">
							<c:set var="dailyBest.r_type" value="1" />
							<c:choose>
								<c:when test="${dailyBest.r_type eq 0}">
									<div>선택하지 않음</div>
								</c:when>
								<c:when test="${dailyBest.r_type eq 1}">
									<div>이 책을 추천합니다</div>
								</c:when>
								<c:when test="${dailyBest.r_type eq 2}">
									<div>이 책을 추천하지 않습니다</div>
								</c:when>
								<c:otherwise>
									<div>알 수 없는 값</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<h6 class="best-date-gh">
					<fmt:formatDate value="${dailyBest.r_date }"
						pattern="yyyy-MM-dd / HH:mm" />
				</h6>
				<div class="reputation-gh">
					<input class="like-no" hidden value="${dailyBest.r_no }"> <input
						class="user_id" hidden value="${sessionScope.user.u_id }">
					<input hidden class="like-check" value="${dailyBest.likeCheck}">
					<input hidden class="like-type" value="REVIEW">
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
								<h5>${weeklyBest.r_owner }</h5>
							</div>
						</div>
						<h5 class="best-book-title">${weeklyBook.b_title}</h5>
						<h6 class="best-book-author">${weeklyBook.b_authors}</h6>
						<div class="recommend-radio-gh">
							<c:set var="weeklyBest.r_type" value="1" />
							<c:choose>
								<c:when test="${weeklyBest.r_type eq 0}">
									<div>선택하지 않음</div>
								</c:when>
								<c:when test="${weeklyBest.r_type eq 1}">
									<div>이 책을 추천합니다</div>
								</c:when>
								<c:when test="${weeklyBest.r_type eq 2}">
									<div>이 책을 추천하지 않습니다</div>
								</c:when>
								<c:otherwise>
									<div>알 수 없는 값</div>
								</c:otherwise>
							</c:choose>
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
								<h5>${monthlyBest.r_owner }</h5>
							</div>
						</div>
						<h5 class="best-book-title">${monthlyBook.b_title}</h5>
						<h6 class="best-book-author">${monthlyBook.b_authors}</h6>
						<div class="recommend-radio-gh">
							<c:set var="monthlyBest.r_type" value="1" />
							<c:choose>
								<c:when test="${monthlyBest.r_type eq 0}">
									<div>선택하지 않음</div>
								</c:when>
								<c:when test="${monthlyBest.r_type eq 1}">
									<div>이 책을 추천합니다</div>
								</c:when>
								<c:when test="${monthlyBest.r_type eq 2}">
									<div>이 책을 추천하지 않습니다</div>
								</c:when>
								<c:otherwise>
									<div>알 수 없는 값</div>
								</c:otherwise>
							</c:choose>
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