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
			<button class="post_contents">
				<div class="post_title">${cp.cp_title }</div>
				<div class="post_txt">${cp.cp_contents }</div>
				<div class="post_flex">
					<div class="post_flex_left">
						<div>${cp.cp_date2 }</div>
						&nbsp;|&nbsp;
						<div>${cp.cp_owner }</div>
					</div>
					<div class="post_flex_right">
						<div class="post_like">
							<img src="/img/like_icon.png"> ${cp.cp_like }
						</div>
						&nbsp;&nbsp;
						<div class="post_dislike">
							<img alt="" src="/img/dislike_icon.png"> ${cp.cp_dislike }
						</div>
						&nbsp;&nbsp;
						<div class="post_chat">
							<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png">0
						</div>
					</div>
				</div>
			</button>
			<br>
			<hr class="line">
		</c:forEach>
	 <div class="empty_space"></div> 
	</div>
	<div class="post_writing">
		<button>+ 글쓰기</button>
	</div>
</body>
</html>