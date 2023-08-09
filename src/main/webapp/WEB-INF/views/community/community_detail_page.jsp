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

	<div class="board_menu">
		<form action="/go.commu.post">
			<button name="cp_no" value=""
				class="left_arrow">
				<img src="/img/leftArrow.png">
			</button>
		</form>
		<div class="community_name">${community.c_name }</div>
		<button class="board_seach_btn">
			<img src="/img/seachBtn.png" maxlength=10>
		</button>
	</div>
	<div class="commu_contents">
		<div class="commu_post_background">
			<div class="commu_post_contents">
				<div> ${communityPost.cp_owner }
							<div class="post_date">
							 <div> <fmt:formatDate value="${communityPost.cp_date }" type="both"/>  </div>
							</div>
				</div>
				<div class="post_title">${communityPost.cp_title }</div>
				<div class="post_contents">${communityPost.cp_contents }</div>
				<div class="post_icon">
					<div class="post_like">
						<img src="/img/like.png"> ${communityPost.cp_like }
					</div>
					&nbsp;
					<div class="post_dislike">
						<img src="/img/dislike.png"> ${communityPost.cp_dislike }
					</div>
					&nbsp;
					<div class="post_reply">
						<img src="/img/chat.png"> 0
					</div>
				</div>
				<hr id="line">
			</div>
			<div>
				<div>댓글 결과</div>
			</div>
		</div>
		<!-- 	<div>댓글 input</div> -->
	</div>

</body>
</html>