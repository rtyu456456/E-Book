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
		<form action="/">
			<button class="left_arrow">
				<img src="/img/leftArrow.png">
			</button>
		</form>
		<div class="community_name">${communityName.c_name }</div>
		<button class="board_seach_btn">
			<img src="/img/seachBtn.png" maxlength=10>
		</button>
	</div>
	<div class="commu_contents">
		<div class="commu_post_background">
			<div class="commu_post_contents">
				<c:forEach var="cp" items="${communityPost }">
					<button>
						<div class="post_title">${cp.cp_title }</div>
						<div class="post_contents">${cp.cp_contents }</div>
						<div class="post_icons">
							<div class="post_date">
							<div>${cp.cp_date }</div>
							</div> &nbsp;&nbsp;&nbsp;
							<div class="post_owner">${cp.cp_owner }</div>
							<div class="post_icon">
								<div class="post_like">
									<img src="/img/like.png"> ${cp.cp_like }
								</div>
								&nbsp;
								<div class="post_dislike">
									<img src="/img/dislike.png"> ${cp.cp_dislike }
								</div>
								&nbsp;
								<div class="post_reply">
									<img src="/img/chat.png"> 0
								</div>
							</div>
						</div>
					</button>
					<hr id="line">
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>