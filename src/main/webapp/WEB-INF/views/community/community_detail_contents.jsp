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
	<input hidden="hidden" id="c-no" value="${community.c_no }">
	<div class="post_detail_background">
		<br>
		<div class="white-line">
			<div class="post_detail">
				<c:if test="${communityPost.cp_owner == sessionScope.user.u_id }">
					<div class="post_user_img">
						<img alt="" src="${sessionScope.user.u_profile }">
					</div>
				</c:if>
				
				<div class="post_info">
					<div class="post_user_info">
						<div class="post_user">${communityPost.cp_owner }</div>
						<div class="post_user_grade"></div>
					</div>
					<div class="post_time">
						<fmt:formatDate value="${communityPost.cp_date }"
							pattern="MM/dd hh:mm" />
					</div>
				</div>
				<c:if test="${communityPost.cp_owner == sessionScope.user.u_id }">
					<div class="menu-etc-onoff">
						<div id="post_menu_etc">
							<button name="cp_no" value="${communityPost.cp_no }"
								class="menu-etc-btn" onclick="showMenu(this)">
								<img alt="" src="/img/menu_etc.png">
							</button>
						</div>
						<div id="menu-etc">
							<img alt="" src="/img/etc-btn2.png">
							<div class="etc-btn">
								<form action="/go.update.post">
									<input type="hidden" name="c_no" value="${community.c_no }">
									<button name="cp_no" value="${communityPost.cp_no }"
										class="etc-btn-1">수정</button>
								</form>
								<br> <br>
								<button id="delete-post-btn" value="${communityPost.cp_no }"
									class="etc-btn-2">삭제</button>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<br>
			<div class="post">
				<div class="post_cp_title">${communityPost.cp_title }</div>
				<div class="post_cp_contents">${communityPost.cp_contents}</div>
			</div>
			<br>
			<div class="post_icon">
				<button class="post_like_icon" value="${communityPost.cp_no }">
					<img alt="" src="/img/like_icon.png"> &nbsp;
					<div>${communityPost.cp_like }</div>
				</button>
				<button class="post_dislike_icon">
					<img alt="" src="/img/dislike_icon.png"> &nbsp;
					<div>${communityPost.cp_dislike }</div>
				</button>
				<div class="post_chat_icon">
					<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png"> &nbsp;
					<div>${countReplys }</div>
				</div>
			</div>
			<br>
			<hr class="post_line">
			<br> <br>
			<c:forEach var="cr" items="${communityReplys }">
				<div class="post_reply_background">
					<br>
					<div class="reply_user">${cr.cr_owner }</div>
					<div class="reply_txt">${cr.cr_contents }</div>
					<div class="reply_date">
						<fmt:formatDate value="${cr.cr_date }" pattern="MM/dd HH:mm" />

						<c:if test="${cr.cr_owner == sessionScope.user.u_id }">
							<div class="empty-width"></div>
							<button
								onclick="deleteReply('${cr.cr_no}', '${communityPost.cp_no }', '${community.c_no }')"
								class="delete-reply-btn">삭제</button>
						</c:if>

					</div>
					<br>
				</div>
				<br>
				<br>
			</c:forEach>

		</div>
		<form action="/reg.reply">
			<input hidden="hidden" name="cp_no" value="${communityPost.cp_no }">
			<input hidden="hidden" name="c_no" value="${community.c_no }">
			<div class="post_reply_input">
				<div class="box_shadow_reply">
					<div class="box-shadow-1">
						<textarea name="cr_contents" rows="1" class="post_reply_text"
							onkeydown="resize(this)" onkeyup="resize(this)"
							placeholder="댓글을 입력하세요."></textarea>
					</div>
					<div class="box-shadow-2">
						<button name="cr_cp_no" value="${communityPost.cp_no }"
							class="commu_seach_btn">
							<img src="/img/전송버튼_icon.png" maxlength=10>
						</button>
					</div>
				</div>
			</div>
		</form>
		<div class="empty_space"></div>
	</div>

	<dialog id="deleteModal">
	<div class="delete-background">
		<div class="delete-text">삭제하시겠습니까?</div>
		<div class="delete-flex">
			<button id="back-btn">취소</button>
			<button id="delete-ok">확인</button>
		</div>
	</div>
	</dialog>





</body>
<script type="text/javascript"
	src="js/community/communityDetailContents.js"></script>
</html>