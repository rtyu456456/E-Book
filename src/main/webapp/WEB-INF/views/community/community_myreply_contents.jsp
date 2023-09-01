<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="post_background">
		<c:forEach var="cp" items="${communityPosts }">
			<form action="/go.commu.detail">
				<input type="hidden" name="c_no" value="${cp.cp_community }">
				<button id="longPressButton" class="post_contents" name="cp_no"
					value="${cp.cp_no }">
					<div class="post_title">${cp.cp_title }</div>
					<div class="post_txt">${cp.cp_contents }</div>
					<div class="post_flex">
						<div class="post_flex_left">
							<div>${cp.cp_date2 }</div>
							&nbsp;|&nbsp;
							<div>${cp.cp_owner }</div>
						</div>
						<div class="post_flex_right">
							<div class="post_like" style="color: #F66E6E;">
								<img
									style="filter: invert(73%) sepia(22%) saturate(3202%) hue-rotate(311deg) brightness(94%) contrast(105%);"
									src="/img/dislike_icon.png"> ${cp.cp_like }
							</div>
							&nbsp;&nbsp;
							<div class="post_dislike" style="color: #4677AF;">
								<img
									style="filter: invert(74%) sepia(46%) saturate(4423%) hue-rotate(186deg) brightness(70%) contrast(93%);"
									alt="" src="/img/dislike_icon.png">${cp.cp_dislike }
							</div>
							&nbsp;&nbsp;
							<div class="post_chat">
								<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png">${cp.cp_reviewCnt }
							</div>
						</div>
					</div>
				</button>
			</form>
			<br>
			<hr class="line">
		</c:forEach>
	</div>
</body>

</html>