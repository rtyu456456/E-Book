<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="detail-container-gh">
		<!------- 책 정보 ------->
		<div class="detail-top-gh">
			<input hidden class="like-no" value="${bookSearch.b_no }">
			<input hidden class="like-check-bookmark" value="${bookSearch.bookmarkCheck}">
			<input hidden class="like-type" value="BOOK">
			<input hidden class="user_id" value="${sessionScope.user.u_id }">
			<img class="bookmark-gh" src="/img/logo_bookmark_empty.png">
			<div class="detail-box-gh">
				<img class="book-gh" src=${bookSearch.b_thumbnail }>
				<div class="detail-info-gh">
					<h6 class="detail-title-gh">${bookSearch.b_title }</h6>
					<h6 class="detail-etc-gh">${bookSearch.b_authors.replace("!", ", ") }</h6>
					<h6 class="detail-etc-gh">${bookSearch.b_publisher }</h6>
					<h6 class="detail-etc-gh">${bookSearch.b_page }쪽</h6>
					<h6 class="detail-etc-gh">ISBN: ${bookSearch.b_isbn }</h6>
				</div>
				<br>
			</div>
			<div class="detail-reputation-gh">
				<h6 class="text-gh">전체 독자의</h6>
				<h6>
					<span class="percent-gh">${getPercent1.positive_percentage }%</span>
					<span class="text-gh" style="line-height: -0.5rem;">가 좋아합니다</span>
				</h6>
			</div>
		</div>

		<!------- 책 소개 ------->
		<div class="detail-introduce-gh">
			<h1 class="detail-category-gh">책 소개</h1>
			<div class="introduce-box-gh">
				<h6>${bookSearch.b_contents }</h6>
				<%-- <h6>${bookSearch.b_url }</h6> --%>
			</div>
		</div>

		<!------- 서평 ------->
		<div class="detail-review-gh">
			<div class="review-header">
				<h1 class="detail-category-gh">서평</h1>
				<select id="order-selector">
					<option value="recent">최신순</option>
					<option value="like">좋아요순</option>
				</select>
			</div>
			<div class="detail-review-box">
				<c:forEach var="r" items="${reviews}">
					<div class="review-list-gh">
						<div class="detail-profile-gh">
							<div class="detail-review-profile">
								<img src="${r.u_profile }">
							</div>
							<h6 class="detail-name-gh">${r.r_owner }</h6>
							<div class="recommend-radio-gh">
								<c:set var="r.r_type" value="1" />
								<c:choose>
									<c:when test="${r.r_type eq 1}">
										<div>이 책을 추천합니다</div>
									</c:when>
									<c:when test="${r.r_type eq 2}">
										<div>이 책을 추천하지 않습니다</div>
									</c:when>
									<c:otherwise>
										<div> </div>
									</c:otherwise>
								</c:choose>
							</div>
							<h6 class="detail-date-gh">
								<fmt:formatDate value="${r.r_date }"
									pattern="yyyy-MM-dd / HH:mm" />
							</h6>
						</div>
						<div class="detail-review-contents">
							<h6>${r.r_contents }</h6>
						</div>
						<div class="detail-review-reputation">
							<input hidden class="user_id" value="${sessionScope.user.u_id }">
							<input hidden class="like-no" value="${r.r_no }">
							<input hidden class="like-check" value="${r.likeCheck}">
							<input hidden class="like-type" value="REVIEW">
							<!----------------------------------------------------------------->
							<button class="reviewLikeBtn like-dislike" value="1">
								<img class="reviewLikeImg like-dislike-img"
									src="/img/review_like.png"> <span class="reviewLikeCnt"><fmt:formatNumber
										value="${r.r_like }" pattern="#,###" /></span>
							</button>
							<button class="reviewDislikeBtn like-dislike" value="2">
								<img class="reviewDislikeImg like-dislike-img"
									src="/img/review_dislike.png"> <span
									class="reviewDislikeCnt"><fmt:formatNumber
										value="${r.r_dislike }" pattern="#,###" /></span>
							</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>