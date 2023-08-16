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
	<div class="post_background">
		<br>
		<br>
		<div >
		<div class="post_detail">
			<div class="post_user_img">
				<img alt="" src="/img/유저 img.jpg">
			</div>
			<div class="post_info">
				<div class="post_user_info">
					<div class="post_user">${communityPost.cp_owner }</div>
					<div class="post_user_grade">유저 등급</div>
				</div>
				<div class="post_time">
					<fmt:formatDate value="${communityPost.cp_date }"
						pattern="MM/dd hh:mm" />
				</div>
			</div>
			<div class="post_menu_etc">
				<img alt="" src="/img/menu_etc.png">
			</div>
		</div>
		<br>
		<div class="post">
			<div class="post_cp_title">${communityPost.cp_title }</div>
			<div class="post_cp_contents">${communityPost.cp_contents}</div>
		</div>
		<br>
		<div class="post_icon">
			<div class="post_like">
				<img src="/img/like_icon.png"> ${communityPost.cp_like }
			</div>
			&nbsp;&nbsp;
			<div class="post_dislike">
				<img alt="" src="/img/dislike_icon.png"> ${communityPost.cp_dislike }
			</div>
			&nbsp;&nbsp;
			<div class="post_chat">
				<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png">0
			</div>
		</div>
		</div>
	<div class="post_reply_input">댓글input</div>
	</div>



</body>
</html>