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
	<div class="post_detail_background">
		<br> <br>
		<div>
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
				<button class="post_like_icon">
					<img alt="" src="/img/like_icon.png"> &nbsp;
					<div>${communityPost.cp_like }</div>
				</button>
				<button class="post_dislike_icon">
					<img alt="" src="/img/dislike_icon.png"> &nbsp;
					<div>${communityPost.cp_dislike }</div>
				</button>
				<div class="post_chat_icon">
					<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png"> &nbsp;
					<div>0</div>
				</div>
			</div>
			<br>
			<hr class="post_line">
			<br><br>
				<c:forEach var="cr" items="${communityReplys }">
				<div class="post_reply_background">
					<br>
					<div class="reply_user">${cr.cr_owner }</div>
					<div class="reply_txt">${cr.cr_contents }</div>
					<div class="reply_date">
						<fmt:formatDate value="${cr.cr_date }" pattern="MM/dd HH:mm" />
					</div>
					<br>
				</div>
				<br><br>
			</c:forEach>

		</div>
		<div class="post_reply_input">
		<div class="post_reply_box">
			<div class="box_shadow_reply">
				<input class="commu_seach" placeholder="댓글을 입력하세요.">
				<button class="commu_seach_btn">
					<img src="/img/전송버튼_icon.png" maxlength=10>
				</button>
			</div>
		</div>
		</div>
	</div>



</body>
</html>